<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $product_id = $_GET["product_id"];

    $productController = new ProductController($conn);
    $response = $productController->getProduct($product_id); // Chamando a função que pega o produto

    if ($response["success"] === true) {
        echo json_encode($response["product"]);
    } else {
        echo json_encode(["success" => false, "message" => $response]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
