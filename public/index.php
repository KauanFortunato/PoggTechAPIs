<?php

require_once __DIR__ . '/../vendor/autoload.php';

use Bramus\Router\Router;

global $router;
$router = new Router();

header('Content-Type: application/json');
require_once __DIR__ . '/../src/Routes/api.php';
$router->run();
