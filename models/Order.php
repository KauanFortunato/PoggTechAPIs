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
}
