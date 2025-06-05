<?php

namespace App\Controllers;

use App\Models\Review;

class ReviewController
{
    private $review;

    public function __construct($conn)
    {
        $this->review = new Review($conn);
    }

    public function getReviews($product_id, $quantity)
    {
        return $this->review->getReviews($product_id, $quantity);
    }
}
