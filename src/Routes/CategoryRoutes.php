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

$router->post('/category', function () use ($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $controller = new CategoryController($conn);
    echo json_encode($controller->createCategory($data));
});

$router->put('/category/(\d+)', function ($id) use ($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $controller = new CategoryController($conn);
    echo json_encode($controller->updateCategory($id, $data));
});

$router->delete('/category/(\d+)', function ($id) use ($conn) {
    $controller = new CategoryController($conn);
    echo json_encode($controller->deleteCategory($id,));
});
