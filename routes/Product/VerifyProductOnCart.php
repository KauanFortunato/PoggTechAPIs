<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $user_id = $_GET["user_id"];
    $product_id = $_GET["product_id"];
    $tipo = $_GET["tipo"];

    $productController = new ProductController($conn);
    $response = $productController->verifyProductOnCart($user_id, $product_id, $tipo);

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Mensagens encontradas", "data" => $response["isFavorite"]]);
    } else {
        echo json_encode(["success" => false, "message" => $response['message']]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
