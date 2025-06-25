<?php

namespace App\Controllers;

use App\Models\Review;

class ReviewController
{
    private $review;

    public function __construct(\PDO $conn)
    {
        $this->review = new Review($conn);
    }

    public function getReviews($product_id, $quantity)
    {
        return $this->review->getReviews($product_id, $quantity);
    }

    public function createReview($data)
    {
        return $this->review->createReview($data);
    }

    public function updateReview($data)
    {
        return $this->review->updateReview($data);
    }

    public function deleteReview($product_id, $user_id)
    {
        return $this->review->deleteReview($product_id, $user_id);
    }

    public function getAllReviews()
    {
        return $this->review->getAllReviews();
    }
}
