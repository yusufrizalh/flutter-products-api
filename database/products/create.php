<?php

include_once('./headers.php');
include_once('./db.php');

$name = $_POST['product_name'];
$price = (int) $_POST['product_price'];
$category = (int) $_POST['category_id'];

$stmt = $db->prepare("INSERT INTO products(product_name, product_price, category_id) VALUES(?, ?, ?)");
$result = $stmt->execute([$name, $price, $category]);

if (!$result) {
    echo "Error";
} else {
    echo json_encode(['success' => $result]);
}
