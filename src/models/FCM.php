<?php

namespace App\Models;

use PDO;

class FCM
{
    private PDO $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function saveToken($user_id, $token)
    {
        try {
            // Verifica se o token já existe
            $stmt = $this->conn->prepare("SELECT COUNT(*) FROM users_tokens WHERE user_id = :user_id AND token = :token");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->bindParam(':token', $token, PDO::PARAM_STR);
            $stmt->execute();

            if ($stmt->fetchColumn() == 0) {
                // Insere o token
                $stmt = $this->conn->prepare("INSERT INTO users_tokens (user_id, token) VALUES (:user_id, :token)");
                $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $stmt->bindParam(':token', $token, PDO::PARAM_STR);
                $stmt->execute();

                return ["success" => true, "message" => "Token salvo com sucesso"];
            } else {
                return ["success" => false, "message" => "Token já existe"];
            }
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao salvar token: " . $e->getMessage()];
        }
    }

    public function removeToken($user_id, $token)
    {
        try {
            $stmt = $this->conn->prepare("DELETE FROM users_tokens WHERE user_id = :user_id AND token = :token");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->bindParam(':token', $token, PDO::PARAM_STR);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                return ["success" => true, "message" => "Token removido com sucesso"];
            } else {
                return ["success" => false, "message" => "Token não encontrado"];
            }
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao remover token: " . $e->getMessage()];
        }
    }

    public function getToken($user_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT token FROM users_tokens WHERE user_id = :user_id");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->execute();

            $tokens = $stmt->fetchAll(PDO::FETCH_COLUMN);

            if (!empty($tokens)) {
                return ["success" => true, "message" => "Tokens encontrados", "tokens" => $tokens];
            } else {
                return ["success" => false, "message" => "Nenhum token encontrado"];
            }
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar tokens: " . $e->getMessage()];
        }
    }
}
