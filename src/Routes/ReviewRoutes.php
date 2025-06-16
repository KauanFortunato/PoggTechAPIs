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
