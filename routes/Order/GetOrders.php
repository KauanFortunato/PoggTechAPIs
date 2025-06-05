<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\OrderController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $user_id = $_GET['user_id'];

    $orderController = new OrderController($conn);
    $result = $orderController->getOrder($user_id);

    echo json_encode($result);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
