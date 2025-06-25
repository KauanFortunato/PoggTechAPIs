<?php

use App\Controllers\ReviewController;
use App\Utils\Response;

global $router, $conn;

// GET /review → pegar as avaliações de um produto
$router->get('/review/(\d+)/(\d*)', function ($product_id, $quantity) use ($conn) {
    $product_id = intval($product_id);
    $quantity = intval($quantity);

    $controller = new ReviewController($conn);
    $result = $controller->getReviews($product_id, $quantity);

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// POST /review → enviar uma nova avaliação
$router->post('/review', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $data = $_POST;

    if (empty($data['product_id']) || empty($data['user_id']) || empty($data['rating']) || empty($data['comment'])) {
        Response::error("Dados incompletos para criar a avaliação.");
        return;
    }

    $controller = new ReviewController($conn);
    $result = $controller->createReview($data);

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /review → pegar todas as avaliacoes
$router->get('/review', function () use ($conn) {
    $controller = new ReviewController($conn);
    $result = $controller->getAllReviews();

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// DELETE /review/:product_id/:user_id → deletar avaliação
$router->delete('/review/(\d+)/(\d+)', function ($product_id, $user_id) use ($conn) {
    $controller = new ReviewController($conn);
    $result = $controller->deleteReview($product_id, $user_id);

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// PUT /review → atualizar avaliação
$router->put('/review', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (empty($data['user_id']) || empty($data['rating']) || empty($data['comment'])) {
        Response::error("Dados incompletos para atualizar a avaliação.");
        return;
    }

    $controller = new ReviewController($conn);
    $result = $controller->updateReview($data);

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});
