<?php

namespace App\Controllers;

use App\Models\Product;

class ProductController
{
    private $product;

    public function __construct(\PDO $conn)
    {
        $this->product = new Product($conn);
    }

    public function createProduct($data, $images)
    {
        return $this->product->createProduct($data, $images);
    }

    public function updateProduct($product_id, $data, $images)
    {
        return $this->product->updateProduct($product_id, $data, $images);
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

    public function getProductByCategories($category, $all = false, $quantity = 9)
    {
        return $this->product->getProductByCategories($category, $all, $quantity);
    }

    public function getDistributedProductsByCategories($categories, $quantity = 9)
    {
        return $this->product->getDistributedProductsByCategories($categories, $quantity);
    }

    public function addProductOnCart($user_id, $product_id, $quantity)
    {
        return $this->product->addProductOnCart($user_id, $product_id, $quantity);
    }

    public function saveProduct($user_id, $product_id)
    {
        return $this->product->saveProduct($user_id, $product_id);
    }

    public function removeOneFromCart($user_id, $product_id, $tipo)
    {
        return $this->product->removeOneFromCart($user_id, $product_id, $tipo);
    }

    public function reduceQuantity($product_id, $quantity)
    {
        return $this->product->reduceQuantity($product_id, $quantity);
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

    public function getPopularProducts($all, $quantity)
    {
        return $this->product->getPopularProducts($all, $quantity);
    }

    public function getRecommendedProducts($user_id)
    {
        return $this->product->getRecommendedProducts($user_id);
    }

    public function getFavCategories($user_id)
    {
        return $this->product->getFavCategories($user_id);
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
