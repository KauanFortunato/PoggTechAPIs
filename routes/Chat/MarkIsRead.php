<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;

if ($_SERVER["REQUEST_METHOD"] == 'POST') {
    $chat_id = $_POST['chat_id'];
    $receiver_id = $_POST['receiver_id'];

    $messageController = new MessageController($conn);
    $response = $messageController->markIsRead($chat_id, $receiver_id);

    echo json_encode($response);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
