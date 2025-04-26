<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;

if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    $product_id = $_GET["product_id"];
    $chat_id = $_GET["chat_id"];

    $messageController = new MessageController($conn);
    $response = $messageController->getMessages($product_id, $chat_id);

    if ($response['success'] === true) {
        echo json_encode(value: ["success" => true, "message" => "Mensagens encontradas", "data" => $response["messages"]]);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
