<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.OwnersDAO,model.OwnersBean"%>
<%@page import="java.util.ArrayList"%>


<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>


<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<!-- <a href="index-veterinary.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a> -->
</div>
	<div class="row">
		<div align="center">
		<h3 align="center">ประวัติการรักษา</h3>	<br />
			<div class="col-sm-12">
			<div class="col-sm-3"></div>
		<div class="col-sm-6"><h4 align="center">ค้นหาข้อมูลเจ้าของ</h4>
			
			<form action="SearchHisTreOwnerServlet" method="post">
				<input name="owner_name" type="text" class="form-control" style="width:70%;"
					required="required" placeholder="ชื่อเจ้าของสัตว์เลี้ยง,หมายเลขบัตรประชาชน,เบอร์โทรศัพท์" /> <input type="hidden"
					name="searchType" value="searchOwners">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form></div>
		<!-- <div class="col-sm-6"><h4 align="center">ค้นหาข้อมูลสัตว์เลี้ยง</h4>
			
			<form action="" method="post">
				<input  name="pet_name" type="text" placeholder="ชื่อสัตว์เลี้ยง" class="form-control" style="width:70%;"/> 
				<input type="hidden" name="searchType" value="searchPets">&nbsp;&nbsp; 
				<input type="submit" class="btn btn-info" value="ค้นหา" />
			</form></div> -->
			<div class="col-sm-3"></div>
		</div>
			<br> 
		</div>

	</div>
	<br> <br>
	

	<%
		ArrayList<OwnersBean> ownerList = (ArrayList) session.getAttribute("allOwnerSS");
		if (ownerList != null) {
	%>

	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>หมายเลขบัตร ปชช.</th>
				<th>คำนำหน้า</th>
				<th>ชื่อ</th>
				<th>นามสกุล</th>
				<th>เพศ</th>
				<th>เบอร์โทร</th>
				<th></th>
			</tr>

			<%
					OwnersBean ownerBean;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == ownerList.size()) {
							break;
						}
						ownerBean = (OwnersBean) ownerList.get(i);
				%>
			<tr>
				<td><%=i+1%></td>
				<td><%=ownerBean.getOwners_idcard()%></td>
				<td><%=ownerBean.getPrefix()%></td>
				<td><%=ownerBean.getOwners_name()%></td>
				<td><%=ownerBean.getOwners_lname()%></td>
				<td><%=ownerBean.getOwners_gender()%></td>
				<td><%=ownerBean.getTelephon()%></td>
				<td><form action="pet_view_history.jsp" method="post">
						<input type="hidden" name="owner_id" value="<%=ownerBean.getId()%>">
						<input type="hidden" name="owner_name" value="<%=ownerBean.getOwners_name()%>">
						<input type="hidden" name="owner_lname" value="<%=ownerBean.getOwners_lname()%>">
						<input type="submit" class="btn btn-success"
						value="ดูสัตว์เลี้ยง">
				</form>
				</td>
			</tr>
			<%
				}
			%>

		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pageViewHistoryServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (ownerList.size() / 10) + 1;
						int c = ownerList.size() % 10;
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

<%@ include file="footer_index.jsp"%>