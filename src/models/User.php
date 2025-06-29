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

    public function createUser($firebase_uid, $name, $email, $avatar)
    {
        try {
            $sql = "INSERT INTO users (firebase_uid, name, email, avatar) 
                    VALUES (:firebase_uid, :name, :email, :avatar)";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':firebase_uid' => $firebase_uid,
                ':name' => $name,
                ':email' => $email,
                ':avatar' => $avatar,
            ]);

            return ["success" => true, "message" => "Cadastro Concluído."];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao cadastrar: " . $e->getMessage()];
        }
    }

    public function deleteUser($firebase_uid)
    {
        try {
            $stmt = $this->conn->prepare("DELETE FROM users WHERE firebase_uid = :firebase_uid");
            $stmt->execute([':firebase_uid' => $firebase_uid]);

            if ($stmt->rowCount() > 0) {
                return ["success" => true, "message" => "Utilizador deletado com sucesso"];
            } else {
                return ["success" => false, "message" => "Utilizador não encontrado"];
            }
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao deletar utilizador: " . $e->getMessage()];
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
                addAvatarUrl($user);
                return ["success" => true, "data" => $user];
            } else {
                return ["success" => false, "message" => "Utilizador não encontrado"];
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
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            addAvatarUrl($user);

            return $user;
        } catch (PDOException $e) {
            return null;
        }
    }

    public function updateUser($name, $phone, $firebase_uid, $type)
    {
        try {
            $sql = "UPDATE users SET name = :name, phone = :phone, type = :type
                    WHERE firebase_uid = :firebase_uid";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':name' => $name,
                ':phone' => $phone,
                ':firebase_uid' => $firebase_uid,
                ':type' => $type
            ]);

            return ["success" => true, "message" => "Utilizador alterado com sucesso"];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao atualizar utilizador: " . $e->getMessage()];
        }
    }

    public function updateAccountStatus($userId, $isActive)
    {
        try {
            $sql = "UPDATE users SET isActive = :isActive
                    WHERE user_id = :userId";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':isActive' => $isActive,
                ':userId' => $userId,
            ]);

            return ["success" => true, "message" => "Status de conta alterado com sucesso."];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao atualizar status: " . $e->getMessage()];
        }
    }

    public function updateEmail($userId, $newEmail)
    {
        try {
            $sql = "UPDATE users SET email = :email
                    WHERE user_id = :userId";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':email' => $newEmail,
                ':userId' => $userId,
            ]);

            return ["success" => true, "message" => "Email alterado com sucesso"];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao atualizar utilizador: " . $e->getMessage()];
        }
    }

    public function updateUserAvatar($firebase_uid, $file)
    {
        try {
            if (!isset($file) || $file['error'] !== UPLOAD_ERR_OK) {
                return ["success" => false, "message" => "Falha no upload do arquivo"];
            }

            // 1. Buscar avatar atual
            $stmt = $this->conn->prepare("SELECT avatar FROM users WHERE firebase_uid = :firebase_uid");
            $stmt->execute([':firebase_uid' => $firebase_uid]);
            $current = $stmt->fetch(PDO::FETCH_ASSOC);
            $oldAvatar = $current ? $current['avatar'] : null;

            // 2. Preparar diretório
            $uploadDir = __DIR__ . '/../../uploads/avatars/';
            if (!file_exists($uploadDir)) {
                mkdir($uploadDir, 0775, true);
            }

            // 3. Criar nome único e mover
            $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
            $uniqueName = uniqid('avatar_', true) . '.' . $ext;
            $relativePath = 'uploads/avatars/' . $uniqueName;
            $uploadPath = $uploadDir . $uniqueName;

            if (!move_uploaded_file($file['tmp_name'], $uploadPath)) {
                return ["success" => false, "message" => "Erro ao mover arquivo para pasta de destino"];
            }

            // Atualizar no banco
            $stmt = $this->conn->prepare("UPDATE users SET avatar = :avatar WHERE firebase_uid = :firebase_uid");
            $stmt->execute([
                ':avatar' => $uniqueName,
                ':firebase_uid' => $firebase_uid
            ]);

            $publicUrl = BASE_URL . 'uploads/avatars/' . $uniqueName;

            // 5. Apagar imagem anterior (se for um arquivo real)
            if ($oldAvatar) {
                $oldRelativePath = str_replace(BASE_URL, '', $oldAvatar);
                $oldFullPath = __DIR__ . '/../../' . $oldRelativePath;

                if (file_exists($oldFullPath)) {
                    unlink($oldFullPath);
                }
            }

            return ["success" => true, "message" => "Avatar atualizado com sucesso", "data" => $publicUrl];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro no banco: " . $e->getMessage()];
        }
    }

    public function getAllUsers()
    {
        try {
            $stmt = $this->conn->query("SELECT * FROM users");
            $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($users as &$user) {
                if (isset($user['avatar'])) {
                    $user['avatar'] = BASE_URL . 'uploads/avatars/' . $user['avatar'];
                }
            }
            return ["success" => true, "data" => $users];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar usuários: " . $e->getMessage()];
        }
    }
}

function addAvatarUrl(&$user)
{
    if (isset($user['avatar'])) {
        $user['avatar'] = BASE_URL . 'uploads/avatars/' . $user['avatar'];
    }
}
