<?php

namespace App\Controllers;

use App\Models\Category;

class CategoryController
{
    private $category;

    public function __construct($conn)
    {
        $this->category = new Category($conn);
    }

    public function getCategory($category_id)
    {
        return $this->category->getCategoryById($category_id);
    }

    public function getAllCategories()
    {
        return $this->category->getAllCategories();
    }
}
