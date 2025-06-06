<?php

use App\Controllers\RecommendationsController;
use App\Controllers\ProductController;
use App\Utils\Response;

global $router, $conn;

// POST /recommendation/interaction → interação do usuário com o produto
$router->post('/recommendation/interaction', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) {
        $data = $_POST;
    }

    if (!isset($data['user_id']) || !isset($data['product_id']) || !isset($data['action'])) {
        Response::error("Parâmetros 'user_id' e 'action' são obrigatórios");
        return;
    }

    $controller = new RecommendationsController($conn);
    $result = $controller->addUserHistory($data['user_id'], $data['product_id'], $data['action']);

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// POST /interaction → interação do usuário com o produto e atualização de visualizações
$router->post('/interaction', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) {
        $data = $_POST;
    }

    if (!isset($data['user_id']) || !isset($data['product_id']) || !isset($data['action'])) {
        Response::error("Parâmetros 'user_id', 'product_id', 'action' são obrigatórios");
        return;
    }

    $productController = new ProductController($conn);
    $controller = new RecommendationsController($conn);

    $result = $productController->attProductViews($data['product_id']);

    if ($result["success"] === true) {
        $result = $controller->addUserHistory($data['user_id'], $data['product_id'], $data['action']);

        if ($result['success']) {
            Response::success(null, $result['message']);
        } else {
            Response::error($result['message']);
        }
    } else {
        Response::error($result['message']);
    }
});
