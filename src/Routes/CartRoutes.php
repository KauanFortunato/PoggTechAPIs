<?php

use App\Controllers\ProductController;
use App\Utils\Response;

global $router, $conn;

$controller = new ProductController($conn);

// POST /cart/add → adicionar produto no carrinho (recebe JSON com user_id, product_id, tipo, quantity)
$router->post('/cart/add', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    if (!$data) {
        $data = $_POST;
    }

    $required = ['user_id', 'product_id', 'quantity'];

    foreach ($required as $field) {
        if (empty($data[$field])) {
            Response::error("Parâmetro '$field' é obrigatório");
            return;
        }
    }

    $result = $controller->addProductOnCart(
        intval($data['user_id']),
        intval($data['product_id']),
        intval($data['quantity'])
    );

    if ($result['success']) {
        Response::success(null, "Produto adicionado ao carrinho");
    } else {
        Response::error($result['message']);
    }
});

// POST /product/save → salvar produto (favoritos)
$router->post('/product/save', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    if (!$data) {
        $data = $_POST;
    }

    $required = ['user_id', 'product_id'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            Response::error("Parâmetro '$field' é obrigatório");
            return;
        }
    }

    $result = $controller->saveProduct(
        intval($data['user_id']),
        intval($data['product_id'])
    );

    if ($result['success']) {
        Response::success(null, "Produto salvo com sucesso");
    } else {
        Response::error($result['message']);
    }
});

// POST /cart/removeOne → remove uma unidade do carrinho (user_id, product_id, tipo)
$router->post('/cart/removeOne', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    if (!$data) {
        $data = $_POST;
    }

    $required = ['user_id', 'product_id'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            Response::error("Parâmetro '$field' é obrigatório");
            return;
        }
    }

    $result = $controller->removeOneFromCart(
        intval($data['user_id']),
        intval($data['product_id']),
        $data['tipo']
    );

    if ($result['success']) {
        Response::success(null, "Quantidade removida do carrinho");
    } else {
        Response::error($result['message']);
    }
});

// POST /cart/removeProduct → remove o produto do carrinho
$router->post('/cart/removeProduct', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    if (!$data) {
        $data = $_POST;
    }

    $required = ['user_id', 'product_id', 'tipo'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            Response::error("Parâmetro '$field' é obrigatório");
            return;
        }
    }

    $result = $controller->removeProductOnCart(
        intval($data['user_id']),
        intval($data['product_id']),
        $data['tipo']
    );

    if ($result['success']) {
        Response::success(null, "Produto removido do carrinho");
    } else {
        Response::error($result['message']);
    }
});

// GET /cart/{user_id}/{tipo} → pegar todos produtos do carrinho ou favoritos (tipo = '0' ou '1')
$router->get('/cart/(\d+)/(\d+)', function ($user_id, $tipo) use ($controller) {
    $result = $controller->getAllProductsFromCart($user_id, $tipo);

    if ($result["success"]) {
        Response::success($result['data'], "Produtos do $tipo encontrados");
    } else {
        Response::error("Nenhum produto encontrado para o usuário");
    }
});

// GET /cart/verify/{user_id}/{product_id}/{tipo} → verifica se produto está no carrinho ou favoritos
$router->get('/cart/verify/(\d+)/(\d+)/(\d+)', function ($user_id, $product_id, $tipo) use ($controller) {
    $result = $controller->verifyProductOnCart($user_id, $product_id, $tipo);

    if ($result["success"]) {
        Response::success($result['data'], "Verificação concluída");
    } else {
        Response::error("Produto não encontrado no $tipo");
    }
});

// GET /cart/favOrCart/{user_id}/{tipo} → pega o id dos produtos do usuário no carrinho ou favoritos
$router->get('/cart/favOrCart/(\d+)/(\d+)', function ($user_id, $tipo) use ($controller) {
    $result = $controller->getUserFavOrCart($user_id, $tipo);

    if ($result['success']) {
        Response::success($result['data'], "Verificação concluída");
    } else {
        Response::error("Produto não encontrado no $tipo");
    }
});
