<?php

namespace App\Models;

class Category
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getCategoryById($category_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM categories WHERE category_id LIKE ?");
        $stmt->bind_param("i", $category_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        if ($result->num_rows > 0) {
            $category = $result->fetch_assoc();
            $stmt->close();
            return ["success" => true, "category" => $category];
        } else {
            $stmt->close();
            return ["success" => false, "message" => "Categoria não foi encontrada"];
        }
    }

    public function getAllCategories()
    {
        $stmt = $this->conn->prepare("SELECT * FROM categories");
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $categories = [];
        while ($row = $result->fetch_assoc()) {
            $categories[] = $row;
        }

        $stmt->close();

        if (!empty($categories)) {
            // print_r($categories);
            return ["success" => true, "categories" => $categories];
        } else {
            return ["success" => false, "message" => "Nenhuma categoria foi encontrada"];
        }
    }
}
