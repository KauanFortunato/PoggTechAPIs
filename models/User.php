<?php

namespace App\Models;

class User
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function createUser($firebase_uid, $name, $last_name, $email, $phone, $avatar)
    {
        $stmt = $this->conn->prepare("INSERT INTO users (firebase_uid, name, last_name, email, avatar, phone) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssss", $firebase_uid, $name, $last_name, $email, $avatar, $phone);
        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Cadastro Concluído."];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao cadastrar: $error"];
        }
    }

    public function getUserByFirebaseUid($firebase_uid)
    {
        $stmt = $this->conn->prepare("SELECT * FROM users WHERE firebase_uid LIKE ?");
        $stmt->bind_param("s", $firebase_uid);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            $stmt->close();
            return ["success" => true, "user" => $user];
        } else {
            $stmt->close();
            return ["success" => false, "message" => "Usuário não encontrado"];
        }
    }

    public function getUserById($user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM users WHERE user_id LIKE ?");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function updateUser($name, $last_name, $phone, $firebase_uid)
    {
        $stmt = $this->conn->prepare("UPDATE users SET name = ?, last_name = ?, phone = ? WHERE firebase_uid LIKE ?");
        $stmt->bind_param("ssss", $name, $last_name, $phone, $firebase_uid);

        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Usuário alterado com sucesso"];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao preparar update: " . $error];
        }
    }
}
