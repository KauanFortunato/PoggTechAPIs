<?php
require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === 'POST') {

    // Separar em 2 funções Uma para adicionar aos favoritos e outra para adicionar ao carrinho,
    // se for adicionar aos favoritos vai para uma funcao e ao carrinho vai para outra

    $user_id = $_POST['user_id'];
    $product_id = $_POST['product_id'];
    $tipo = $_POST['tipo'];

    $productController = new ProductController($conn);
    $response = $productController->addProductOnCart($user_id, $product_id, $tipo);

    echo json_encode($response);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
