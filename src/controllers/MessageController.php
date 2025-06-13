<?php

namespace App\Controllers;

use App\Models\Message;
use App\Controllers\FCMControler;
use App\Controllers\UserController;
use function App\Utils\sendNotification;

class MessageController
{
    private Message $message;
    private \PDO $conn;

    public function __construct(\PDO $conn)
    {
        $this->conn = $conn;
        $this->message = new Message($conn);
    }

    // CHAT
    public function getBuyingChats($user_id)
    {
        return $this->message->getBuyingChats($user_id);
    }

    public function getSellingChats($user_id)
    {
        return $this->message->getSellingChats($user_id);
    }

    public function getChat($user_id, $product_id)
    {
        return $this->message->getChat($user_id, $product_id);
    }

    public function createChat($product_id, $seller_id, $buyer_id)
    {
        return $this->message->createChat($product_id, $seller_id, $buyer_id);
    }

    public function readMessages($chat_id, $receiver_id)
    {
        return $this->message->readMessages($chat_id, $receiver_id);
    }

    public function getUnreadCount($chat_id, $receiver_id)
    {
        return $this->message->getUnreadCount($chat_id, $receiver_id);
    }

    // Message
    public function getLastMessage($product_id, $receiver_id)
    {
        return $this->message->getLastMessage($product_id, $receiver_id);
    }

    public function getMessages($product_id, $chat_id)
    {
        return $this->message->getMessages($product_id, $chat_id);
    }

    public function sendMessage($sender_id, $receiver_id, $chat_id, $message)
    {
        $response = $this->message->sendMessage($sender_id, $chat_id, $message);

        if ($response["success"] === true) {
            $fcmController = new FCMControler($this->conn);
            $tokenResult = $fcmController->getToken($receiver_id);

            $userController = new UserController($this->conn);
            $sender = $userController->getUserById($sender_id);

            if ($tokenResult["success"]) {
                foreach ($tokenResult["tokens"] as $token) {
                    sendNotification($token, $sender["name"], $message, "chat");
                }
            }
        }

        return $response;
    }
}
