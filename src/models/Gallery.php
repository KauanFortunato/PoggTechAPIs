<?php

namespace App\Models;

use PDO;

class Gallery
{
    private PDO $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function getProductImages($product_id)
    {
        try {
            // Buscar o gallery_id associado ao produto
            $stmt = $this->conn->prepare("SELECT gallery_id FROM gallery WHERE product_id = :product_id");
            $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
            $stmt->execute();

            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$row) {
                return ["success" => false, "message" => "Nenhuma imagem encontrada para o produto"];
            }

            $gallery_id = $row['gallery_id'];

            // Buscar as imagens com base no gallery_id
            $stmt = $this->conn->prepare("SELECT path FROM images WHERE gallery_id = :gallery_id");
            $stmt->bindParam(':gallery_id', $gallery_id, PDO::PARAM_INT);
            $stmt->execute();

            $images = $stmt->fetchAll(PDO::FETCH_COLUMN);

            if (empty($images)) {
                return ["success" => false, "message" => "Nenhuma imagem encontrada para o produto"];
            }

            return ["success" => true, "images" => $images];
        } catch (\PDOException $e) {
            return ["success" => false, "message" => "Erro na consulta: " . $e->getMessage()];
        }
    }
}
