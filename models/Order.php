<?php

namespace App\Models;

require_once __DIR__ . '/../config/constants.php';

class Order
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function registerOrder($user_id, $items)
    {
        // 1. Calcular total
        $total = 0;
        foreach ($items as $item) {
            $total += $item['unitPrice'] * $item["quantity"];
        }

        // 2. Buscar saldo
        $stmt = $this->conn->prepare("SELECT balance FROM wallet WHERE user_id = ?");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $wallet = $result->fetch_assoc();

        if (!$wallet) {
            return [
                "success" => false,
                "message" => "Carteira não encontrada",
                "data" => null
            ];
        }

        $balance = $wallet['balance'];

        // 3. Criar pedido mesmo que falhe
        $stmt = $this->conn->prepare("INSERT INTO orders (user_id, total_amount, status) VALUES (?, ?, ?)");
        $orderStatus = ($balance < $total) ? 'pendente' : 'pago';
        $stmt->bind_param("ids", $user_id, $total, $orderStatus);
        $stmt->execute();

        if ($stmt->error) {
            return [
                "success" => false,
                "message" => "Erro ao registrar pedido: " . $stmt->error,
                "data" => null
            ];
        }

        $orderId = $this->conn->insert_id;

        // 4. Se tiver saldo, continuar normalmente
        if ($balance >= $total) {
            // Inserir itens
            $stmt = $this->conn->prepare("INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (?, ?, ?, ?)");
            foreach ($items as $item) {
                $stmt->bind_param("iiid", $orderId, $item['product_id'], $item['quantity'], $item['unitPrice']);
                $stmt->execute();
            }

            // Atualizar carteira
            $stmt = $this->conn->prepare("UPDATE wallet SET balance = balance - ? WHERE user_id = ?");
            $stmt->bind_param("di", $total, $user_id);
            $stmt->execute();

            // Remover produtos do carrinho
            $stmt = $this->conn->prepare("DELETE FROM saved WHERE user_id = ? AND tipo = 0 ");
            $stmt->bind_param("i", $user_id);
            $stmt->execute();

            // Registrar pagamento
            $stmt = $this->conn->prepare("INSERT INTO payments (order_id, user_id, amount, status) VALUES (?, ?, ?, 'concluido')");
            $stmt->bind_param("iid", $orderId, $user_id, $total);
            $stmt->execute();

            return [
                "success" => true,
                "message" => "Compra realizada com sucesso",
                "data" => $orderId
            ];
        }

        // 5. Saldo insuficiente → registrar pagamento falhado
        $stmt = $this->conn->prepare("INSERT INTO payments (order_id, user_id, amount, status) VALUES (?, ?, ?, 'falhou')");
        $stmt->bind_param("iid", $orderId, $user_id, $total);
        $stmt->execute();

        return [
            "success" => false,
            "message" => "Saldo insuficiente. Pedido registrado como pendente.",
            "data" => $orderId
        ];
    }

    public function getOrders($user_id)
    {
        $user_id = intval($user_id);

        $result = [];

        $query = "
            SELECT id, total_amount, status, created_at
            FROM orders
            WHERE user_id = $user_id
            ORDER BY created_at DESC";

        $orderResult = $this->conn->query($query);

        if (!$orderResult) {
            echo json_encode(['error' => 'Erro ao buscar pedidos: ' . $this->conn->error]);
            return;
        }

        while ($order = $orderResult->fetch_assoc()) {
            $order_id = intval($order['id']);

            $created_at_raw = $order['created_at'];
            $created_at_formatted = date('d-m, Y', strtotime($created_at_raw));

            // Busca até 4 imagens dos produtos da order
            $imgQuery = "
                SELECT p.cover
                FROM order_items oi
                JOIN products p ON oi.product_id = p.product_id
                WHERE oi.order_id = $order_id
                LIMIT 3";

            $imgResult = $this->conn->query($imgQuery);

            $images = [];
            if ($imgResult) {
                while ($img = $imgResult->fetch_assoc()) {
                    $images[] = $img['cover'];
                }
            }

            $countQuery = "SELECT COUNT(*) AS total_products FROM order_items WHERE order_id = $order_id";
            $countResult = $this->conn->query($countQuery);
            $count = $countResult->fetch_assoc();

            $result[] = [
                'id' => $order['id'],
                'total_amount' => $order['total_amount'],
                'status' => $order['status'],
                'created_at' => $order['created_at'],
                'created_at_format' => $created_at_formatted,
                'images' => $images,
                'total_products' => $count['total_products']
            ];
        }

        return [
            "success" => true,
            "message" => "Pedidos encontrado",
            "data" => $result
        ];
    }
}
