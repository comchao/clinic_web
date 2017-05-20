<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>

<% request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
%>

<%@ include file="header_index.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<br>
<br>
<br>
<br>

<script>
	function delConfirm() {
		if (confirm("คุณต้องการที่จะลบข้อมูลสัตว์เลี้ยงใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
	function sentConfirm() {
		if (confirm("คุณต้องการที่จะส่งข้อมูลสัตว์เลี้ยงไปทำการรักษาใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
	function checkConfirm() {
		if (confirm("คุณต้องการที่จะยกเลิกการส่งข้อมูลสัตว์เลี้ยงที่ส่งไปใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
</script>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<!-- <a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a> -->
</div>
	<br>
	<h3 align="center">สัตว์เลี้ยงของ คุณ <%=request.getParameter("owner_name")+"  "+request.getParameter("owner_lname") %></h3>
	<br>

	<%
		int owner_id = Integer.parseInt(request.getParameter("owner_id"));
		ArrayList<PetsBean> petsList = new ArrayList<PetsBean>();
		petsList = PetsDAO.queryPetsByName(owner_id);

		if (petsList != null) {
	%>

	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>ชื่อสัตว์เลี้ยง</th>
				<th>ประเภท</th>
				<th>สายพันธุ์</th>
				<th>เพศ</th>
				<th>น้ำหนัก</th>
				<th>วันเกิด</th>
				<th>อายุ</th>
				<th>สี/ตำหนิ</th>
				<th></th>
			</tr>

			<%
				int i = 0;
					for (PetsBean petBean : petsList) {
			%>
			<tr>
				<td><%=++i%></td>
				<td><%=petBean.getPet_name()%></td>
				<td><%=petBean.getPet_category()%></td>
				<td><%=petBean.getPet_gene()%></td>
				<td><%=petBean.getPet_gender()%></td>
				<td><%=petBean.getPet_weight()%></td>
				<td><%=petBean.getPet_birthday()%></td>
				<td><%=petBean.getPet_age()%></td>
				<td><%=petBean.getPet_extra()%></td>
				<td>
					<form action="pet_view_history_list.jsp" method="post">
						<input type="hidden" name="owner_name" value="<%=request.getParameter("owner_name") %> <%=request.getParameter("owner_lname") %>">
						<input type="hidden" name="pet_id" value="<%=petBean.getId() %>">
						<input type="hidden" name="pet_name" value="<%=petBean.getPet_name() %>">
						<input type="hidden" name="category" value="<%=petBean.getPet_category() %>">
						<input type="hidden" name="gene" value="<%=petBean.getPet_gene() %>">
						<input type="hidden" name="gender" value="<%=petBean.getPet_gender() %>">
						<input type="hidden" name="weight" value="<%=petBean.getPet_weight() %>">
						<input type="hidden" name="birthday" value="<%=petBean.getPet_birthday() %>">
						<input type="hidden" name="age" value="<%=petBean.getPet_age() %>">
						<input type="hidden" name="extra" value="<%=petBean.getPet_extra() %>">
						<button class="btn btn-success">
							ดูประวัติการรักษา
						</button>
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