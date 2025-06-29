<?php

use App\Controllers\StatisticsController;
use App\Utils\Response;

global $router, $conn;

$controller = new StatisticsController($conn);


$router->get('/dashboard/products-sales', function () use ($conn) {
    $controller = new StatisticsController($conn);
    $result = $controller->getProductsSales();

    if ($result['success']) {
        Response::success($result['data'], "Vendas por produto carregadas com sucesso.");
    } else {
        Response::error($result['message']);
    }
});

$router->get('/dashboard/daily-metrics', function () use ($conn) {
    $controller = new StatisticsController($conn);
    $result = $controller->getDailyMetrics();

    if ($result['success']) {
        Response::success($result['data'], "Métricas diárias carregadas com sucesso.");
    } else {
        Response::error($result['message']);
    }
});

$router->get('/dashboard/monthly-active-users', function () use ($conn) {
    $controller = new StatisticsController($conn);
    $result = $controller->getMonthlyActiveUsers();

    if ($result['success']) {
        Response::success($result['data'], "Utilizadores ativos por mês carregados com sucesso.");
    } else {
        Response::error($result['message']);
    }
});

$router->get('/dashboard/total-wallet', function () use ($conn) {
    $controller = new StatisticsController($conn);
    $result = $controller->getTotalWallet();

    if ($result['success']) {
        Response::success($result['data'], "Saldo total carregado com sucesso.");
    } else {
        Response::error($result['message']);
    }
});
