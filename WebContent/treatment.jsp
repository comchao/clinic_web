<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.List"%>
<%@ page import="java.text.*" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ include file="header_index.jsp"%>

<script>
	function editConfirm() {
		if (confirm("ต้องการบันทึกปรข้อมูล")) {
			return true;
		}
		return false;
	}
	function delConfirm() {
		if (confirm("คุณต้องการลบข้อมูลสินค้าใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
	
</script>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("pet_id") == null){
		response.sendRedirect("index.jsp");
	}else{
		
		int pet_id = Integer.parseInt(request.getParameter("pet_id"));
		PetsBean petBean = new PetsBean();	
		
		if(PetsDAO.checkStatusTreatment(pet_id).equals("N")){
			
			out.print("<script>alert('มีสัตวแพทย์ท่านอื่นทำการรับคิวตรวจแล้ว');window.location='pet_waiting_treatment.jsp';</script>");
			
			//มีคนเอาไปตรวจแล้ว
		}else{
			petBean.setId(pet_id);
			PetsDAO.updateNoTreatmentPet(petBean);
		}
	}
	
%>

<br>
<br>
<br>
<br>

<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
	<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy"); %>
	<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("MM"); %>
	<% String No_Bil =  request.getParameter("No_Bil");%>
	
<div class="container">
<!-- <div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="pet_waiting_treatment.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div> -->

	<div class="row">
		<h3 align="center">การรักษา</h3>

		<br />
	
		<form action="InsertTreatmentServlet" name="form1" id="form1" method="POST"
			
			style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">
 <input type="hidden" name="postdate1" value="<%= df.format(new java.util.Date()) %>" >
 <input type="hidden" name="Treatment__year" value="<%= df2.format(new java.util.Date())%>" >
 
			  <input type="hidden" name="Treatment_month" value="<%= df3.format(new java.util.Date())%>" >	
			  	  <input type="hidden" name="No_Bil" value="<%=No_Bil%>" >	
			  
			  
			  
			  
				<div class="col-sm-3">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>ชื่อสัตว์</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_name")%>"
										type="text" name="pet_name" id="pet_name" class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>ประเภทสัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_category")%>"
										type="text" name="pet_category" id="pet_category"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>สายพันธ์สัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_gene")%>"
										type="text" name="pet_geng" id="pet_gene" class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>เพศ</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_gender")%>"
										type="text" name="pet_gender" id="pet_gender"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>น้ำหนัก</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_weight")%>"
										type="text" name="pet_weight" id="pet_weight"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">

						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>วันเกิด</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_birthday")%>"
										type="text" name="pet_birthday" id="pet_birthday"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>อายุ</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_age")%>" type="text"
										name="pet_age" id="pet_age" class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<div>
									<p>ตำหนิ/สี</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">
									<textarea name="pet_extra" rows="5" class="form-control"
										readonly="readonly"><%=request.getParameter("pet_extra")%></textarea>
									
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="col-sm-3">
					<div class="form-group">

						<div class="row">
							<div class="col-sm-5">
								<div class="form-group">
									<p>วันที่</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">
									<input type="text" name="postdate" id="from" readonly
										placeholder="วันที่ทำการรักษา" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="form-group">
									<p>สัตวแพทย์</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">
									<input
										value="<%=session.getAttribute("firstname")%> <%=session.getAttribute("lastname")%>"
										type="text" name="veterinary_name" id="veterinary_name"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-5">
								<div class="form-group">
									<p>อาการ</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">
									<textarea name="cure_de" rows="5" class="form-control"
										placeholder="อาการ" required
										data-validation-required-message="Please enter a petgens."></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col-sm-3">
					<div class="form-group">
						

						<div class="row">
							<div class="col-sm-5">
								<div class="form-group">
									<p>หมายเหตุ</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">
									<textarea name="cure_treament" rows="5" class="form-control"
										placeholder="หมายเหตุ" required
										data-validation-required-message="Please enter a petgens.">-</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			
			<div class="row">

				<table style="width: 100%">
					<tr>
						<td width="50%">
							<table style="width: 20%">
								<tbody>
									<tr data-value="1">
										<td colspan="3">
											<div class="form-group">
												 <button type="button" id="add_row_drug"
													class="form-control" >เพิ่มจ่ายยา</button> <font color="red" size="2"> *กรุณาเพิ่มการจ่ายยา</font><br>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td width="50%">
							<table style="width: 20%">
								<tbody>
									<tr data-value="1">
										<td colspan="3">
											<div class="form-group">
											<button type="button" id="add_row_treatment"
													class="form-control" > ค่ารักษา</button><font color="red" size="2"> *กรุณาเลือกค่ารักษา </font><br>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="row">

				<table style="width: 100%">
					<tr>
						<td width="50%">
							<table style="width: 100%">
								<tbody id="tbody_drug">
									<tr data-value="1">
										<td colspan="3"></td>
									</tr>
								</tbody>
							</table>
						</td>
						<td width="50%">
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
			</div>
			
			
			

			<div class="row">
				<div class="col-sm-12">
					<div class="form-group" style="text-align: right">
					<input type="hidden" name="Status" value="0"> 
						<input type="hidden" name="pet_id" value="<%=request.getParameter("pet_id")%>">
						<input type="submit" name="submit" id="submit"
						class="btn btn-success" value="บันทึกข้อมูล"  /><br><br><br><br>
					</div>
				</div>

			</div>

		
	</div>
</div>
<script src="jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		
		var fullDate = new Date()
		console.log(fullDate);
		var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
		 
		var currentDate = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + fullDate.getDate() ;
		console.log(currentDate);
		
		
		$("input[name='postdate']").val(currentDate);
		
		
		
		
		$(document).on("click","button#add_row_drug",function() {
			
			var iii = $("table > tbody#tbody_drug > tr:last").data().value;
			var $trRow = $(' '
					+
					' <tr data-value="'
					+ (iii + 1)
					+ '"> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<select name="type_drug_id[]" id="type_drug_id" class="form-control" required> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<select name="drug_id[]" id="drug_id" class="form-control" required> '
					+ ' 			<option value="">-- กรุณาเลือกการจ่ายยา --</option> '
					+ ' 		</select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<input type="number"  class="form-control" name="drug_qty[]" value="1"  placeholder="จำนวน"/> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<span id="spanUnit"></span> '
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
			
			$.get("AjaxGetTypeServlet",function(responseText) {
				$.each(responseText,function(key,val) {
					$trRow.find('select#type_drug_id').append($('<option>',{value : val.type_id,text : val.type_name}));
				});
				$trRow.find('select#type_drug_id').trigger( "change" );
			});
			
			
			$trRow.find("select#type_drug_id").on("change",function() {
				
				$.ajax({
		            url:'DrugGetAllServlert',
		            data:{id_type:$(this).val()},
		            type:'get',
		            dataType: 'json',
		            success:function(data){
		            	
		            	$trRow.find('select#drug_id').empty();
		            	
		            	$.each(data,function(key,val) {

		            		$trRow.find('select#drug_id').append('<option value="'+val.drug_id+'" data-unit="'+val.drug_unit+'">'+val.drug_name+'</option>');
						});
		            	$trRow.find('select#drug_id').trigger( "change" );
		            }
				});
				
			});
			
			$trRow.find("select#drug_id").on("change",function() {
				
				$trRow.find("#spanUnit").text($(this).find(':selected').data('unit'));
			});
			
			
			$("table > tbody#tbody_drug").append($trRow);
			
		});
		
		//tbody_treatment
		$(document).on("click","button#add_row_treatment",function() {
			
			var iii = $("table > tbody#tbody_drug > tr:last").data().value;
			var $trRow = $(' '
					+
					' <tr data-value="'
					+ (iii + 1)
					+ '"> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<select name="other_name[]" id="other_name" class="form-control"  required="required"></select> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<input type="hidden"  class="form-control" name="spanOtherPrice[]" value="1"  />'
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<span id="spanOtherUnit"></span> '
					+ ' 	</div> '
					+ ' </td> '
					+ ' <td> '
					+ ' 	<div class="form-group"> '
					+ ' 		<button type="button" id="del_row_treatment" class="btn btn-sm btn-danger">ลบ</button> '
					+ ' 	</div> '
					+ ' </td> ' + ' </tr> ');

			$trRow.find('.btn-danger').click(function(){
				$(this).parent().parent().parent().remove();
			});
			
			$.get("AjaxGetOtherServlet",function(responseText) {

				$.each(responseText,function(key,val) {
					$trRow.find('select#other_name').append('<option value="'+val.other_id+'" data-unit="'+val.other_unit+'" data-price="'+val.other_price+'">'+val.other_name+'</option>');
					
				});
				$trRow.find('select#other_name').trigger( "change" );
			});
			
			$trRow.find("select#other_name").on("change",function() {
				
				$trRow.find("#spanOtherPrice").text($(this).find(':selected').data('price'));
				$trRow.find("#spanOtherUnit").text($(this).find(':selected').data('unit'));
			});
			
			
			$("table > tbody#tbody_treatment").append($trRow);
		});
		
	});
</script>
</form>

<%@ include file="footer_index.jsp"%>
