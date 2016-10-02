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

	<br>
	<h3 align="center">สัตว์เลี้ยงของ คุณ <%=request.getParameter("owner_name") %>  จำนวน...ตัว</h3>
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
				<th></th>
				<th></th>
				<th></th>
				<th></th>
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
					<%
						if (petBean.getActive_flag().equals("Y")) {
									out.print("<font color='red'>อยู่ระหว่างดำเนินการ</font>");
								} else {
					%>
					<form action="UpdateTreatmentPet" method="post">
						<input type="hidden" name="reference_owner_id"
							value="<%=request.getParameter("owner_id")%>"> <input
							type="hidden" name="pet_id" value="<%=petBean.getId()%>">
						<input onclick="return sentConfirm();" class="btn btn-primary"
							type="submit" value="ส่งตรวจ">
					</form>
					
					<%
					
 	}
 %>

				</td>
				<td>
					<%
						if (petBean.getActive_flag().equals("N")) {
									out.print("<font color='red'></font>");
								} else {
					%>
					
					<form action="UpdateNoTreatment" method="post">
						<input type="hidden" name="reference_owner_id"
							value="<%=request.getParameter("owner_id")%>"> <input
							type="hidden" name="pet_id" value="<%=petBean.getId()%>">
						<input onclick="return checkConfirm();" class="btn btn-warning"
							type="submit" value="ยกเลิกการส่งตรวจ">
					</form>
					<%
					
 	}
 %>

				</td>
				<td><a target="_blank"
					href="addPetDeposit.jsp"> <input
						type="submit" class="btn btn-success" value="ฝากสัตว์เลี้ยง">
				</a></td>

				<td>
					<form
						action="edit-pet.jsp?owner_id=<%=request.getParameter("owner_id")%>"
						method="post">
						<input type="hidden" name="edit_pet_id"
							value="<%=petBean.getId()%>"> <input type="hidden"
							name="edit_pet_name" value="<%=petBean.getPet_name()%>">
						<input type="hidden" name="edit_pet_category"
							value="<%=petBean.getPet_category()%>"> <input
							type="hidden" name="edit_pet_gene"
							value="<%=petBean.getPet_gene()%>"> <input type="hidden"
							name="edit_pet_gender" value="<%=petBean.getPet_gender()%>">
						<input type="hidden" name="edit_pet_weight"
							value="<%=petBean.getPet_weight()%>"> <input
							type="hidden" name="edit_pet_birthday"
							value="<%=petBean.getPet_birthday()%>"> <input
							type="hidden" name="edit_pet_age"
							value="<%=petBean.getPet_age()%>"> <input type="hidden"
							name="edit_pet_extra" value="<%=petBean.getPet_extra()%>">
						<input type="submit" class="btn btn-warning" value="แก้ไข">
					</form>
				</td>
				<td>
					<form action="DelPetServlet" method="post">
						<input type="hidden" name="reference_owner_id"
							value="<%=request.getParameter("owner_id")%>"> <input
							type="hidden" name="del_id" value="<%=petBean.getId()%>">
						<input onclick="return delConfirm();" class="btn btn-danger"
							type="submit" value="ลบ">
					</form>
				</td>
				<td>
					<form action="petDetail.jsp" method="post">
						<input type="hidden" name="reference_owner_id"
							value="<%=request.getParameter("owner_id")%>"> <input
							type="hidden" name="del_id" value="<%=petBean.getId()%>">
						<input onclick="return delConfirm();" class="btn btn-info"
							type="submit" value="ลายละเอียดสัตว์เลี้ยง">
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
</div>
<%@ include file="footer_index.jsp"%>