<?php
require 'dbconnect.php';
class ORDERDETAIL{
    function __construct($code_order,$name_product,$price,$quantity,$total)
    {
        $this->code_order=$code_order;
        $this->name_product=$name_product;
        $this->total=$total;
        $this->price=$price;
        $this->quantity=$quantity;
    }
}
$code_order=$_GET["code_order"];
if(isset($code_order))
{
  $query="select chitiethoadon.*,sanpham.TENSANPHAM from chitiethoadon,sanpham where chitiethoadon.masanpham=sanpham.masanpham and mahd='$code_order'";
  $data=mysqli_query($connect,$query);
  $arrayList=array();
  while($row=mysqli_fetch_assoc($data))
        array_push($arrayList,new ORDERDETAIL($row["MAHD"],$row["TENSANPHAM"],$row["DONGIA"],$row["SOLUONG"],$row["TONGITEN"]));
  echo json_encode($arrayList,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}


