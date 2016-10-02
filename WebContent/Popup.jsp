<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>ThaiCreate.Com Tutorial</title>
</head>
<body>
<script language="JavaScript">
	function updateOpener() {
		window.opener.document.calpet-deposit.txtName.value = document.frmMain.product_id.value;
		window.opener.document.calpet-deposit.txtQty.value = document.frmMain.product_qty.value;
		window.opener.document.calpet-deposit.txtPrice.value = document.frmMain.product_id.value;
		window.opener.document.calpet-deposit.txtUnit.value = document.frmMain.productUnit.value;
		window.close();
	}
</script>
<form name="frmMain" method="post" action="">
	<script src="jquery-latest.min.js"></script>
	<div class="col-sm-12">
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
							</div>
<script>
	$(document).ready(function() {
		var fullDate = new Date()
		console.log(fullDate);
		var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
		var currentDate = fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
		console.log(currentDate);
		$("input[name='postdate']").val(currentDate);
			var iii = $("table > tbody#tbody_drug > tr:last").data().value;
			var $trRow = $(' '
					+
					' <tr data-value="'
					+ (iii + 1)
					+ '"> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<select name="type_id" id="type_id" class="form-control" required> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<select name="type_id" id="type_id" class="form-control" required> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<select name="product_id" id="product_id" class="form-control" required> '
					+ ' 			<option value="">-- กรุณาเลือกสินค้า --</option> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<input type="number"  class="form-control" name="product_qty" value="1"/> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<span name="productUnit" id="spanUnit"></span> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<button type="button" id="del_row_drug" class="btn btn-sm btn-danger">ลบ</button> '
					+ ' 	</div> '
					+ ' </td> ' + ' </tr> ');
			$trRow.find('.btn-danger').click(function(){
				$(this).parent().parent().parent().remove();
			});
			
			$.get("AjaxGetPetType",function(responseText) {
				$.each(responseText,function(key,val) {
					$trRow.find('select#type_id').append($('<option>',{value : val.type_id,text : val.type_name}));
				});
				$trRow.find('select#type_id').trigger( "change" );
			});
			$trRow.find("select#type_id").on("change",function() {
				
				$.ajax({
		            url:'ProductGetAllServlet',
		            data:{id_type:$(this).val()},
		            type:'get',
		            dataType: 'json',
		            success:function(data){
		            	
		            	$trRow.find('select#product_id').empty();
		            	
		            	$.each(data,function(key,val) {

		            		$trRow.find('select#product_id').append('<option value="'+val.product_name+'" data-unit="'+val.product_unit+'">'+val.product_name+'</option>');
						});
		            	$trRow.find('select#product_id').trigger( "change" );
		            }
				});
			});
			$trRow.find("select#product_id").on("change",function() {
				
				$trRow.find("#").text($(this).find(':selected').data('unit'));
			});
			$("table > tbody#tbody_drug").append($trRow);
		});
</script>
	<input name="Close" type="submit" id="Close"onClick="Javascript:updateOpener()" value="ยืนยันรายการ">
</form>
</body>
</html>