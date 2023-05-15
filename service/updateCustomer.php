<?php
require 'dbconnect.php';
$username=$_POST["username"];
$name=$_POST["name"];
$address=$_POST["address"];
$phone=$_POST["phone"];
$image=$_POST["image"];
$query="UPDATE `khachhang` SET HINHANH='$image',`TENKH`='$name',`DIACHI`='$address',`SODT`='$phone' WHERE `USERNAME`='$username'";
if(mysqli_query($connect,$query))
   echo 1;
else
    echo 0;

