<?php

include "conn.php";

$queryResult = $connect->query("SELECT * FROM tb_news_olahraga");
$result = array();

while($fetchData = $queryResult->fetch_assoc()){
    $result[]=$fetchData;
}

// var_dump($result);
echo json_encode($result);



?>