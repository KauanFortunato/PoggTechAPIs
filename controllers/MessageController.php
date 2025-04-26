<?php

namespace App\Controllers;

use App\Models\Message;
use App\Controllers\FCMControler;
use App\Controllers\UserController;

class MessageController
{
    private $message;
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
        $this->message = new Message($conn);
    }

    public function sendMessage($sender_id, $receiver_id, $chat_id, $message)
    {
        $response = $this->message->sendMessage($sender_id, $receiver_id, $chat_id, $message);

        if ($response["success"] === true) {
            require_once '../../utils/send_fcm_notification.php';

            $fcmController = new FCMControler($this->conn);
            $token = $fcmController->getToken($receiver_id);

            $userController  = new UserController($this->conn);
            $sender = $userController->getUserById($sender_id);

            if ($token["success"]) {
                foreach ($token["tokens"] as $token) {
                    sendNotification($token, $sender["name"], $message, "chat");
                }
            }
        }

        return $response;
    }

    public function getMessages($product_id, $chat_id)
    {
        return $this->message->getMessages($product_id, $chat_id);
    }

    public function getLastMessage($product_id, $receiver_id)
    {
        return $this->message->getLastMessage($product_id, $receiver_id);
    }

    public function getUserChatsBuy($user_id)
    {
        return $this->message->getUserChatsBuy($user_id);
    }

    public function getUserChatsSell($user_id)
    {
        return $this->message->getUserChatsSell($user_id);
    }

    public function getChat($user_id, $product_id)
    {
        return $this->message->getChat($user_id, $product_id);
    }

    public function createChat($product_id)
    {
        return $this->message->createChat($product_id);
    }

    public function markIsRead($chat_id, $receiver_id)
    {
        return $this->message->markIsRead($chat_id, $receiver_id);
    }

    public function getUnread($chat_id, $receiver_id)
    {
        return $this->message->getUnread($chat_id, $receiver_id);
    }
}
