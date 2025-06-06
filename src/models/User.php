<?php

namespace App\Models;

use PDO;
use PDOException;

class User
{
    private $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function createUser($firebase_uid, $name, $last_name, $email, $phone, $avatar)
    {
        try {
            $sql = "INSERT INTO users (firebase_uid, name, last_name, email, avatar, phone) 
                    VALUES (:firebase_uid, :name, :last_name, :email, :avatar, :phone)";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':firebase_uid' => $firebase_uid,
                ':name' => $name,
                ':last_name' => $last_name,
                ':email' => $email,
                ':avatar' => $avatar,
                ':phone' => $phone
            ]);

            return ["success" => true, "message" => "Cadastro Concluído."];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao cadastrar: " . $e->getMessage()];
        }
    }

    public function getUserByFirebaseUid($firebase_uid)
    {
        try {
            $sql = "SELECT * FROM users WHERE firebase_uid = :firebase_uid";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':firebase_uid' => $firebase_uid]);

            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user) {
                return ["success" => true, "data" => $user];
            } else {
                return ["success" => false, "message" => "Usuário não encontrado"];
            }
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function getUserById($user_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM users WHERE user_id = :user_id");
            $stmt->execute([':user_id' => $user_id]);
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return null;
        }
    }

    public function updateUser($name, $last_name, $phone, $firebase_uid)
    {
        try {
            $sql = "UPDATE users SET name = :name, last_name = :last_name, phone = :phone 
                    WHERE firebase_uid = :firebase_uid";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':name' => $name,
                ':last_name' => $last_name,
                ':phone' => $phone,
                ':firebase_uid' => $firebase_uid
            ]);

            return ["success" => true, "message" => "Usuário alterado com sucesso"];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao atualizar usuário: " . $e->getMessage()];
        }
    }
}
