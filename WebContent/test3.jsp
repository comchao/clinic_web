<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>

<br>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div class="row">
		<h3 align="center">การรักษา</h3>

		<br />
		<form name="form1" id="form1" method="POST"
			action="InsertTreatmentServlet"
			style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ชื่อสัตว์</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_name")%>"
										type="text" name="pet_name" id="pet_name" class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ประเภทสัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_category")%>"
										type="text" name="pet_category" id="pet_category"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>สายพันธ์สัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_gene")%>"
										type="text" name="pet_geng" id="pet_gene" class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>เพศ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_gender")%>"
										type="text" name="pet_gender" id="pet_gender"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>น้ำหนัก</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_weight")%>"
										type="text" name="pet_weight" id="pet_weight"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>วันเกิด</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_birthday")%>"
										type="text" name="pet_birthday" id="pet_birthday"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>อายุ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_age")%>" type="text"
										name="pet_age" id="pet_age" class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ตำหนิ/สี/อื่น ๆ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">

									<input value="<%=request.getParameter("pet_extra")%>"
										type="text" name="pet_extra" id="pet_extra"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="col-sm-6">
					<div class="form-group">

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>วันที่</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="postdate" id="dateInput1"
										placeholder="วันที่ทำการรักษา" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>สัตว์แพทย์ที่ทำการรักษา</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input
										value="<%=session.getAttribute("firstname")%> <%=session.getAttribute("lastname")%>"
										type="text" name="veterinary_name" id="veterinary_name"
										class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>


						

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>อาการ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<textarea name="cure_de" rows="5" class="form-control"
										placeholder="อาการ" required
										data-validation-required-message="Please enter a petgens."></textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>หมายเหตุ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<textarea name="cure_treament" rows="5" class="form-control"
										placeholder="หมายเหตุ" required
										data-validation-required-message="Please enter a petgens."></textarea>
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
							<table style="width: 100%">
								<tbody>
									<tr data-value="1">
										<td colspan="3">
											<div class="form-group">
												<button type="button" id="add_row_drug"
													class="btn btn-sm btn-primary">เพิ่มการจ่ายยา</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td width="50%">
							<table style="width: 100%">
								<tbody>
									<tr data-value="1">
										<td colspan="3">
											<div class="form-group">
												<button type="button" id="add_row_treatment"
													class="btn btn-sm btn-primary">อื่น ๆ</button>
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
						<input type="hidden" name="pet_id" value="<%=request.getParameter("pet_id")%>">
						<input type="submit" name="submit" id="submit"
							class="btn btn-success" value="บันทึกข้อมูล" onclick="cal(value)" />
					</div>
				</div>

			</div>

		</form>
	</div>
</div>
<script src="jquery-latest.min.js"></script>
<script>
	$(function() {
		
		$(document).on("click","button#add_row_drug",function() {
			$.get("DrugGetAllServlert",function(responseText) {

				var trRow = '';
				var iii = $("table > tbody#tbody_drug > tr:last").data().value;
				trRow = ' '
						+
						' <tr data-value="'
						+ (iii + 1)
						+ '"> '
						+ ' <td> '
						+ ' 	<div class="form-group"> '
						+ ' 		<select name="drug_id[]" id="drug_id" class="form-control" required> '
						+ ' 			<option value="">-- กรุณาเลือกการจ่ายยา --</option> '
						+ ' 		</select> '
						+ ' 	</div> '
						+ ' </td> '
						+ ' <td> '
						+ ' 	<div class="form-group"> '
						+ ' 		<input type="number"  class="form-control" name="drug_qty[]" value="1"/> '
						+ ' 	</div> '
						+ ' </td> '
						+ ' <td> '
						+ ' 	<div class="form-group"> '
						+ ' 		<button type="button" id="del_row_drug" class="btn btn-sm btn-danger">ลบ</button> '
						+ ' 	</div> '
						+ ' </td> ' + ' </tr> ';

				$("table > tbody#tbody_drug").append(trRow);

				$("button#del_row_drug").click(function() {
					$(this).parent().parent().parent().remove();
				});

				$.each(responseText,function(key,val) {

					$('select:last#drug_id').append($('<option>',{
												value : val.drug_id,
												text : val.drug_name
											}));
				});
			});
		});
		
		
		
		//tbody_treatment
		$(document).on("click","button#add_row_treatment",function() {
			$.get("DrugGetAllServlert",function(responseText) {

				var trRow = '';
				var iii = $("table > tbody#tbody_drug > tr:last").data().value;
				trRow = ' '
						+
						' <tr data-value="'
						+ (iii + 1)
						+ '"> '
						+ ' <td> '
						+ ' 	<div class="form-group"> '
						+ ' 		<input name="treatment[]" id="treatment" class="form-control" required> '
						+ ' 	</div> '
						+ ' </td> '
						+ ' <td> '
						+ ' 	<div class="form-group"> '
						+ ' 		<input type="number" class="form-control" name="treatment_price[]" value="0" required/> '
						+ ' 	</div> '
						+ ' </td> '
						+ ' <td> '
						+ ' 	<div class="form-group"> '
						+ ' 		<button type="button" id="del_row_treatment" class="btn btn-sm btn-danger">ลบ</button> '
						+ ' 	</div> '
						+ ' </td> ' + ' </tr> ';

				$("table > tbody#tbody_treatment").append(trRow);

				$("button#del_row_treatment").click(function() {
					$(this).parent().parent().parent().remove();
				});
			});
		});
		
	});
</script>

<%@ include file="footer_index.jsp"%>
