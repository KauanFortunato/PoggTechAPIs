<?php
header('Content-Type: application/json');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\OrderController;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"), true);

    $user_id = $data['user_id'];
    $items = $data['items'];

    $orderController = new OrderController($conn);
    $result = $orderController->registerOrder($user_id, $items);

    echo json_encode($result);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
