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
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.AnalysisBean"%>
<%@page import="java.util.List"%>

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
		
	
		</tr>
	</table>
	<div class="container">
	<div class="row">
	

<table align="center">
<tr>
<th width="100:px">ลำดับ</th>
<th width="150:px">โรค</th>
<th width="130:px">ให้ผลบวกโรค</th>
<th width="200:px">ร้อยละของผลบวก(%)</th>
</tr>
	
	 <form action="ReportServlet" method="post">
	 
	<%
	DiseaseDAO dao = new DiseaseDAO (); 
List<AnalysisBean >List=dao.getdisease_percentage();
for(int i = 0;i<List.size();i++){
	AnalysisBean bean = List.get(i); 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String id_Pet = request.getParameter("id_Pet");
	
%>

<tr> 

 <td><h4><%=i+1%></h4></td>
 <td><h4><%=bean.getDisease()%></h4></td>
 <td><h4> <%=bean.getSum()%></h4></td>
 <td><h4><%=bean.getSumPercentage()%></h4></td>
 	<input type="hidden" name="Disease[]"  value="<%=bean.getDisease()%>" />
 	<input type="hidden" name="Sum[]"  value="<%=bean.getSum()%>" />
 	<input type="hidden" name="SumPercentage"  value="<%=bean.getSumPercentage()%>" />
 	<input type="hidden" name="id_member[]"  value="<%=session.getAttribute("id")%>" />
 	<input type="hidden" name="report_id"  value="7" />
 	<input type="hidden" name="id_pet[]"  value="<%=id_Pet%>" />
 	
    
  </tr>
 <%} %>
	</table>
	 	<%
	 	
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String Pet_name = request.getParameter("Pet_name");
		String Pet_category = request.getParameter("Pet_category");
		String Pet_gender = request.getParameter("Pet_gender"); 
		String Pet_gene = request.getParameter("Pet_gene");
		String Pet_weight = request.getParameter("Pet_weight");
		String Pet_birthday = request.getParameter("Pet_birthday");
		String Pet_age = request.getParameter("Pet_age");
		String Pet_extra = request.getParameter("Pet_extra");
		String Reference_owner_id = request.getParameter("Reference_owner_id");
		String Owners_name = request.getParameter("Owners_name");
		String Owners_lname = request.getParameter("Owners_lname");
	
	
%>
	 	
	
		<h3 align="center"></h3>
		
		 <h3 align="center">สัตว์เลี้ยงของ คุณ : <font color="red"><%=Owners_name%><%=Owners_lname %></font></h3>
	
	

									
		
		
		
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
										value="<%=Pet_name%>" class="form-control"	readonly="readonly" />
									
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
									value="<%=Pet_category%>"
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
										value="<%=Pet_gene%>"
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
									placeholder="เพศสัตว์เลี้ยง" value="<%=Pet_gender%>" class="form-control"
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
									value="<%=Pet_weight%>"
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
									value="<%=Pet_birthday%>"
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
									value="<%=Pet_age%>"
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
									<input name="pet_extra" rows="5" class="form-control"
										placeholder="ตำหนิ/สี" id="pet_extra" readonly="readonly" value="<%=Pet_extra%>">
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
<input type="submit" class="btn btn-success" value="บันทึกข้อมูล" />
</div></form>

	</div>
</div>
</div>

	 
	 
 
	
	
	
	
	
	



	
	
	
	
	
	
	
</body>
</html>




<%@ include file="footer_index.jsp"%>