<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $product_id = $_GET["product_id"];

    $productController = new ProductController($conn);
    $response = $productController->deleteProduct($product_id);

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Produto deletado com sucesso"]);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
