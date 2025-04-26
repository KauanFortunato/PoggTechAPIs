<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;

if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    $user_id = $_GET["user_id"];
    $product_id = $_GET["product_id"];

    $messageController = new MessageController($conn);
    $response = $messageController->getChat($user_id, $product_id);

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Chat encontrado", "data" => $response["chat"]]);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
