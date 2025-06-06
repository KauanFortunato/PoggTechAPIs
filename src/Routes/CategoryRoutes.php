<?php

use App\Controllers\CategoryController;
use App\Utils\Response;

global $router, $conn;

// GET /category → todas as categorias
$router->get('/category', function () use ($conn) {
    $controller = new CategoryController($conn);
    $result = $controller->getAllCategories();

    if ($result['success']) {
        Response::success($result['categories'], 'Categorias encontradas');
    } else {
        Response::error($result['message']);
    }
});

// GET /category/{id}
$router->get('/category/(\d+)', function ($id) use ($conn) {
    $controller = new CategoryController($conn);
    echo json_encode($controller->getCategory($id));
});
