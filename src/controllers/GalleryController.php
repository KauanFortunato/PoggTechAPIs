<?php

namespace App\Controllers;

use App\Models\Gallery;

class GalleryController
{
    private $conn;
    private $gallery;

    public function __construct(\PDO $conn)
    {
        $this->conn = $conn;
        $this->gallery = new Gallery($conn);
    }

    public function getProductImages($product_id)
    {
        return $this->gallery->getProductImages($product_id);
    }
}
