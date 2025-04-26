<?php
header('Content-Type: application/json; charset=UTF-8');
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;

if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    $user_id = $_GET["user_id"];

    $messageController = new MessageController($conn);
    $response = $messageController->getUserChatsSell($user_id);

    if ($response['success'] === true) {
        echo json_encode($response['chats']);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
