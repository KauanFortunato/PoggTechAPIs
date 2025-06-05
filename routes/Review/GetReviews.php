<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ReviewController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $product_id = $_GET['product_id'];
    $quantity = isset($_GET['quantity']) && $_GET['quantity'] !== '' ? $_GET['quantity'] : 0;

    $reviewController = new ReviewController($conn);
    $result = $reviewController->getReviews($product_id, $quantity);

    echo json_encode($result);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
