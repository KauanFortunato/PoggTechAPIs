<?php

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\GalleryController;

if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    $product_id = $_GET["product_id"];

    $galleryController = new GalleryController($conn);
    $response = $galleryController->getProductImages($product_id);

    if ($response["success"]) {
        echo json_encode(["success" => true, "message" => "Imagens encontradas com sucesso", "images" => $response["images"]]);
    } else {
        echo json_encode(["success" => false, "message" => $response["message"]]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
