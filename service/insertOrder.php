<?php
require 'dbconnect.php';
$username=$_POST["username"];
$query="INSERT INTO `hoadon`( `MAKH`, `TONGTIEN`, `NGAYLAPHOADON`) VALUES ('$username',0,CURRENT_DATE)";
if(mysqli_query($connect,$query))
{
    $query="select MAHD from hoadon order by MAHD DESC LIMIT 1";
    $data=mysqli_query($connect,$query);
    $count=mysqli_num_rows($data);
    if($count!=0)
    {
        $row=mysqli_fetch_assoc($data);
         echo $row["MAHD"];
    }
    else
    echo 0;
}
else
    echo 0;
