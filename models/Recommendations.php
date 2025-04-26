<?php

namespace App\Models;

class Recommendations
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function addUserHistory($user_id, $product_id, $action)
    {
        $stmt = $this->conn->prepare("INSERT INTO user_history (user_id, product_id, action) VALUES (?, ?, ?)");

        if (!$stmt) {
            return ["success" => false, "message" => "Erro ao preparar SQL: " . $this->conn->error];
        }

        $stmt->bind_param("iis", $user_id, $product_id, $action);

        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Histórico adicionado com sucesso."];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao adicionar histórico: " . $error];
        }
    }
}
