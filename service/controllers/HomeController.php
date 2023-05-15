<?php
    require "./model/LOAISANPHAM.php";
class HomeController extends Controller{
public function Index(){
    $LoaiSanPham=new LoaiSanPham("","","");
    $data['dulieu']=$LoaiSanPham->loadLoaiSanPham();
    $this->View("Home",$data);
}

public function Insert(){

$target_file="";
if(isset($_FILES['hinhanh'])){
    $file_name = $_FILES['hinhanh']['name'];
      $file_type=$_FILES['hinhanh']['type'];
      $file_tmp =$_FILES['hinhanh']['tmp_name'];

      $target_dir = "assets/hinhanh/";
     
    $target_file = $target_dir . basename($_FILES["hinhanh"]["name"]);
 
      $file_ext=strtolower(end(explode('.',$_FILES['hinhanh']['name'])));

      $expensions= array("jpeg","jpg","png");

      if(in_array($file_ext,$expensions)=== false){
        $errors="extension not allowed, please choose a JPEG or PNG file.";
     }else{
        move_uploaded_file($file_tmp,$target_file);
       
     }
}
$LoaiSanPham=new LoaiSanPham(1,$_POST['tenloai'],$file_name);
$result=$LoaiSanPham->addLoaiSanPham($LoaiSanPham);
if($result==0){
    echo "Thêm Thất bại";
}else{
    header('Location: ./');
}
}

    function Del(){
        $LoaiSanPham=new LoaiSanPham("","","");
        $maloai=$_POST['maloai'];
        $result=$LoaiSanPham->delLoaiSanPham($maloai);
        echo $result;
    }
}

?>