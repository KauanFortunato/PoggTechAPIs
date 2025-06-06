<?php

namespace App\Models;

use PDO;

class Message
{
    private PDO $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function createChat($product_id)
    {
        try {
            $stmt = $this->conn->prepare("INSERT INTO chats (product_id) VALUES (:product_id)");
            $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
            $stmt->execute();
            $chat_id = $this->conn->lastInsertId();
            return ["success" => true, "message" => "Chat criado com sucesso.", "chat_id" => $chat_id];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao criar chat: " . $e->getMessage()];
        }
    }

    public function sendMessage($sender_id, $receiver_id, $chat_id, $message)
    {
        try {
            $stmt = $this->conn->prepare("INSERT INTO messages (chat_id, sender_id, receiver_id, message, is_read) VALUES (:chat_id, :sender_id, :receiver_id, :message, 0)");
            $stmt->bindParam(':chat_id', $chat_id, PDO::PARAM_INT);
            $stmt->bindParam(':sender_id', $sender_id, PDO::PARAM_INT);
            $stmt->bindParam(':receiver_id', $receiver_id, PDO::PARAM_INT);
            $stmt->bindParam(':message', $message, PDO::PARAM_STR);
            $stmt->execute();
            return ["success" => true, "message" => "Mensagem enviada com sucesso."];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao enviar mensagem: " . $e->getMessage()];
        }
    }

    public function getMessages($product_id, $chat_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_message_details WHERE product_id = :product_id AND chat_id = :chat_id ORDER BY timestamp ASC");
            $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
            $stmt->bindParam(':chat_id', $chat_id, PDO::PARAM_INT);
            $stmt->execute();
            $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return ["success" => true, "messages" => $messages];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao pegar mensagens: " . $e->getMessage()];
        }
    }

    public function getLastMessage($product_id, $receiver_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_message_details WHERE product_id = :product_id AND receiver_id = :receiver_id ORDER BY timestamp DESC LIMIT 1");
            $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
            $stmt->bindParam(':receiver_id', $receiver_id, PDO::PARAM_INT);
            $stmt->execute();
            $message = $stmt->fetch(PDO::FETCH_ASSOC);
            return ["success" => true, "messages" => $message];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao pegar mensagem: " . $e->getMessage()];
        }
    }

    public function getBuyingChats($user_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_user_chats WHERE user_id = :user_id AND owner_id != :user_id ORDER BY last_message_time DESC");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->execute();
            $chats = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($chats as &$chat) {
                $unread = $this->getUnreadCount($chat["chat_id"], $user_id);
                $chat["unread_count"] = $unread["unread_count"] ?? 0;
            }

            return ["success" => true, "chats" => $chats];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar chats: " . $e->getMessage()];
        }
    }

    public function getSellingChats($user_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_user_chats WHERE user_id = :user_id AND owner_id = :user_id ORDER BY last_message_time DESC");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->execute();
            $chats = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($chats as &$chat) {
                $unread = $this->getUnreadCount($chat["chat_id"], $user_id);
                $chat["unread_count"] = $unread["unread_count"] ?? 0;
            }

            return ["success" => true, "chats" => $chats];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar chats: " . $e->getMessage()];
        }
    }

    public function getChat($user_id, $product_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_user_chats WHERE user_id = :user_id AND product_id = :product_id");
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
            $stmt->execute();
            $chat = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$chat) {
                return ["success" => false, "message" => "Chat não encontrado"];
            }

            return ["success" => true, "chat" => $chat];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao pegar chat: " . $e->getMessage()];
        }
    }

    public function readMessages($chat_id, $receiver_id)
    {
        try {
            $stmt = $this->conn->prepare("UPDATE messages SET is_read = 1 WHERE chat_id = :chat_id AND receiver_id = :receiver_id");
            $stmt->bindParam(':chat_id', $chat_id, PDO::PARAM_INT);
            $stmt->bindParam(':receiver_id', $receiver_id, PDO::PARAM_INT);
            $stmt->execute();

            return ["success" => true, "message" => "Mensagem(s) lida(s) com sucesso."];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao marcar como lida: " . $e->getMessage()];
        }
    }

    public function getUnreadCount($chat_id, $receiver_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT COUNT(*) AS unread_count FROM messages WHERE receiver_id = :receiver_id AND chat_id = :chat_id AND is_read = 0");
            $stmt->bindParam(':receiver_id', $receiver_id, PDO::PARAM_INT);
            $stmt->bindParam(':chat_id', $chat_id, PDO::PARAM_INT);
            $stmt->execute();
            $unread = $stmt->fetch(PDO::FETCH_ASSOC);

            return ["success" => true, "unread_count" => (int) $unread["unread_count"]];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao contar não lidas: " . $e->getMessage()];
        }
    }
}
