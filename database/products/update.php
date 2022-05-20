<?php

include_once('./headers.php');
include_once('./db.php');

$id = (int) $_POST['product_id'];
$name = $_POST['product_name'];
$price = (int) $_POST['product_price'];

$stmt = $db->prepare("UPDATE products SET product_name=?, product_price=? WHERE product_id=?");
$result = $stmt->execute([$name, $price, $id]);

echo json_encode(['success' => $result]);
