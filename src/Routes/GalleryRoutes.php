<?php

use App\Controllers\GalleryController;
use App\Utils\Response;

global $router, $conn;

// GET /Messages → get last message
$router->get('/gallery/product/(\d+)', function ($product_id) use ($conn) {
    $controller = new GalleryController($conn);
    $result = $controller->getProductImages($product_id);

    if ($result) {
        Response::success($result, "Última mensagem encontrada");
    } else {
        Response::error("Nenhuma mensagem encontrada");
    }
});
