<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\MessageController;


if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    $receiver_id = $_GET["receiver_id"];
    $product_id = $_GET["product_id"];

    $messageController = new MessageController($conn);
    $response = $messageController->getLastMessage($product_id, $receiver_id);

    if ($response['success'] === true) {
        echo json_encode($response['messages']);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
