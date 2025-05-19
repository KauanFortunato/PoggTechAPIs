<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $category = $_GET["category"];
    $all = $_GET["all"];

    $productController = new ProductController($conn);
    $response = $productController->getProductByCategories($category, $all);

    if ($response["success"] === true) {
        echo json_encode($response["products"]);
    } else {
        echo json_encode(["success" => false, "message" => $response]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
