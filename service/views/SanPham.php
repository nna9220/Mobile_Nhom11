<?php
$header="
<style>
table thead tr th,
table tfoot tr th{
    white-space: nowrap;
}
</style>
";

include "layout/header.php";
include "layout/navbar.php";
?>


<div class="container-fluid">

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Sản phẩm</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Danh sách các sản phẩm</h6>
    </div>
    <div class="card-body">
        <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#modelId">Thêm mới</button>
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th> </th>
                        <th>Tên Sản Phẩm</th>
                        <th>Giá tiền</th>
                        <th>Số lượng</th>
                        <th>Giá tiền khuyến mãi</th>
                        <th>Ngày cập nhật</th>
                        <th>Danh mục</th>
                        <th style="width:100px;">Chức năng</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                      foreach( $data['dulieu'] as $item){
                          ?>
                        <tr id="<?php echo $item->maSanPham?>" class="text-center">
                        <td style="max-width:50px;max-height:50px;" ><img style="max-width:100%;max-height:100%" src="<?php echo $item->hinhAnh ?>"/></td>
                        <td><?php echo $item->tenSanPham ?></td>
                        <td><?php echo $item->giaTien ?></td>
                        <td><?php echo $item->soLuong ?></td>
                        <td><?php echo $item->giaTienKhuyenMai ?></td>
                        <td><?php echo $item->ngayCapNhat ?></td>
                        <td><?php echo $item->maLoaiSanPham ?></td>
                        <td>
                            <ul class="p-0  justify-content-around d-flex" style="list-style:none;">
                                <li class="btnEdit" style="cursor:pointer"><i class="text-success fas fa-edit"></i></li>
                                <li class="btnDel" style="cursor:pointer"><i class="text-danger fas fa-trash-alt"></i></li>
                            </ul>
                        </td>
                    </tr>
                    <?php
                      }
                      ?>
                    
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title">Thêm Sản Phẩm</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                          </button>
                  </div>
                  <form action="./SanPham/Insert" enctype="multipart/form-data" method="POST">
                  <div class="modal-body">
                      
                  <div class="form-group">
                        <label for="">Loại sản phẩm</label>
                        <select class="form-control" name="loaisanpham" id="">
                            <?php
                            foreach($data['loaisanpham'] as $item){
                            ?>

                            <option value="<?php echo $item->code?>"><?php echo $item->tensanpham?></option>

                            <?php
                            }
                            ?>
                        </select>
                    </div>

                     <div class="form-group">
                       <label for="">Hình ảnh</label>
                       <input type="file" class="form-control-file" name="hinhanh" id="hinhanh" placeholder="" aria-describedby="fileHelpId">
                     </div>

                     <div class="form-group">
                       <label for="">Tên Sản Phẩm</label>
                       <input type="text" name="tensanpham" id="tensanpham" class="form-control" placeholder="" aria-describedby="helpId">
                     </div>

                     <div class="form-group">
                       <label for="">Giá tiền</label>
                       <input type="text" name="giatien" id="giatien" class="form-control" placeholder="" aria-describedby="helpId">
                     </div>

                     <div class="form-group">
                       <label for="">Số lượng</label>
                       <input type="number" name="soluong" id="soluong" class="form-control" placeholder="" aria-describedby="helpId">
                     </div>

                     <div class="form-group">
                       <label for="">Giá tiền khuyến mãi</label>
                       <input type="text" name="giatienkhuyenmai" id="giatienkhuyenmai" class="form-control" placeholder="" aria-describedby="helpId">
                     </div>

                     <div class="form-group">
                       <label for="">Mô tả</label>
                       <input type="text" name="mota" id="mota" class="form-control" placeholder="" aria-describedby="helpId">
                     </div>
                  </div>
                  <div class="modal-footer">
                      <input type="reset" value="hi"/>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="submit"  class="btn btn-primary">Save</button>
                  </div>
                  </form>
              </div>
          </div>
      </div>

                <?php
                $scripts="
                <script>

$('.btnDel').on('click',function(){
  var masanpham=$(this).closest('tr').attr('id');
        $.ajax({
          url:'./SanPham/Del',
          type:'POST',
          data:{
            masanpham: masanpham
          },
          success: function(data){
            if(data==1){
              alert('xoá thành công');
              window.location.reload();
            }else{
              alert('xoá thất bại');
            }
          }
        })
      })
      </script>
                ";
                include "layout/scripts.php";
                ?>