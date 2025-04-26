<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;

if ($_SERVER["REQUEST_METHOD"] === 'POST') {
    $product_id = $_POST["product_id"];

    $messageController = new MessageController($conn);
    $response = $messageController->createChat($product_id);

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Chat criado com sucesso.", "data" => $response["chat_id"]]);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
