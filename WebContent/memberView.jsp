<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.MembersDAO,model.MembersBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>

<div class="container">
<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
<!-- 	<a href="index-veterinary.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a> -->
</div>
<div align="right">

				<a href="addMember.jsp"><input type="submit" class="btn btn-primary" value="เพิ่มข้อมูลพนักงาน-สัตวแพทย์" /></a>
				</div>
	<div class="row">
		<div align="center">
		<h3 align="center">ข้อมูลพนักงาน - สัตวแพทย์</h3><br />
			<h4 align="center">ค้นหาข้อมูลพนักงาน - สัตวแพทย์</h4>
			
			<form action="SearchMemberServlet" method="post">
				<input name="mem_name" type="text" class="form-control" style="width:30%;"
					placeholder="ชื่อ ,รหัสบัตรประชาชน ,เบอร์โทร" required="required"/> <input type="hidden"
					name="searchType" value="searchMembers">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
			<br> 

		</div>

	</div>
	<br> <br>
	<%
		
		ArrayList<MembersBean> memList = (ArrayList)session.getAttribute("allMemSS");
		
		if (memList != null) {
	%>
	
		<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th>ลำดับ</th>
					<th>Username</th>
					<th>คำนำหน้า</th>
					<th>ชื่อ</th>
					<th>สกุล</th>
					<th>เบอร์โทร</th>
					<th>ตำแหน่ง</th>
					<th></th>
					
				</tr>
				<%
				MembersBean memBean;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == memList.size()) {
							break;
						}
						memBean = (MembersBean) memList.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><%=memBean.getUsername()%></td>
					<td><%=memBean.getPrefix()%></td>
					<td><%=memBean.getMemName()%></td>
					<td><%=memBean.getMemLname()%></td>
					<td><%=memBean.getMemTelephone()%></td>
					<td><%=memBean.getMemPosition()%></td>
					
					<td>
						<form action="memberDetail.jsp" method="post">
							<input type="hidden" name="id" value="<%=memBean.getId()%>">
							<input type="hidden" name="username" value="<%=memBean.getUsername() %>">
							<input type="hidden" name="password" value="<%=memBean.getPassword() %>">
							<input type="hidden" name="prefix" value="<%=memBean.getPrefix() %>">
							<input type="hidden" name="mem_name" value="<%=memBean.getMemName() %>">
							<input type="hidden" name="mem_lname" value="<%=memBean.getMemLname() %>">
							<input type="hidden" name="mem_address" value="<%=memBean.getMemAdress() %>">
							<input type="hidden" name="mem_tel" value="<%=memBean.getMemTelephone() %>">
							<input type="hidden" name="mem_certificate" value="<%=memBean.getMemCertificate()%>">
							<input type="hidden" name="mem_birthday" value="<%=memBean.getMemBirthday() %>">
							<input type="hidden" name="mem_gender" value="<%=memBean.getMemGender() %>">
							<input type="hidden" name="mem_age" value="<%=memBean.getMemAge() %>">
							<input type="hidden" name="mem_position" value="<%=memBean.getMemPosition() %>">
							<input type="hidden" name="mem_img" value="<%=memBean.getMemImage() %>">
							<input type="hidden" name="type_code" value="<%=memBean.getTypeCode() %>">
							
							<input  class="btn btn-info" type="submit" value="รายละเอียด">
						</form>
					</td>
					
					
				</tr>
				<%
					}
				%>
				
			</table>
			<!-- ตัวแบ่งหน้า -->
			<form action="pageMemServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (memList.size() / 10) + 1;
						int c = memList.size() % 10;
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
		}
	%>

</div>
</div>
<%@ include file="footer_index.jsp"%>