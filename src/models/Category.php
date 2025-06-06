<?php

namespace App\Models;

use PDO;

class Category
{
    private $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function getCategoryById($category_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM categories WHERE category_id = :id");
            $stmt->bindParam(':id', $category_id, PDO::PARAM_INT);
            $stmt->execute();
            $category = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($category) {
                return ["success" => true, "category" => $category];
            } else {
                return ["success" => false, "message" => "Categoria não foi encontrada"];
            }
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro na consulta: " . $e->getMessage()];
        }
    }

    public function getAllCategories()
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM categories");
            $stmt->execute();
            $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($categories)) {
                return ["success" => true, "categories" => $categories];
            } else {
                return ["success" => false, "message" => "Nenhuma categoria foi encontrada"];
            }
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro na consulta: " . $e->getMessage()];
        }
    }
}
