<?php

use App\Controllers\ReviewController;
use App\Utils\Response;

global $router, $conn;

// GET /category → interação do usuário com o produto
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
