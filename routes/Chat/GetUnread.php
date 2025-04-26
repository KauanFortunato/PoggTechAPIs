<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;

if ($_SERVER["REQUEST_METHOD"] == 'GET') {
    $chat_id = $_GET['chat_id'];
    $receiver_id = $_GET['receiver_id'];

    $messageController = new MessageController($conn);
    $response = $messageController->getUnread($chat_id, $receiver_id);

    echo json_encode($response);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
