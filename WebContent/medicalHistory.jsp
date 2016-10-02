<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.OwnersDAO,model.OwnersBean"%>
<%@page import="java.util.ArrayList"%>


<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>

<div class="container">
	<div class="row">
		<div align="center">
		<h3 align="center">ประวัติการรักษา</h3>	<br />
			<h4 align="center">ค้นหาข้อมูลการรักษา</h4>
			
			<form action="OwnerSearchServlet" method="post">
				<input name="owner_history" type="text" class="search-query"
					placeholder="ชื่อ ,รหัสบัตรประชาชน ,เบอร์โทร" /> 
					<input name="ss" type="hidden" value="history" />
					<input type="hidden"
					name="searchType" value="searchOwners">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
			
		</div>

	</div>
	<br> <br>
	

	<%
		ArrayList<OwnersBean> ownerList = (ArrayList<OwnersBean>) request.getAttribute("ownerList");
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
				<th></th>
				<th></th>

			</tr>

			<%
				int i = 0;
					for (OwnersBean ownerBean : ownerList) {
			%>
			<tr>
				<td><%=++i%></td>
				<td><%=ownerBean.getOwners_idcard()%></td>
				<td><%=ownerBean.getPrefix()%></td>
				<td><%=ownerBean.getOwners_name()%></td>
				<td><%=ownerBean.getOwners_lname()%></td>
				<td><%=ownerBean.getOwners_gender()%></td>
				<td><%=ownerBean.getTelephon()%></td>
				<td>
				<form action="addPets.jsp" method="post">
						<input type="hidden" name="owner_id" value="<%=ownerBean.getId()%>">
						<input type="hidden" name="owner_name" value="<%=ownerBean.getOwners_name()%>">
						<input type="hidden" name="owner_lname" value="<%=ownerBean.getOwners_lname()%>">
						<input type="submit" class="btn btn-primary"
						value="เพิ่มสัตว์เลี้ยง">
				</form>
			</td>
				<td><form action="pet_view.jsp" method="post">
						<input type="hidden" name="owner_id" value="<%=ownerBean.getId()%>">
						<input type="hidden" name="owner_name" value="<%=ownerBean.getOwners_name()%>">
						<input type="hidden" name="owner_lname" value="<%=ownerBean.getOwners_lname()%>">
						<input type="submit" class="btn btn-success"
						value="ดูสัตว์เลี้ยง">
				</form></td>
				<td>
					<form action="ownerDetail.jsp" method="post">
					<input type="hidden" name="id" value="<%=ownerBean.getId()%>">
						<input type="hidden" name="owners_idcard"
							value="<%=ownerBean.getOwners_idcard()%>"> <input
							type="hidden" name="prefix"
							value="<%=ownerBean.getPrefix()%>"> <input type="hidden"
							name="owners_name" value="<%=ownerBean.getOwners_name()%>">
						<input type="hidden" name="owners_lname"
							value="<%=ownerBean.getOwners_lname()%>"> <input
							type="hidden" name="owners_gender"
							value="<%=ownerBean.getOwners_gender()%>"> <input
							type="hidden" name="address"
							value="<%=ownerBean.getAddress()%>"> <input type="hidden"
							name="telephon" value="<%=ownerBean.getTelephon()%>">
						<input type="hidden" name="owners_birthday"
							value="<%=ownerBean.getOwners_birthday()%>">
						
						<input  class="btn btn-info"
							type="submit" value="รายละเอียด">
					</form>
				</td>
			</tr>
			<%
				}
			%>

		</table>
	</div>

	<%
		}
	%>

</div>

<%@ include file="footer_index.jsp"%>