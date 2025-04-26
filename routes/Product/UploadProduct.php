<?php
require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === 'POST') {
    $data = $_POST;
    $images = $_FILES['images'];

    $productController = new ProductController($conn);
    $response = $productController->createProduct($data, $images);

    if ($response) {
        echo json_encode(["success" => true, "message" => "Produto criado com sucesso"]);
    } else {
        echo json_encode(["success" => false, "message" => "Erro ao criar produto"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
