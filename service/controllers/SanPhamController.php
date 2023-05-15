<?php
    require "./model/LOAISANPHAM.php";
    require "./model/SANPHAM.php";
class SanPhamController extends Controller{
public function Index(){
    $SanPham=new SanPham("","","","","","","","","");
    $data['dulieu']=$SanPham->loadSanPham();
    $LoaiSanPham=new LoaiSanPham("","","");
    $data['loaisanpham']=$LoaiSanPham->loadLoaiSanPham();
    $this->View("SanPham",$data);
}

public function Insert(){

$target_file="";
if(isset($_FILES['hinhanh'])){
    $file_name = $_FILES['hinhanh']['name'];
      $file_type=$_FILES['hinhanh']['type'];
      $file_tmp =$_FILES['hinhanh']['tmp_name'];

      $target_dir = "assets/hinhanh/";
    $target_file = $target_dir . basename($_FILES["hinhanh"]["name"]);
echo $target_file;
      $file_ext=strtolower(end(explode('.',$_FILES['hinhanh']['name'])));

      $expensions= array("jpeg","jpg","png");

      if(in_array($file_ext,$expensions)=== false){
        $errors="extension not allowed, please choose a JPEG or PNG file.";
     }else{
        move_uploaded_file($file_tmp,$target_file);
     }
}
echo $_POST['loaisanpham'];
$SanPham=new SanPham(1,$_POST['tensanpham'],$_POST['giatien'],$_POST['soluong'],$_POST['giatienkhuyenmai'],$_POST['mota'],$file_name,date("Y-m-d h:i:s a"),$_POST['loaisanpham']);
$result=$SanPham->addSanPham($SanPham);
if($result==0){
    echo "Thêm Thất bại";
}else{
    header('Location: ./SanPham');
}
}

    function Del(){
        $SanPham=new SanPham("","","","","","","","","");
        $masanpham=$_POST['masanpham'];
        $result=$SanPham->delSanPham($masanpham);
        echo $result;
    }
}

?>