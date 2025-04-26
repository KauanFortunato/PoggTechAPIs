<?php
require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === 'POST') {
    $user_id = $_POST['user_id'];
    $product_id = $_POST['product_id'];
    $tipo = $_POST['tipo'];

    $productController = new ProductController($conn);
    $response = $productController->removeProductOnCart($user_id, $product_id, $tipo);

    echo json_encode($response);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
