<%@page import="com.oreilly.servlet.multipart.LimitedServletInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="dao.DiseaseDAO"%>
<%@page import="model.AnalysisBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.OwnersDAO,model.OwnersBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@ include file="header_index.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<center>

		<h2>บันทึกข้อมูลการวิเคราะห์โรค</h2>
		<br>
		<table>
		<tr>
		
	
		</tr>
	</table>
	<div class="container">
	<div class="row">
	


	 
	 <form action="SaveDiseaseSearchServlet" method="post">
	 	<%
	 	
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String[] Disease = request.getParameterValues("Disease");
		String[] SumPercentage = request.getParameterValues("SumPercentage");
		String[] percentage = request.getParameterValues("percentage");

			request.setCharacterEncoding("UTF-8");
		
			
	     for(int i1=0; i1<Disease.length; i1++){ 
	     DecimalFormat df = new DecimalFormat();
			df.applyPattern("0.0");%>
			
			<%float SumPercentag = 0 ; 
			SumPercentag = Float.parseFloat(SumPercentage[i1]);
			
		

%>
	 	
	 	

		<input type="hidden" name="Disease" value="<%=Disease[i1]%>"> 
		<input type="hidden" name="SumPercentage" value="<%= new DecimalFormat("0.0").format(SumPercentag)%>">
		<input type="hidden" name="percentage" value="<%=percentage[i1]%>">
		<h4><%=Disease[i1]%> : <%=new DecimalFormat("0.0").format(SumPercentag)%></h4>
		
		
				<%
			}
			
		%>
			
		
		
		<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
		<h3 align="center"></h3>
		
		
		
		
		
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ชื่อสัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_name" id="disease"
										placeholder="กรุณากรอกชื่อสัตว์เลี้ยง" class="form-control" required="required" />
									
								</div>
							</div>
						</div>
					
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ประเภท</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_category" id="pet_category"
									value="<%-- <%=request.getParameter("pet_category")%> --%>"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>พันธุ์</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gene" id="pet_gene"
										placeholder="พันธุ์สัตว์เลี้ยง" class="form-control"
										value="<%-- <%=request.getParameter("pet_gene")%> --%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>เพศ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text"  name="pet_gender" id="pet_gender" 
									placeholder="เพศสัตว์เลี้ยง" value="<%-- <%=request.getParameter("pet_gender")%> --%>" class="form-control"
										readonly="readonly">
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
									<p>น้ำหนัก/kg.</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_weight" id="pet_weight"
									value="<%-- <%=request.getParameter("pet_weight")%> --%>"
										placeholder="น้ำหนัก" class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>วันเกิด</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_birthday" id="pet_birthday"
									value="<%-- <%=request.getParameter("pet_birthday")%> --%>"
										placeholder="วันเกิด " class="form-control"
										readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>อายุ/ปี</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_age" id="pet_age"
									value="<%-- <%=request.getParameter("pet_age")%> --%>"
										placeholder="อายุ" class="form-control" readonly="readonly" />

								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ตำหนิ/สี</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<textarea name="pet_extra" rows="5" class="form-control"
										placeholder="ตำหนิ/สี" id="pet_extra" readonly="readonly"><%-- <%=request.getParameter("pet_extra")%> --%></textarea>
								</div>
							</div>
						</div>
						<div>
						
						<div style="display: block; float: right; padding: 5px 5px;">
			
			</div>
			
			<div style="display: block; float: right; padding: 5px 5px;">

			</div>
		</div>
		</div>
		</div>
<input type="submit" class="btn btn-success" value="ค้นหาข้อมูล" />
</div></form>

	</div>
</div>
</div>

	 
	 
 
	
	
	
	
	
	



	
	
	
	
	
	
	
</body>
</html>




<%@ include file="footer_index.jsp"%>