<?php

namespace App\Controllers;

use App\Models\Category;

class CategoryController
{
    private $category;

    public function __construct(\PDO $conn)
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

    public function createCategory($data)
    {
        return $this->category->createCategory($data);
    }

    public function updateCategory($id, $data)
    {
        return $this->category->updateCategory($id, $data);
    }

    public function deleteCategory($id)
    {
        return $this->category->deleteCategory($id);
    }
}
