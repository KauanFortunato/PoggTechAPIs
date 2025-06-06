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
        Response::success($result['product'], "Produto criado com sucesso");
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

// GET /products/{id} → pegar produto por id
$router->get('/products/(\d+)', function ($id) use ($controller) {
    $result = $controller->getProduct($id);

    if ($result) {
        Response::success($result, "Produto encontrado");
    } else {
        Response::error("Produto não encontrado");
    }
});

// GET /products → pegar todos produtos
$router->get('/products', function () use ($controller) {
    $result = $controller->getAllProducts();

    if ($result) {
        Response::success($result, "Produtos encontrados");
    } else {
        Response::error("Nenhum produto encontrado");
    }
});

// GET /products/category/{category}/{all} → produtos por categoria
$router->get('/products/category/([^/]+)/([^/]+)/', function ($category, $all) use ($controller) {
    $result = $controller->getProductByCategories($category, $all === 'true', 9);

    if ($result["success"]) {
        Response::success($result["data"], "Produtos da categoria $category encontrados");
    } else {
        Response::error("Nenhum produto encontrado para a categoria $category");
    }
});

// GET /products/popular → produtos populares
$router->get('/products/popular/([^/]+)', function ($all) use ($controller) {
    $result = $controller->getPopularProducts($all === 'true');

    if ($result) {
        Response::success($result, "Produtos populares");
    } else {
        Response::error("Nenhum produto popular encontrado");
    }
});

// GET /products/recommended/{user_id} → produtos recomendados para o usuário
$router->get('/products/recommended/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getRecommendedProducts($user_id);

    if ($result) {
        Response::success($result, "Produtos recomendados");
    } else {
        Response::error("Nenhum produto recomendado encontrado");
    }
});

// GET /products/favCategories/{user_id} → categorias favoritas do usuário
$router->get('/products/favCategories/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getFavCategories($user_id);

    if ($result) {
        Response::success($result, "Categorias favoritas");
    } else {
        Response::error("Nenhuma categoria favorita encontrada");
    }
});

// GET /products/search/{query} → busca produtos
$router->get('/products/search/([^/]+)', function ($query) use ($controller) {
    $result = $controller->searchProducts($query);

    if ($result) {
        Response::success($result, "Produtos encontrados");
    } else {
        Response::error("Nenhum produto encontrado");
    }
});

// GET /products/suggestions/{query} → sugestões para autocomplete
$router->get('/products/suggestions/([^/]+)', function ($query) use ($controller) {
    $result = $controller->getSuggestions($query);

    if ($result) {
        Response::success($result, "Sugestões encontradas");
    } else {
        Response::error("Nenhuma sugestão encontrada");
    }
});

// GET /products/my/{user_id} → produtos do usuário
$router->get('/products/my/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getMyProducts($user_id);

    if ($result) {
        Response::success($result, "Seus produtos");
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
            Response::error($response);
        }
    } else {
        Response::error("Nenhum produto encontrado");
    }
});

/*
   CART
*/

// POST /cart/add → adicionar produto no carrinho (recebe JSON com user_id, product_id, tipo, quantity)

$router->post('/cart/add', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

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
        $data['tipo'],
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

    $required = ['user_id', 'product_id', 'tipo'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            Response::error("Parâmetro '$field' é obrigatório");
            return;
        }
    }

    $result = $controller->saveProduct(
        intval($data['user_id']),
        intval($data['product_id']),
        $data['tipo']
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

    $required = ['user_id', 'product_id', 'tipo'];
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

    if ($result) {
        Response::success($result, "Produtos do $tipo encontrados");
    } else {
        Response::error("Nenhum produto encontrado para o usuário");
    }
});

// GET /cart/verify/{user_id}/{product_id}/{tipo} → verifica se produto está no carrinho ou favoritos
$router->get('/cart/verify/(\d+)/(\d+)/(\d+)', function ($user_id, $product_id, $tipo) use ($controller) {
    $result = $controller->verifyProductOnCart($user_id, $product_id, $tipo);

    if ($result) {
        Response::success($result, "Verificação concluída");
    } else {
        Response::error("Produto não encontrado no $tipo");
    }
});

// GET /cart/favOrCart/{user_id}/{tipo} → pega o id dos produtos do usuário no carrinho ou favoritos
$router->get('/cart/favOrCart/(\d+)/(\d+)', function ($user_id, $tipo) use ($controller) {
    $result = $controller->getUserFavOrCart($user_id, $tipo);

    if ($result) {
        Response::success($result['data'], "Verificação concluída");
    } else {
        Response::error("Produto não encontrado no $tipo");
    }
});

// GET /products/favCategories/{user_id}/{quantity} → pega categorias favoritas do usuário e distribui produtos
$router->get('/products/favCategories/(\d+)/(\d+)', function ($user_id, $quantity) use ($controller) {
    $result = $controller->getFavCategories($user_id);

    if ($result["success"] === true) {
        $result = $controller->getDistributedProductsByCategories($result["data"], $quantity);

        if ($result["success"] === true) {
            Response::success($result, "Verificação concluída");
        } else {
            Response::error("Produtos não encontrados");
        }
    } else {
        Response::error("Produto não encontrados");
    }
});
