<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- เรียกใช้งาน bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- เรียกใช้งาน CSS  -->
<link href="css/freelancer.css" rel="stylesheet">

	<title>เลือกกรงสัตว์เลี้ยง</title>
</head>
<body>
<div class="container">
<script>
	function updateCage() {
		window.opener.document.frmMain.txtName.value = document.frmMain.pro_name.value;
		window.opener.document.frmMain.txtQty.value = document.frmMain.product_qty.value;
		window.opener.document.frmMain.txtPrice.value = document.frmMain.product_price.value;
		window.opener.document.frmMain.txtSum.value = ((document.frmMain.product_price.value)*(document.frmMain.product_qty.value));
		window.close();
	}
</script>

<br><br>
<form name="frmMain" method="post" action="">
	<script src="jquery-latest.min.js"></script>
<div class="form-group">
	<div class="row"><!-- อาหาร -->
		</div> 
		<div class="row">
			<table style="width: 100%">
				<tr>
					<td width="100%">
						<table style="width:100%">
							<tbody id="tbody_drug">
								<tr data-value="1">
									<td colspan="12"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
					 	<div class="form-group" style="display:none"> 
							<select name="type_id" id="type_id"  class="form-control" required>
							<option value="<%=request.getParameter("refer_pet_id") %>"><%=request.getParameter("refer_pet_id") %></option> 
							</select> 
						</div>
			
		</div><!-- อาหาร -->
</div>
<script>
	$(document).ready(function() {
			var iii = $("table > tbody#tbody_drug > tr:last").data().value;
			var $trRow = $(' '
					+
					' <tr data-value="'
					+ (iii + 1)
					+ '"> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 			<input type="text"  class="form-control"  value="สินค้า" readonly="readonly"/>'
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<select name="product_name" id="product_name" class="form-control" required> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' 	<div class="form-group"  style="display:none"> '
					+ ' 		<select name="pro_name" id="pro_name" class="form-control" required> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 			<input type="text"  class="form-control"  value="ราคา" readonly="readonly"/>'
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 		<select name="product_price" id="product_price" class="form-control" style="min-width:100px;"> '
					+ ' 			<option value=""></option> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 			<input type="text"  class="form-control"  value="บาท" readonly="readonly"/> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 			<input type="text"  class="form-control"  value="จำนวน" readonly="readonly"/> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 			<input type="number"  class="form-control" name="product_qty" value="1"/> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" style="min-width:100px;"> '
					+ ' 		<select name="product_unit" id="product_unit" class="form-control" required> '
					+ ' 			<option value="" ></option> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' </td> ' + ' </tr> ');
			$trRow.find('.btn-danger').click(function(){
				$(this).parent().parent().parent().remove();
			});
			var refer_id;
			refer_id=parseInt(document.frmMain.type_id.value);
				$.ajax({
		            url:'ProductGetAllServlet',
		            data:{id_type:refer_id},
		            type:'get',
		            dataType: 'json',
		            success:function(data){
		            	$trRow.find('select#product_name').empty();
		            	$.each(data,function(key,val) {
		            		$trRow.find('select#product_name').append('<option value="'+val.product_id+'" >'+val.product_name+'</option>');
		            		$trRow.find("select#product_name").on("change",function() {
								$.ajax({
								    url:'ProductGetServlet',
								    data:{id_type:$(this).val()},
								    type:'get',
								    dataType: 'json',
								    success:function(data){
					            	$trRow.find('select#product_price').empty();
								    $trRow.find('select#product_unit').empty();
					            	$trRow.find('select#pro_name').empty();
					            	$.each(data,function(key,val) {
					            		$trRow.find('select#product_price').append('<option value="'+val.product_price+'" >'+val.product_price+'</option>');
					            		$trRow.find('select#product_unit').append('<option value="'+val.product_unit+'" >'+val.product_unit+'</option>');
					            		$trRow.find('select#pro_name').append('<option value="'+val.product_name+'" >'+val.product_name+'</option>');
									});
					            	$trRow.find('select#product_price').trigger( "change" );
					            	$trRow.find('select#product_unit').trigger( "change" );
					            	$trRow.find('select#pro_name').trigger( "change" );
					            }
							});
						});
						});
		            	$trRow.find('select#product_name').trigger( "change" );
		            	
		            }
				});
			$("table > tbody#tbody_drug").append($trRow);
		});
</script>
	<div class="col-sm-12">
		<div class="form-group" style="text-align: center">
			<input name="Close" type="submit" class="btn btn-success" id="CloseCage" onClick="Javascript:updateCage()" value="ยืนยันรายการ">
		</div>
	</div>
</form>
</div>
</body>
</html>