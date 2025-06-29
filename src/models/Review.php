<?php

namespace App\Models;

require_once __DIR__ . '/../config/constants.php';

use PDO;
use PDOException;

class Review
{
    private $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function getReviews($product_id, $quantity = 0)
    {
        try {
            if ($quantity === 0) {
                $sql = "SELECT * FROM v_review_details WHERE product_id = :product_id ORDER BY created_at DESC";
                $stmt = $this->conn->prepare($sql);
                $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
            } else {
                $sql = "SELECT * FROM v_review_details WHERE product_id = :product_id ORDER BY created_at DESC LIMIT :limit";
                $stmt = $this->conn->prepare($sql);
                $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
                $stmt->bindParam(':limit', $quantity, PDO::PARAM_INT);
            }

            $stmt->execute();
            $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($reviews && count($reviews) > 0) {

                // Função auxiliar para transformar datas em "há X tempo"
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

                foreach ($reviews as &$review) {
                    $review['time_ago'] = timeAgo($review['created_at']);

                    if (isset($review['user_avatar'])) {
                        addImageUrl($review['user_avatar'], 'uploads/avatars/');
                    }
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
        } catch (PDOException $e) {
            return [
                "success" => false,
                "message" => "Erro na consulta: " . $e->getMessage(),
                "data" => null
            ];
        }
    }

    public function createReview($data)
    {
        try {
            $sql = "INSERT INTO reviews (product_id, user_id, rating, comment) 
            VALUES (:product_id, :user_id, :rating, :comment)
            ON DUPLICATE KEY UPDATE
            rating = VALUES(rating), 
            comment = VALUES(comment)";

            $stmt = $this->conn->prepare($sql);

            // Os bindParam continuam exatamente os mesmos
            $stmt->bindParam(':product_id', $data['product_id'], PDO::PARAM_INT);
            $stmt->bindParam(':user_id', $data['user_id'], PDO::PARAM_INT);
            $stmt->bindParam(':rating', $data['rating'], PDO::PARAM_INT);
            $stmt->bindParam(':comment', $data['comment'], PDO::PARAM_STR);

            if ($stmt->execute()) {
                // Você pode querer mudar a mensagem para refletir que a ação pode ser um insert ou update
                return [
                    "success" => true,
                    "message" => "Avaliação salva com sucesso",
                    "data" => null
                ];
            } else {
                return [
                    "success" => false,
                    "message" => "Erro ao salvar a avaliação",
                    "data" => null
                ];
            }
        } catch (PDOException $e) {
            return [
                "success" => false,
                "message" => "Erro no banco de dados: " . $e->getMessage(),
                "data" => null
            ];
        }
    }

    public function updateReview($data)
    {
        try {
            $sql = "UPDATE reviews 
                SET rating = :rating, comment = :comment 
                WHERE review_id = :review_id";

            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(':review_id', $data['review_id'], PDO::PARAM_INT);
            $stmt->bindParam(':rating', $data['rating'], PDO::PARAM_INT);
            $stmt->bindParam(':comment', $data['comment'], PDO::PARAM_STR);

            if ($stmt->execute()) {
                return [
                    "success" => true,
                    "message" => "Avaliação atualizada com sucesso",
                    "data" => null
                ];
            } else {
                return [
                    "success" => false,
                    "message" => "Erro ao atualizar a avaliação",
                    "data" => null
                ];
            }
        } catch (PDOException $e) {
            return [
                "success" => false,
                "message" => "Erro no banco de dados: " . $e->getMessage(),
                "data" => null
            ];
        }
    }

    public function deleteReview($productId, $userId)
    {
        try {
            $sql = "DELETE FROM reviews WHERE product_id = :product_id AND user_id = :user_id";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(':product_id', $productId, PDO::PARAM_INT);
            $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);

            if ($stmt->execute()) {
                return [
                    "success" => true,
                    "message" => "Avaliação deletada com sucesso",
                    "data" => null
                ];
            } else {
                return [
                    "success" => false,
                    "message" => "Erro ao deletar a avaliação",
                    "data" => null
                ];
            }
        } catch (PDOException $e) {
            return [
                "success" => false,
                "message" => "Erro no banco de dados: " . $e->getMessage(),
                "data" => null
            ];
        }
    }

    public function getAllReviews()
    {
        try {
            $sql = "SELECT * FROM reviews";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();

            $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return [
                "success" => true,
                "message" => "Avaliações obtidas com sucesso",
                "data" => $reviews
            ];
        } catch (PDOException $e) {
            return [
                "success" => false,
                "message" => "Erro no banco de dados: " . $e->getMessage(),
                "data" => null
            ];
        }
    }
}

function addImageUrl(&$valueOrArray, $path = 'uploads/')
{
    if (is_array($valueOrArray)) {
        foreach ($valueOrArray as &$v) {
            if (is_string($v)) {
                $v = BASE_URL . $path . $v;
            }
        }
    } elseif (is_string($valueOrArray)) {
        $valueOrArray = BASE_URL . $path . $valueOrArray;
    }
}
