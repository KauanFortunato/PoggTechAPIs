<?php

namespace App\Models;

class Gallery
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getProductImages($product_id)
    {
        $stmt = $this->conn->prepare("SELECT gallery_id FROM gallery WHERE product_id = ?");
        $stmt->bind_param("i", $product_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $gallery_id = $row['gallery_id'];
                $stmt = $this->conn->prepare("SELECT path FROM images WHERE gallery_id = ?");
                $stmt->bind_param("i", $gallery_id);

                if ($stmt->execute()) {
                    $result = $stmt->get_result();

                    if ($result->num_rows == 0) {
                        return ["success" => false, "message" => "Nenhuma imagem encontrada para o produto"];
                    }

                    $images = [];

                    while ($row = $result->fetch_assoc()) {
                        $images[] = $row['path'];
                    }

                    return ["success" => true, "images" => $images];
                } else {
                    return ["success" => false, "message" => "Erro ao executar a consulta em 'images'"];
                }
            } else {
                return ["success" => false, "message" => "Nenhuma imagem encontrada para o produto"];
            }
        } else {
            return ["success" => false, "message" => "Erro ao executar a consulta em 'gallery'"];
        }
    }
}
