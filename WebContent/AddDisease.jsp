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
<div align="left" style="position:fixed;bottom:80%;width:100px;margin:0px auto;">
	<a href="drugView.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
	
</div>
<br><br><br>
	<div class="row">
		<h3 align="center">เพิ่มข้อมูลโรค</h3>
		<br /><br />
		
		
		
		
		<form name="form1" id="form1" method="POST" action="InsertDiseaseServlet" style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">
					<div class="form-group">
					<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ชื่อโรค</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="disease" id="disease"
										placeholder="ชื่อโรค" class="form-control" required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>อาการของโรค</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="symptom[]" id="symptom"
										placeholder="อาการของโรค1" class="form-control" required="required" />
								</div>
							</div>
							</div>
							<div class="row">
							<div class="col-sm-3">
								<div>
									<p></p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="symptom[]" id="symptom"
										placeholder="อาการของโรค2" class="form-control" required="required" />
								</div>
							</div>
							</div>
								<div class="row">
							<div class="col-sm-3">
								<div>
									<p></p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="symptom[]" id="symptom"
										placeholder="อาการของโรค3" class="form-control" required="required" />
								</div>
							</div>
							</div>
								<div class="row">
							<div class="col-sm-3">
								<div>
									<p></p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="symptom[]" id="symptom"
										placeholder="อาการของโรค4" class="form-control" required="required" />
								</div>
							</div>
							</div>
								<div class="row">
							<div class="col-sm-3">
								<div>
									<p></p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="symptom[]" id="symptom"
										placeholder="อาการของโรค5" class="form-control" required="required" />
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
