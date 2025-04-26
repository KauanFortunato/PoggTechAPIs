<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $productController = new ProductController($conn);

    $response = $productController->getPopularProducts();

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Produtos encontrados", "data" => $response["products"]]);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
