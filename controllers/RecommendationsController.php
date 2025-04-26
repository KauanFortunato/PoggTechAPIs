<?php

namespace App\Controllers;

use App\Models\Recommendations;

class RecommendationsController
{
    private $Recommendations;

    public function __construct($conn)
    {
        $this->Recommendations = new Recommendations($conn);
    }

    public function addUserHistory($user_id, $product_id, $action)
    {
        return $this->Recommendations->addUserHistory($user_id, $product_id, $action);
    }
}
