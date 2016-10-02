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
		window.opener.document.frmMain.cageSize.value = document.frmMain.cagesize_id.options[document.frmMain.cagesize_id.selectedIndex].text;
		window.opener.document.frmMain.prd_date.value = document.frmMain.prd_date.value;
		window.opener.document.frmMain.cage_id.value = document.frmMain.cagesize_id.value;
		window.opener.document.frmMain.cageName.value = document.frmMain.c_name.value;
		window.opener.document.frmMain.sizeId.value = document.frmMain.cage_size.value;
		window.opener.document.frmMain.cagePrice.value = document.frmMain.cage_price.value;
		window.close();
	}
</script>
<br><br>
<form name="frmMain" method="post" action="">
	<script src="jquery-latest.min.js"></script>
	<input type="hidden" name="prd_date" id="prd_date" readonly
										 class="form-control"
										required="required" />
<div class="form-group">
	<div class="row"><!-- อาหาร -->
		</div> 
		<div class="row">
			<table style="width: 100%">
				<tr>
					<td width="100%">
						<table style="width: 100%">
							<tbody id="tbody_drug">
								<tr data-value="1">
									<td colspan="3"></td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="100%">
						<table style="width: 100%">
							<tbody id="tbody_treatment">
								<tr data-value="1">
									<td colspan="3"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div><!-- อาหาร -->
</div>
<script>
	$(document).ready(function() {
		var fullDate = new Date()
		console.log(fullDate);
		var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
		var currentDate =  fullDate.getFullYear()+ "-" + twoDigitMonth + "-" + fullDate.getDate();
		console.log(currentDate);
		$("input[name='prd_date']").val(currentDate);
			var iii = $("table > tbody#tbody_drug > tr:last").data().value;
			var $trRow = $(' '
					+
					' <tr data-value="'
					+ (iii + 1)
					+ '"> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 			<input type="text"  class="form-control"  value="ขนาดกรง" style="min-width:50px;" readonly="readonly"/>'
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 		<select name="cagesize_id" id="cagesize_id" class="form-control" style="min-width:100px;" required> '
					+ ' 				</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 			<input type="text"  class="form-control"  value="ชื่อกรง" style="min-width:50px;" readonly="readonly"/>'
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 		<select name="cage_size" id="cage_size" class="form-control" style="min-width:100px;" required> '
					+ ' 				</select> '
					+ ' 				<select name="c_name" id="c_name" style="display:none" style="min-width:100px;" class="form-control"> '
					+ ' 					<option value=""></option> '
					+ ' 				</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 			<input type="text"  class="form-control"  value="ราคา" style="min-width:50px;" readonly="readonly"/>'
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 	<select name="cage_price" id="cage_price" class="form-control"> '
					+ ' 				</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group" > '
					+ ' 			<input type="text"  class="form-control"  value="บาท" readonly="readonly"/> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' </td> ' + ' </tr> ');
			$trRow.find('.btn-danger').click(function(){
				$(this).parent().parent().parent().remove();
			});
			
			$.get("AjaxGetCageSize",function(responseText) {
				$.each(responseText,function(key,val) {
					$trRow.find('select#cagesize_id').append($('<option>',{value : val.cagesize_id,text : val.cage_size}));
					$trRow.find("select#cagesize_id").on("change",function() {
						$.ajax({
						    url:'AjaxGetCageNameServlet',
						    data:{id_type:$(this).val()},
						    type:'get',
						    dataType: 'json',
						    success:function(data){
			            	$trRow.find('select#cage_name').empty();
			            	$.each(data,function(key,val) {
			            		$trRow.find('select#cage_name').append('<option value="'+val.cage_size+'" >'+val.cage_size+'</option>');
							});
			            	$trRow.find('select#cage_name').trigger( "change" );
			            }
					});
				});
				});
				$trRow.find('select#cagesize_id').trigger( "change" );
			});
			$trRow.find("select#cagesize_id").on("change",function() {
				
				$.ajax({
		            url:'CageGetAllServlet',
		            data:{id_type:$(this).val()},
		            type:'get',
		            dataType: 'json',
		            success:function(data){
		            	$trRow.find('select#cage_size').empty();
		            	$.each(data,function(key,val) {
		            		$trRow.find('select#cage_size').append('<option value="'+val.cage_id+'" >'+val.cage_name+'</option>');
		            		$trRow.find("select#cage_size").on("change",function() {
								$.ajax({
								    url:'CageGetPriceServlet',
								    data:{id_type:$(this).val()},
								    type:'get',
								    dataType: 'json',
								    success:function(data){
					            	$trRow.find('select#cage_price').empty();
					            	$trRow.find('select#c_name').empty();
					            	$.each(data,function(key,val) {
					            		$trRow.find('select#cage_price').append('<option value="'+val.cage_price+'" >'+val.cage_price+'</option>');
					            		$trRow.find('select#c_name').append('<option value="'+val.cage_name+'" >'+val.cage_name+'</option>');
									});
					            	$trRow.find('select#cage_price').trigger( "change" );
					            	$trRow.find('select#c_name').trigger( "change" );
					            }
							});
						});
						});
		            	$trRow.find('select#cage_size').trigger( "change" );
		            }
				});
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