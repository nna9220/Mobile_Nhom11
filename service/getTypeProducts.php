<?php
require 'dbconnect.php';
class TYPE
{
    function __construct($code, $name, $image)
    {
        $this->code = $code;
        $this->name = $name;
        $this->image = $image;
    }
}
$query = "select * from loaisanpham";
$data = mysqli_query($connect, $query);
$arraylist = array();
while ($row = mysqli_fetch_assoc($data)) {
    array_push($arraylist, new TYPE($row['MALSANPHAM'], $row['TENLSANPHAM'], $row['HINHANH']));
}
echo json_encode($arraylist,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
?>