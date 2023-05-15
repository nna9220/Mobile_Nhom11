<?php
require "./api/dbconnect.php";
   class LoaiSanPham{

    function __construct($code,$tensanpham,$img){
        $this->code=$code;
        $this->tensanpham=$tensanpham;
        $this->img=$img;
    }

    function loadLoaiSanPham(){
        $array=array();
        $db=new Database();
        $connect=$db->getDB();
        $query="select * from loaisanpham";
            $data=mysqli_query($connect,$query);
    
            $array=array();
        while($row = mysqli_fetch_assoc($data)){
          array_push($array,new LoaiSanPham($row['MALSANPHAM'],$row['TENLSANPHAM'],$row['HINHANH']));
        }
        return $array;

    }

    function addLoaiSanPham($loaisanphams){
        $db=new Database();
        $connect=$db->getDB();
$query="Insert into loaisanpham (`TENLSANPHAM`, `HINHANH`) values ('$loaisanphams->tensanpham','$loaisanphams->img')";
    $result=mysqli_query($connect,$query);
    if($result)
    return 1;
    else
    return 0;
    }

    function delLoaiSanPham($maloai){
        $db=new Database();
        $connect=$db->getDB();
        $query="delete from loaisanpham where MALSANPHAM=$maloai";
        $result=mysqli_query($connect,$query);
        if($result)
        return 1;
        return 0;
    }

}
?>