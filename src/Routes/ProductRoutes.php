<?php

use App\Controllers\ProductController;
use App\Utils\Response;

global $router, $conn;

$controller = new ProductController($conn);

// POST /products → criar produto (recebe JSON e arquivos)
$router->post('/products', function () use ($controller) {
    // Recebe dados do produto no JSON
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    // Recebe arquivos (imagens) via $_FILES
    $images = $_FILES['images'] ?? [];

    $result = $controller->createProduct($data, $images);

    if ($result['success']) {
        Response::success($result['data'], "Produto criado com sucesso");
    } else {
        Response::error($result['message']);
    }
});

// POST /products/{id} → atualizar produto
$router->post('/products/(\d+)', function ($productId) use ($controller) {
    // Recebe dados do produto no JSON
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    // Recebe arquivos (imagens) via $_FILES
    $images = $_FILES['images'] ?? [];

    $result = $controller->updateProduct($productId, $data, $images);

    if ($result['success']) {
        Response::success(null, "Produto atualizado com sucesso");
    } else {
        Response::error($result['message']);
    }
});

// DELETE /products/{id} → deletar produto
$router->delete('/products/(\d+)', function ($id) use ($controller) {
    $result = $controller->deleteProduct($id);

    if ($result['success']) {
        Response::success(null, "Produto deletado");
    } else {
        Response::error($result['message']);
    }
});

// POST /product/quantity/ → reduzir quantity
$router->post('/product/quantity', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    if (!$data) {
        $data = $_POST;
    }

    $required = ['product_id', 'quantity'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            Response::error("Parâmetro '$field' é obrigatório");
            return;
        }
    }

    $result = $controller->reduceQuantity(intval($data['product_id']), intval($data['quantity']));

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /products/{id} → pegar produto por id
$router->get('/products/(\d+)', function ($id) use ($controller) {
    $result = $controller->getProduct($id);

    if ($result["success"]) {
        Response::success($result['data'], "Produto encontrado");
    } else {
        Response::error("Produto não encontrado");
    }
});

// GET /products → pegar todos produtos
$router->get('/products', function () use ($controller) {
    $result = $controller->getAllProducts();

    if ($result["success"]) {
        Response::success($result['data'], "Produtos encontrados");
    } else {
        Response::error("Nenhum produto encontrado");
    }
});

// GET /products/category/{category}/{all} → produtos por categoria
$router->get('/products/category/([^/]+)/([^/]+)', function ($category, $all) use ($controller) {
    $result = $controller->getProductByCategories($category, $all === 'true', 9);

    if ($result["success"]) {
        Response::success($result["data"], "Produtos da categoria $category encontrados");
    } else {
        Response::error("Nenhum produto encontrado para a categoria $category");
    }
});

// GET /products/popular → produtos populares
$router->get('/products/popular/([^/]+)/(\d+)', function ($all, $quantity) use ($controller) {
    $result = $controller->getPopularProducts($all === 'true', $quantity);

    if ($result['success']) {
        Response::success($result['data'], "Produtos populares");
    } else {
        Response::error("Nenhum produto popular encontrado");
    }
});

// GET /products/recommended/{user_id} → produtos recomendados para o usuário
$router->get('/products/recommended/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getRecommendedProducts($user_id);

    if ($result["success"]) {
        Response::success($result['data'], "Produtos recomendados");
    } else {
        Response::error("Nenhum produto recomendado encontrado");
    }
});

// GET /products/favCategories/{user_id} → categorias favoritas do usuário
$router->get('/products/favCategories/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getFavCategories($user_id);

    if ($result["success"]) {
        Response::success($result['data'], "Categorias favoritas");
    } else {
        Response::error("Nenhuma categoria favorita encontrada");
    }
});

// GET /products/search/{query} → busca produtos
$router->get('/products/search/([^/]+)', function ($query) use ($controller) {
    $result = $controller->searchProducts($query);

    if ($result["success"]) {
        Response::success($result['data'], "Produtos encontrados");
    } else {
        Response::error("Nenhum produto encontrado");
    }
});

// GET /products/suggestions/{query} → sugestões para autocomplete
$router->get('/products/suggestions/([^/]+)', function ($query) use ($controller) {
    $result = $controller->getSuggestions($query);

    if ($result["success"]) {
        Response::success($result['data'], "Sugestões encontradas");
    } else {
        Response::error("Nenhuma sugestão encontrada");
    }
});

// GET /products/my/{user_id} → produtos do usuário
$router->get('/products/my/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getMyProducts($user_id);

    if ($result["success"]) {
        Response::success($result['data'], "Seus produtos");
    } else {
        Response::error("Nenhum produto encontrado");
    }
});

// GET /products/fav/{user_id} → produtos da categoria favorita do usuário
$router->get('/products/fav/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getFavCategories($user_id);

    if ($result['success'] === true) {
        $response = $controller->getProductByCategories($result["data"][0]);

        if ($response["success"] === true) {
            Response::success($response["data"], "Seus produtos");
        } else {
            Response::error($response['message']);
        }
    } else {
        Response::error("Nenhum produto encontrado");
    }
});

// GET /products/favCategories/{user_id}/{quantity} → pega categorias favoritas do usuário e distribui produtos
$router->get('/products/favCategories/(\d+)/(\d+)', function ($user_id, $quantity) use ($controller) {
    $result = $controller->getFavCategories($user_id);

    if ($result["success"] === true) {
        $result = $controller->getDistributedProductsByCategories($result["data"], $quantity);

        if ($result["success"] === true) {
            Response::success($result['data'], "Produtos distribuídos por categorias favoritas");
        } else {
            Response::error("Produtos não encontrados");
        }
    } else {
        Response::error("Produto não encontrados");
    }
});
