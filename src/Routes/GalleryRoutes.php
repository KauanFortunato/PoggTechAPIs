<?php

use App\Controllers\GalleryController;
use App\Utils\Response;

global $router, $conn;

// GET /Messages → get product images
$router->get('/gallery/product/(\d+)', function ($product_id) use ($conn) {
    $controller = new GalleryController($conn);
    $result = $controller->getProductImages($product_id);

    if ($result['success']) {
        Response::success($result['data'], "Última mensagem encontrada");
    } else {
        Response::error("Nenhuma mensagem encontrada");
    }
});
