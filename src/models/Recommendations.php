<?php

namespace App\Models;

use PDO;

class Recommendations
{
    private $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function addUserHistory($user_id, $product_id, $action)
    {
        try {
            $stmt = $this->conn->prepare("INSERT INTO user_history (user_id, product_id, action) VALUES (:user_id, :product_id, :action)");
            $stmt->execute([
                ':user_id' => $user_id,
                ':product_id' => $product_id,
                ':action' => $action
            ]);

            return ["success" => true, "message" => "Histórico adicionado com sucesso."];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao adicionar histórico: " . $e->getMessage()];
        }
    }
}
