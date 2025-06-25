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

    public function createCategory($data)
    {
        try {
            $stmt = $this->conn->prepare("INSERT INTO categories (name, icon, description) VALUES (:name, :icon, :description)");
            $stmt->bindParam(":name", $data['name']);
            $stmt->bindParam(":icon", $data['icon']);
            $stmt->bindParam(":description", $data['description']);
            $stmt->execute();

            return ["success" => true, "message" => "Categoria criada com sucesso"];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao criar categoria: " . $e->getMessage()];
        }
    }

    public function updateCategory($id, $data)
    {
        try {
            $stmt = $this->conn->prepare("UPDATE categories SET name = :name, icon = :icon, description = :description WHERE category_id = :id");
            $stmt->bindParam(":name", $data['name']);
            $stmt->bindParam(":icon", $data['icon']);
            $stmt->bindParam(":description", $data['description']);
            $stmt->bindParam(":id", $id);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                return ["success" => true, "message" => "Categoria atualizada com sucesso"];
            } else {
                return ["success" => false, "message" => "Nenhuma alteração realizada ou categoria não encontrada"];
            }
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao atualizar categoria: " . $e->getMessage()];
        }
    }

    public function deleteCategory($id)
    {
        try {
            $stmt = $this->conn->prepare("DELETE FROM categories WHERE category_id = :category_id");
            $stmt->bindParam(":category_id", $id);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                return ["success" => true, "message" => "Categoria deleteda com sucesso"];
            } else {
                return ["success" => false, "message" => "Não foi possível deletar a categoria"];
            }
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro ao deletar categoria: " . $e->getMessage()];
        }
    }
}
