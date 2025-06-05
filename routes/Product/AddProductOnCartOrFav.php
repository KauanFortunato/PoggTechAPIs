<?php
require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\ProductController;

if ($_SERVER["REQUEST_METHOD"] === 'POST') {

    // Separar em 2 funções Uma para adicionar aos favoritos e outra para adicionar ao carrinho,
    // se for adicionar aos favoritos vai para uma funcao e ao carrinho vai para outra

    $user_id = $_POST['user_id'];
    $product_id = $_POST['product_id'];
    $tipo = $_POST['tipo'];
    $quantity = isset($_POST['quantity']) && (int)$_POST['quantity'] > 0 ? (int)$_POST['quantity'] : 1;

    $productController = new ProductController($conn);

    if ($tipo == 0) {
        $response = $productController->addProductOnCart($user_id, $product_id, $tipo, $quantity);
    } else {
        if ($tipo === 1) {
            $response = $productController->saveProduct($user_id, $product_id, $tipo);
        } else {
            $response = ["success" => false, "message" => "Tipo não é válido", "quantity" => $quantity];
        }
    }

    echo json_encode($response);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
