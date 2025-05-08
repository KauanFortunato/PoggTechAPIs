<?php

namespace App\Controllers;

use App\Models\Product;

class ProductController
{
    private $product;

    public function __construct($conn)
    {
        $this->product = new Product($conn);
    }

    public function createProduct($data, $images)
    {
        return $this->product->createProduct($data, $images);
    }

    public function deleteProduct($product_id)
    {
        return $this->product->deleteProduct($product_id);
    }

    public function getProduct($id)
    {
        return $this->product->getProduct($id);
    }

    public function getAllProducts()
    {
        return $this->product->getAllProducts();
    }

    public function getProductByCategories($category, $quantity = 9)
    {
        return $this->product->getProductByCategories($category, $quantity);
    }

    public function getDistributedProductsByCategories($categories, $quantity = 9)
    {
        return $this->product->getDistributedProductsByCategories($categories, $quantity);
    }


    public function addProductOnCart($user_id, $product_id, $tipo)
    {
        return $this->product->addProductOnCart($user_id, $product_id, $tipo);
    }

    public function getAllProductsFromCart($user_id, $tipo)
    {
        return $this->product->getAllProductsFromCart($user_id, $tipo);
    }

    public function getUserFavOrCart($user_id, $tipo)
    {
        return $this->product->getUserFavOrCart($user_id, $tipo);
    }

    public function verifyProductOnCart($user_id, $product_id, $tipo)
    {
        return $this->product->verifyProductOnCart($user_id, $product_id, $tipo);
    }

    public function removeProductOnCart($user_id, $product_id, $tipo)
    {
        return $this->product->removeProductOnCart($user_id, $product_id, $tipo);
    }

    public function attProductViews($product_id)
    {
        return $this->product->attProductViews($product_id);
    }

    public function getPopularProducts()
    {
        return $this->product->getPopularProducts();
    }

    public function getRecommendedProducts($user_id)
    {
        return $this->product->getRecommendedProducts($user_id);
    }

    public function getFavCategory($user_id)
    {
        return $this->product->getFavCategory($user_id);
    }

    public function searchProducts($search)
    {
        return $this->product->searchProducts($search);
    }

    public function getSuggestions($query)
    {
        return $this->product->getSuggestions($query);
    }

    public function getMyProducts($user_id)
    {
        return $this->product->getMyProducts($user_id);
    }
}
