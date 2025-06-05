<?php

namespace App\Models;

require_once __DIR__ . '/../config/constants.php';

class Review
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getReviews($product_id, $quantity = 0)
    {
        $quantity = isset($_GET['quantity']) ? (int)$_GET['quantity'] : 0;

        if ($quantity === 0) {
            $query = "SELECT * FROM v_review_details WHERE product_id = ? ORDER BY created_at DESC";
            $stmt = $this->conn->prepare($query);
            $stmt->bind_param("i", $product_id);
        } else {
            $query = "SELECT * FROM v_review_details WHERE product_id = ? ORDER BY created_at DESC LIMIT ?";
            $stmt = $this->conn->prepare($query);
            $stmt->bind_param("ii", $product_id, $quantity);
        }

        if ($stmt === false) {
            return [
                "success" => false,
                "message" => "Erro ao preparar a consulta: " . $this->conn->error,
                "data" => null
            ];
        }

        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $reviews = $result->fetch_all(MYSQLI_ASSOC);

            // Função auxiliar usando time() e strtotime()
            function timeAgo($datetime)
            {
                $timestamp = strtotime($datetime);
                $diff = time() - $timestamp;

                $minutes = floor($diff / 60);
                $hours = floor($diff / 3600);
                $days = floor($diff / 86400);
                $months = floor($diff / 2592000);
                $years = floor($diff / 31104000);

                if ($years >= 1) {
                    return $years === 1 ? "1 ano atrás" : "$years anos atrás";
                } elseif ($months >= 1) {
                    return $months === 1 ? "1 mês atrás" : "$months meses atrás";
                } elseif ($days >= 1) {
                    return $days === 1 ? "1 dia atrás" : "$days dias atrás";
                } elseif ($hours >= 1) {
                    return $hours === 1 ? "1h atrás" : "$hours h atrás";
                } elseif ($minutes >= 1) {
                    return $minutes === 1 ? "1m atrás" : "$minutes m atrás";
                } else {
                    return "Agora mesmo";
                }
            }

            // Adiciona o campo 'time_ago' a cada review
            foreach ($reviews as &$review) {
                $review['time_ago'] = timeAgo($review['created_at']);
            }

            return [
                "success" => true,
                "message" => "Reviews encontradas",
                "data" => $reviews
            ];
        } else {
            return [
                "success" => false,
                "message" => "Nenhuma review foi encontrada",
                "data" => null
            ];
        }
    }
}
