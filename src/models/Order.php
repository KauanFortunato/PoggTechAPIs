<?php

namespace App\Models;

use PDO;

class Order
{
    private PDO $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function getAllOrders()
    {
        try {
            $stmt = $this->conn->prepare("
                SELECT *
                FROM orders
                ORDER BY created_at DESC
            ");
            $stmt->execute();
            $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return [
                "success" => true,
                "message" => "Pedidos encontrados",
                "data" => $orders
            ];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao encontar pedidos" . $e->getMessage(), "data" => null];
        }
    }

    public function registerOrder($user_id, $location, $user_name, $user_phone, $items)
    {
        try {
            $total = 0;
            foreach ($items as $item) {
                $total += $item['unitPrice'] * $item['quantity'];
            }

            // Verificar saldo
            $stmt = $this->conn->prepare("SELECT balance FROM wallet WHERE user_id = :user_id");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->execute();
            $wallet = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$wallet) {
                return ["success" => false, "message" => "Carteira não encontrada", "data" => null];
            }

            $balance = $wallet['balance'];
            $status = ($balance < $total) ? 'pendente' : 'pago';

            // Criar pedido
            $stmt = $this->conn->prepare("
            INSERT INTO orders (user_id, total_amount, status, location, user_name, user_phone)
            VALUES (:user_id, :total, :status, :location, :user_name, :user_phone)
            ");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->bindParam(':total', $total);
            $stmt->bindParam(':status', $status);
            $stmt->bindParam(':location', $location);
            $stmt->bindParam(':user_name', $user_name);
            $stmt->bindParam(':user_phone', $user_phone);
            $stmt->execute();

            $orderId = $this->conn->lastInsertId();

            if ($balance >= $total) {
                // Inserir itens e atualizar stock
                $stmtInsert = $this->conn->prepare("
                INSERT INTO order_items (order_id, product_id, quantity, unit_price)
                VALUES (:order_id, :product_id, :quantity, :unit_price)
                ");
                $stmtUpdateStock = $this->conn->prepare("
                UPDATE products SET quantity = quantity - :quantity WHERE product_id = :product_id
                ");
                foreach ($items as $item) {
                    $stmtInsert->bindParam(':order_id', $orderId, PDO::PARAM_INT);
                    $stmtInsert->bindParam(':product_id', $item['product_id'], PDO::PARAM_INT);
                    $stmtInsert->bindParam(':quantity', $item['quantity'], PDO::PARAM_INT);
                    $stmtInsert->bindParam(':unit_price', $item['unitPrice']);
                    $stmtInsert->execute();

                    $stmtUpdateStock->bindParam(':product_id', $item['product_id'], PDO::PARAM_INT);
                    $stmtUpdateStock->bindParam(':quantity', $item['quantity'], PDO::PARAM_INT);
                    $stmtUpdateStock->execute();
                }

                // Atualizar carteira
                $stmt = $this->conn->prepare("UPDATE wallet SET balance = balance - :amount WHERE user_id = :user_id");
                $stmt->bindParam(':amount', $total);
                $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $stmt->execute();

                // Remover do carrinho
                $stmt = $this->conn->prepare("DELETE FROM saved WHERE user_id = :user_id AND tipo = 0");
                $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $stmt->execute();

                // Registrar pagamento
                $stmt = $this->conn->prepare("
                INSERT INTO payments (order_id, user_id, amount, status)
                VALUES (:order_id, :user_id, :amount, 'concluido')
            ");
                $stmt->bindParam(':order_id', $orderId, PDO::PARAM_INT);
                $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $stmt->bindParam(':amount', $total);
                $stmt->execute();

                return ["success" => true, "message" => "Compra realizada com sucesso", "data" => $orderId];
            }

            // Registrar pagamento falhou
            $stmt = $this->conn->prepare("
            INSERT INTO payments (order_id, user_id, amount, status)
            VALUES (:order_id, :user_id, :amount, 'falhou')
        ");
            $stmt->bindParam(':order_id', $orderId, PDO::PARAM_INT);
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->bindParam(':amount', $total);
            $stmt->execute();

            return [
                "success" => false,
                "message" => "Saldo insuficiente. Pedido registrado como pendente.",
                "data" => $orderId
            ];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao registrar pedido: " . $e->getMessage(), "data" => null];
        }
    }


    public function getOrders($user_id)
    {
        try {
            $ordersQuery = $this->conn->prepare(query: "
                SELECT *
                FROM orders
                WHERE user_id = :user_id AND status != 'pendente'
                ORDER BY created_at DESC
            ");
            $ordersQuery->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $ordersQuery->execute();
            $orders = $ordersQuery->fetchAll(PDO::FETCH_ASSOC);

            $result = [];

            foreach ($orders as $order) {
                $order_id = (int) $order['id'];
                $created_at_format = date('d-m, Y', strtotime($order['created_at']));

                // Imagens dos produtos
                $imgStmt = $this->conn->prepare("
                    SELECT p.cover
                    FROM order_items oi
                    JOIN products p ON oi.product_id = p.product_id
                    WHERE oi.order_id = :order_id
                    LIMIT 3
                ");
                $imgStmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
                $imgStmt->execute();
                $images = $imgStmt->fetchAll(PDO::FETCH_COLUMN);

                // Contar total de produtos, levando em consideração a quantidade de cada produto
                $countStmt = $this->conn->prepare("SELECT SUM(quantity) AS total_products FROM order_items WHERE order_id = :order_id");
                $countStmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
                $countStmt->execute();
                $count = $countStmt->fetch(PDO::FETCH_ASSOC);


                $result[] = [
                    'id' => $order['id'],
                    'total_amount' => $order['total_amount'],
                    'user_name' => $order['user_name'],
                    'user_phone' => $order['user_phone'],
                    'location' => $order['location'],
                    'status' => $order['status'],
                    'shipping_status' => $order['shipping_status'],
                    'created_at' => $order['created_at'],
                    'created_at_format' => $created_at_format,
                    'images' => $images,
                    'total_products' => $count['total_products']
                ];
            }

            return ["success" => true, "message" => "Pedidos encontrados", "data" => $result];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar pedidos: " . $e->getMessage(), "data" => null];
        }
    }

    public function getOrderItems($order_id)
    {
        try {
            // Itens do pedido
            $stmt = $this->conn->prepare("
                SELECT * FROM v_order_details
                WHERE order_id = :order_id
            ");
            $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
            $stmt->execute();
            $items = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!$items) {
                return ["success" => false, "message" => "Pedido não encontrado", "data" => null];
            }

            return [
                "success" => true,
                "message" => "Detalhes do pedido encontrados",
                "data" => $items
            ];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar detalhes do pedido: " . $e->getMessage(), "data" => null];
        }
    }

    public function updateShipping($order_id, $newStatus)
    {
        try {
            // Atualizar o status de envio
            $stmt = $this->conn->prepare("UPDATE orders SET shipping_status = :newStatus WHERE id = :order_id");
            $stmt->bindParam(':newStatus', $newStatus);
            $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
            $stmt->execute();

            // Buscar o user_id do pedido
            $stmt = $this->conn->prepare("SELECT user_id FROM orders WHERE id = :order_id");
            $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
            $stmt->execute();
            $order = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$order) {
                return ["success" => false, "message" => "Pedido não encontrado", "data" => null];
            }

            $user_id = $order['user_id'];

            return [
                "success" => true,
                "message" => "Status de envio atualizado com sucesso",
                "data" => [
                    "user_id" => $user_id,
                    "shipping_status" => $newStatus
                ]
            ];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao dar update no status de envio" . $e->getMessage(), "data" => null];
        }
    }
}
