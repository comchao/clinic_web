<%@page import="dao.TypeDrugDAO"%>
<%@page import="model.TypeDrug"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>

<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="drugView.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<div class="row">
		<h3 align="center">เพิ่มข้อมูลยา</h3>
		<br /><br />
		<form name="form1" id="form1" method="POST"
			action="InsertDrugServlet" style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">
					<div class="form-group">
					<div class="row">
							<div class="col-sm-3">
								<div>
									<p>รหัสยา</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="drug_code" id="drug_code"
										placeholder="รหัสยา" class="form-control" required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ชื่อยา</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="drug_name" id="drug_name"
										placeholder="ชื่อยา" class="form-control" required="required" />
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ประเภท</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
								<select name="drug_type" id="drug_type" class="form-control"
										required="required">
								<%
								ArrayList<TypeDrug> list = TypeDrugDAO.queryTypeDrugAll();
								for (TypeDrug typeDrug : list) {
									
								%>
										<option value="<%=typeDrug.getId()%>"><%=typeDrug.getTypeName()%></option>
								<%
								}
								%>
								</select>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>รายละเอียด/สรรพคุณ</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<textarea name="drug_detail" rows="5" class="form-control"
										placeholder="รายละเอียด/สรรพคุณ" required
										data-validation-required-message="Please enter a petgens."></textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ราคา/ต่อหน่วย</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="drug_price" id="drug_price"
										placeholder="ราคา/ต่อหน่วย" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ชนิดยา/ประเภท</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									
										<select name="drug_unit" id="drug_unit" class="form-control"
										required="required">
										<option value="ขวด">ขวด</option>
										<option value="เม็ด">เม็ด</option>
										<option value="เข็ม">เข็ม</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group" style="text-align: right">
						<input type="submit" name="submit" id="submit"
							class="btn btn-success" value="บันทึกข้อมูล" onclick="cal(value)" />  <br> <br> <br>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="footer_index.jsp"%>
