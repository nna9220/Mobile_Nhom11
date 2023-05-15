<?php
require 'dbconnect.php';
class PRODUCT
{
    function __construct($code, $name, $price,$quantity,$price_discounted,$description,$image,$date_update,$type_code)
    {
        $this->code = $code;
        $this->name = $name;
        $this->price = $price;
        $this->quantity = $quantity;
        $this->price_discounted = $price_discounted;
        $this->description = $description;
        $this->image = $image;
        $this->date_update = $date_update;
        $this->type_code = $type_code;
    }
}
$keyword=$_GET['keyword'];
if(isset($keyword))
{
    $query = "select sanpham.* from sanpham,loaisanpham where sanpham.MALSANPHAM=loaisanpham.MALSANPHAM AND (sanpham.TENSANPHAM LIKE '%$keyword%' or loaisanpham.TENLSANPHAM like '%$keyword%' or sanpham.MOTA like '%$keyword%')";
    $data = mysqli_query($connect, $query);
    $arraylist = array();
    while ($row = mysqli_fetch_assoc($data)) {
        array_push($arraylist, new PRODUCT($row['MASANPHAM'], $row['TENSANPHAM'], $row['GIATIEN'], $row['SOLUONG'], $row['GIATIENKHUYENMAI'], $row['MOTA'], $row['HINHANH'], $row['NGAYCAPNHAT'], $row['MALSANPHAM']));
}
echo json_encode($arraylist,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

}
?>