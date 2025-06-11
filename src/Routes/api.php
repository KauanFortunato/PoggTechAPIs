<?php

use App\Config\Database;
use Bramus\Router\Router;

$router = new Router();
$conn = (new Database())->connect();

// Passa $router e $conn para os arquivos de rota
require_once __DIR__ . '/CategoryRoutes.php';
require_once __DIR__ . '/FCMRoutes.php';
require_once __DIR__ . '/ChatRoutes.php';
require_once __DIR__ . '/MessageRoutes.php';
require_once __DIR__ . '/GalleryRoutes.php';
require_once __DIR__ . '/UserRoutes.php';
require_once __DIR__ . '/OrderRoutes.php';
require_once __DIR__ . '/ProductRoutes.php';
require_once __DIR__ . '/RecomendationRoutes.php';
require_once __DIR__ . '/ReviewRoutes.php';
require_once __DIR__ . '/WalletRoutes.php';
require_once __DIR__ . '/CartRoutes.php';
