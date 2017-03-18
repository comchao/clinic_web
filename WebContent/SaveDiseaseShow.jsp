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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
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
	
<%
		ArrayList<PetsBean> petList = (ArrayList) session.getAttribute("allPetSS");
		if (petList != null) {
	%>

	<div  class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>ชื่อสัตว์เลี้ยง</th>
				<th>ประเภท</th>
				<th>สายพันธุ์</th>
				<th>ชื่อเจ้าของ</th>
				<th>เบอร์โทรติดต่อ</th>
				<th></th>
				<th></th>
			</tr>
			<%
					PetsBean pb;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == petList.size()) {
							break;
						}
						pb = (PetsBean) petList.get(i);
				%>
			<tr>
				<td><%=i+1%></td>
				<td><%=pb.getPet_name() %></td>
				<td><%=pb.getPet_category() %></td>
				<td><%=pb.getPet_gene() %></td>
				<td><%=pb.getReference_owner_id().getOwners_name() %> <%=pb.getReference_owner_id().getOwners_lname() %></td>
				<td><%=pb.getReference_owner_id().getTelephon() %></td>
			
				<td> </td>
				<td>
				<form action="Save_DiseaseShow.jsp" method="post">
				
				         <input type="hidden" name="id_Pet" value="<%=pb.getReference_owner_id().getId()%>" >
						<input type="hidden" name="Pet_name" value="<%=pb.getPet_name() %>" >
						<input type="hidden" name="Pet_category" value="<%=pb.getPet_category() %>" >
						<input type="hidden" name="Pet_gene" value="<%=pb.getPet_gene() %>" >
						<input type="hidden" name="Pet_gender" value="<%=pb.getPet_gender()%>" >
						<input type="hidden" name="Pet_weight" value="<%=pb.getPet_weight()%>" >
						<input type="hidden" name="Pet_birthday" value="<%=pb.getPet_birthday()%>" >
						<input type="hidden" name="Pet_age" value="<%=pb.getPet_age()%>" >
						<input type="hidden" name="Pet_extra" value="<%=pb.getPet_extra()%>" >
						<input type="hidden" name="Reference_owner_id" value="<%=pb.getReference_owner_id()%>" >
						<input type="hidden" name="Owners_name" value="<%=pb.getReference_owner_id().getOwners_name()%>" >
						<input type="hidden" name="Owners_lname" value="<%=pb.getReference_owner_id().getOwners_lname() %>" >
						
					
						<input type="submit" class="btn btn-success"
						value="เลือก">
				</form>
				</td>
			
				
			</tr>
			<%
				}
			%>
		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pagePetSearchDepositServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (petList.size() / 10) + 1;
						int c = petList.size() % 10;
						if (c != 0) {
							for (a = 0; a < b; a++) {
					%>
					<button value="<%=a + 1%>" name="page" class="btn btn-info"><%=a + 1%></button>
					<%
						}
						} else {
							for (a = 1; a < b; a++) {
					%>
					<button value="<%=a%>" name="page" class="btn btn-info"><%=a%></button>
					<%
						}
						}
					%>
				</div>
			</form><br>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
	</div>
	<%
		
		if (petList.size() == 0) {
	%>
	<script>
		alert('ไม่พบข้อมูลสัตว์เลี้ยงที่ต้องการค้นหา กรุณาตรวจสอบข้อมูลอีกครั้ง !!');
	</script>
	<%
		}}
	%>
	
		<div class="container">
	<div class="row">
	

		<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
		
		
		
		
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
										placeholder="สัตว์เลี้ยง "  class="form-control"readonly="readonly" />
									
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

</div>

	</div>
</div>
</div>

	 
