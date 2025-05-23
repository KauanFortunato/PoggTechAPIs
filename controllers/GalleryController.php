<?php

namespace App\Controllers;

use App\Models\Gallery;

class GalleryController
{
    private $conn;
    private $gallery;

    public function __construct($conn)
    {
        $this->conn = $conn;
        $this->gallery = new Gallery($conn);
    }

    public function getProductImages($product_id)
    {
        return $this->gallery->getProductImages($product_id);
    }

    public function addImageGallery($product_id) {}
}
