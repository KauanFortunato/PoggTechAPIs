<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;

if ($_SERVER["REQUEST_METHOD"] === 'POST') {
    $sender_id = $_POST["sender_id"];
    $receiver_id = $_POST["receiver_id"];
    $chat_id = $_POST["chat_id"];
    $message = $_POST["message"];

    $messageController = new MessageController($conn);
    $response = $messageController->sendMessage($sender_id, $receiver_id, $chat_id, $message);

    echo json_encode($response);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
