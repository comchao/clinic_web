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

		<h2>ข้อมูลการวิเคราะห์โรค</h2>
		<br>
		<table>
		<tr>
		<%
			
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				String[] Disease = request.getParameterValues("Disease");
				String[] SumPercentage = request.getParameterValues("SumPercentage");
				
				
		for(int i=0; i<Disease.length; i++){ 
		DecimalFormat df = new DecimalFormat();
				df.applyPattern("0.0");%>
				
				<%float SumPercentag = 0 ; 
				SumPercentag = Float.parseFloat(SumPercentage[i]);
				
				%>
		<h4><%=Disease[i]%>
		<%= new DecimalFormat("0.0").format(SumPercentag)%> %</h4>
		
		
		
		
		<%
			}
			
		%>
		</tr>
	</table>
	<div class="container">
	<div class="row">
	
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
		<h3 align="center">รายละเอียด ข้อมูลสัตว์เลี้ยง</h3>
		
			<%-- <% if(request.getParameter("page_ownerView")!=null){
		
				%> --%> <h3 align="center">สัตว์เลี้ยงของ คุณ : <%-- <%=new String(request.getParameter("owner_name").getBytes("ISO8859_1"), "UTF8") %> <%=new String(request.getParameter("owner_lname").getBytes("ISO8859_1"), "UTF8") %> --%></h3>
				<br />
		<%-- <%
			}
			if(request.getParameter("page_petSearch")!=null){
		%> --%>
				<%-- <h3 align="center">สัตว์เลี้ยงของ คุณ : <%=request.getParameter("owner_name")+" "+request.getParameter("owner_lname") %></h3>
				<br /> --%>
			<%-- <%
			}
		%>  --%>
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
										placeholder="ชื่อสัตว์เลี้ยง" class="form-control" required="required" />
									
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
				<%-- <form action="DelPetServlet" method="post">

					<input type="hidden" name="del_id"
						value="<%=request.getParameter("pet_id")%>"> <input
						type="submit" onclick="return delConfirm();"
						class="btn btn-danger" value="ลบข้อมูลสัตว์เลี้ยง">
				</form> --%>

			</div>
			
			<div style="display: block; float: right; padding: 5px 5px;">
<%-- 
				<form action="edit-pet.jsp" method="post">
					<input type="hidden" name="owner_name" value="<%=request.getParameter("owner_name")%>"> 
					<input type="hidden" name="owner_lname" value="<%=request.getParameter("owner_lname")%>"> 
					<input type="hidden" name="edit_id" value="<%=request.getParameter("pet_id")%>"> 
					<input type="hidden" name="pet_name" value="<%=request.getParameter("pet_name")%>"> 
					<input type="hidden" name="pet_category" value="<%=request.getParameter("pet_category")%>"> 
					<input type="hidden" name="pet_gene"	value="<%=request.getParameter("pet_gene")%>"> 
					<input type="hidden" name="pet_gender" value="<%=request.getParameter("pet_gender")%>"> 
					<input type="hidden" name="pet_weight" value="<%=request.getParameter("pet_weight")%>"> 
					<input type="hidden" name="pet_birthday"	value="<%=request.getParameter("pet_birthday")%>"> 
					<input type="hidden" name="pet_age" value="<%=request.getParameter("pet_age")%>"> 
					<input type="hidden" name="pet_extra"	value="<%=request.getParameter("pet_extra")%>">  --%>
					<!-- <input type="submit" class="btn btn-warning" onclick="return editConfirm();" value="แก้ไข"> -->
			<!-- 	</form> -->
					
			</div>
		</div>
		</div>
		</div>
<input type="submit" class="btn btn-success" value="ค้นหาข้อมูล" />
	</div>
</div>
</div>


<%@ include file="footer_index.jsp"%>
	
	
	
	
	
	
	
</body>
</html>




<%@ include file="footer_index.jsp"%>