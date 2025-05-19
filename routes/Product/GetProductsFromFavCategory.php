<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $user_id = $_GET["user_id"];

    $productController = new ProductController($conn);
    $response = $productController->getFavCategories($user_id);

    if ($response["success"] === true) {
        $response = $productController->getProductByCategories($response["categories"][0]);

        if ($response["success"] === true) {
            echo json_encode(["success" => true, "message" => "Produtos da categoria favorita", "data" => $response["products"]]);
        } else {
            echo json_encode(["success" => false, "message" => $response]);
        }
    } else {
        echo json_encode(["success" => false, "message" => $response]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
