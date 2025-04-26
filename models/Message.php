<?php

namespace App\Models;

class Message
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function createChat($product_id)
    {
        $stmt = $this->conn->prepare("INSERT INTO chats (product_id) VALUES (?)");

        if (!$stmt) {
            return ["success" => false, "message" => "SQL Prepare Error: " . $this->conn->error];
        }

        $stmt->bind_param("i", $product_id);

        if ($stmt->execute()) {
            $chat_id = $this->conn->insert_id;
            $stmt->close();
            return ["success" => true, "message" => "Chat criado com sucesso.", "chat_id" => $chat_id];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao criar chat."];
        }
    }

    public function sendMessage($sender_id, $receiver_id, $chat_id, $message)
    {
        $stmt = $this->conn->prepare("INSERT INTO messages (chat_id, sender_id, receiver_id, message, is_read) VALUES (?, ?, ?, ?, 0)");
        $stmt->bind_param("iiis", $chat_id, $sender_id, $receiver_id, $message);

        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Mensagem enviada com sucesso."];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao enviar mensagem."];
        }
    }

    public function getMessages($product_id, $chat_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_message_details WHERE product_id = ? AND chat_id = ? ORDER BY timestamp ASC");

        if (!$stmt) {
            return ["success" => false, "message" => "SQL Prepare Error: " . $this->conn->error];
        }

        $stmt->bind_param("ii", $product_id, $chat_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $messages = $result->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return ["success" => true, "messages" => $messages];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }

    public function getLastMessage($product_id, $receiver_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_message_details WHERE product_id = ? AND (receiver_id = ?) ORDER BY timestamp DESC");
        $stmt->bind_param("iii", $product_id, $receiver_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $messages = $result->fetch_assoc();
            $stmt->close();
            return ["success" => true, "messages" => $messages];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }

    public function getUserChatsBuy($user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_user_chats WHERE user_id = ? AND owner_id != ? ORDER BY last_message_time DESC");

        if (!$stmt) {
            return ["success" => false, "message" => "SQL Prepare Error: " . $this->conn->error];
        }

        $stmt->bind_param("ii", $user_id, $user_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $chats = [];

            while ($chat  = $result->fetch_assoc()) {
                $chat_id = $chat["chat_id"];

                $resultUnread = $this->getUnread($chat_id, $user_id);
                $chat["unread_count"] = $resultUnread["unread_count"];

                $chats[] = $chat;
            }

            $stmt->close();
            return ["success" => true, "chats" => $chats];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }

    public function getUserChatsSell($user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_user_chats WHERE user_id = ? AND owner_id = ? ORDER BY last_message_time DESC");

        if (!$stmt) {
            return ["success" => false, "message" => "SQL Prepare Error: " . $this->conn->error];
        }

        $stmt->bind_param("ii", $user_id, $user_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $chats = [];

            while ($chat  = $result->fetch_assoc()) {
                $chat_id = $chat["chat_id"];

                $resultUnread = $this->getUnread($chat_id, $user_id);
                $chat["unread_count"] = $resultUnread["unread_count"];

                $chats[] = $chat;
            }

            $stmt->close();
            return ["success" => true, "chats" => $chats];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }

    public function getChat($user_id, $product_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_user_chats WHERE user_id = ? AND product_id = ?");

        if (!$stmt) {
            return ["success" => false, "message" => "SQL Prepare Error: " . $this->conn->error];
        }

        $stmt->bind_param("ii", $user_id, $product_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
                $stmt->close();
                return ["success" => false, "message" => "Chat não encontrado"];
            }

            $chat = $result->fetch_assoc();
            $stmt->close();

            return ["success" => true, "chat" => $chat];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar chat: $error"];
        }
    }

    public function markIsRead($chat_id, $receiver_id)
    {
        $stmt = $this->conn->prepare("UPDATE messages SET is_read = 1 WHERE chat_id = ? AND receiver_id = ?");
        $stmt->bind_param("ii", $chat_id, $receiver_id);

        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Messagem(s) lida(s) com sucesso."];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao marcar mensagem como lida: $error"];
        }
    }

    public function getUnread($chat_id, $receiver_id)
    {
        $stmt = $this->conn->prepare("SELECT COUNT(*) AS unread_count FROM messages WHERE receiver_id = ? AND chat_id = ? AND is_read = 0 ");
        $stmt->bind_param("ii", $receiver_id, $chat_id);
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $unread = $result->fetch_assoc();
            $stmt->close();
            return ["success" => true, "unread_count" => $unread["unread_count"]];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }
}
