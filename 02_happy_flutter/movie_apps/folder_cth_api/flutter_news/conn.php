<?php

$connect = new mysqli("localhost","root","","db_news_sport");
if ($connect) {
    // echo "Connection success!";
}else{
    echo "Connection Failed";
    exit();
}


?>