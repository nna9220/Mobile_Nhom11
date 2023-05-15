<?php
   class SanPham{

    function __construct($maSanPham,$tenSanPham,$giaTien,$soLuong,$giaTienKhuyenMai,$moTa,$hinhAnh,$ngayCapNhat,$maLoaiSanPham){
        $this->maSanPham=$maSanPham;
        $this->tenSanPham=$tenSanPham;
        $this->giaTien=$giaTien;
        $this->soLuong=$soLuong;
        $this->giaTienKhuyenMai=$giaTienKhuyenMai;
        $this->moTa=$moTa;
        $this->hinhAnh=$hinhAnh;
        $this->ngayCapNhat=$ngayCapNhat;
        $this->maLoaiSanPham=$maLoaiSanPham;
    }

    function loadSanPham(){
        $array=array();
        $db=new Database();
        $connect=$db->getDB();
        $query="select * from sanpham";
            $data=mysqli_query($connect,$query);
    
            $array=array();
        while($row = mysqli_fetch_assoc($data)){
          array_push($array,new SanPham($row['MASANPHAM'],$row['TENSANPHAM'],$row['GIATIEN'],$row['SOLUONG'],$row['GIATIENKHUYENMAI'],$row['MOTA'],$row['HINHANH'],$row['NGAYCAPNHAT'],$row['MALSANPHAM']));
        }
        return $array;

    }

    function addSanPham($sanPham){
        $db=new Database();
        $connect=$db->getDB();
$query="Insert into sanpham (`TENSANPHAM`, `GIATIEN`,`SOLUONG`, `GIATIENKHUYENMAI`,`MOTA`, `HINHANH`,`NGAYCAPNHAT`, `MALSANPHAM`) values ('$sanPham->tenSanPham',$sanPham->giaTien,$sanPham->soLuong,$sanPham->giaTienKhuyenMai,'$sanPham->moTa','$sanPham->hinhAnh','$sanPham->ngayCapNhat','$sanPham->maLoaiSanPham')";
    $result=mysqli_query($connect,$query);
    if($result)
    return 1;
    else
    return 0;
    }

    function delSanPham($masanpham){
        $db=new Database();
        $connect=$db->getDB();
        $query="delete from sanpham where MASANPHAM=$masanpham";
        $result=mysqli_query($connect,$query);
        if($result)
        return 1;
        return 0;
    }

}
?>