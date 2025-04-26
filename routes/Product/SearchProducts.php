<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $search = $_GET["search"];

    $productController = new ProductController($conn);
    $response = $productController->searchProducts($search);

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Consulta realizada com sucesso", "data" => $response["products"]]);
    } else {
        echo json_encode(["success" => false, "message" => $response]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
