<?php

include_once('./headers.php');
include_once('./db.php');

$stmt = $db->prepare("SELECT * FROM categories");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
