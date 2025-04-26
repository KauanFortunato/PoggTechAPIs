<?php

namespace App\Models;

class FCM
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function saveToken($user_id, $token)
    {
        $stmt = $this->conn->prepare("SELECT * FROM users_tokens WHERE user_id = ? AND token = ?");
        $stmt->bind_param("is", $user_id, $token);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            if ($result->num_rows == 0) {
                $stmt->close();
                $stmt = $this->conn->prepare("INSERT INTO users_tokens (user_id, token) VALUES (?, ?)");
                $stmt->bind_param("is", $user_id, $token);
                $stmt->execute();
                $stmt->close();
                return ["success" => true, "message" => "Token salvo com sucesso"];
            } else {
                $stmt->close();
                return ["success" => false, "message" => "Token já existe"];
            }
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }

    public function removeToken($user_id, $token)
    {
        $stmt = $this->conn->prepare("DELETE FROM users_tokens WHERE user_id = ? AND token = ?");
        $stmt->bind_param("is", $user_id, $token);

        if ($stmt->execute()) {
            if ($stmt->affected_rows > 0) {
                $stmt->close();
                return ["success" => true, "message" => "Token removido com sucesso"];
            } else {
                $stmt->close();
                return ["success" => false, "message" => "Token não encontrado"];
            }
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao remover token: $error"];
        }
    }

    public function getToken($user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM users_tokens WHERE user_id = ?");
        $stmt->bind_param("i", $user_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            if ($result->num_rows > 0) {
                $tokens = [];
                while ($row = $result->fetch_assoc()) {
                    $tokens[] = $row['token'];
                }
                return ["success" => true, "tokens" => $tokens];
            } else {
                return ["success" => false, "message" => "Nenhum token encontrado"];
            }
        } else {
            $error = $stmt->error;
            return ["success" => false, "message" => "Erro ao pegar tokens: $error"];
        }
    }
}
