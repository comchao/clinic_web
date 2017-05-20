<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>

<% request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
%>
<%@ include file="header_index.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<br><br><br><br>
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
<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
	<!-- <a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a> -->
</div>
<div align="right">
	<form action="addPets.jsp" method="post">
			<input type="hidden" name="owner_id" value="<%=request.getParameter("owner_id")%>">
			<input type="hidden" name="owner_name" value="<%=request.getParameter("owner_name")%>">
			<input type="hidden" name="owner_lname" value="<%=request.getParameter("owner_lname")%>">
			<input type="submit" class="btn btn-info"
			value="เพิ่มสัตว์เลี้ยง">
	</form>
</div>
	<%
		ArrayList<PetsBean> petList = (ArrayList) session.getAttribute("allPetSS");
		if (petList != null) {
	%>
	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>ชื่อสัตว์เลี้ยง</th>
				<th>ประเภท</th>
				<th>สายพันธุ์</th>
				<th>เพศ</th>
				<th>สี/ตำหนิ</th>
				<th>สถานะการตรวจ</th>
				<th></th>
				<th></th>
			</tr>
			<%
					PetsBean petBean;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);
					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == petList.size()) {
							break;
						}
						petBean = (PetsBean) petList.get(i);
						System.out.println(petBean);
			%>
			<tr>
			<% if(i == 0){
				%>
				<h3 align="center">สัตว์เลี้ยงของคุณ <%=petBean.getReference_owner_id().getOwners_name() %> <%=petBean.getReference_owner_id().getOwners_lname() %></h3>
				<br><br>
			<% }%>
				<td><%=i+1%></td>
				<td><%=petBean.getPet_name()%></td>
				<td><%=petBean.getPet_category()%></td>
				<td><%=petBean.getPet_gene()%></td>
				<td><%=petBean.getPet_gender()%></td>
				<td><%=petBean.getPet_extra()%></td>
				
				<td>
					<%
						if (petBean.getActive_flag().equals("Y")) {
									out.print("<font color='red'>อยู่ระหว่างดำเนินการ</font>");
								} else {
					%>
					<form action="UpdateTreatmentPet" method="post">
					<input type="checkbox" name="emer_status" value="1">
					&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="owner_id" value="<%=request.getParameter("owner_id")%>"> 
						<input type="hidden" name="owner_name" value="<%=request.getParameter("owner_name")%>"> 
						<input type="hidden" name="owner_lname"	value="<%=request.getParameter("owner_lname")%>"> 
						<input type="hidden" name="page_ownerView" value="<%=request.getParameter("page_ownerView")%>">
						<input type="hidden" name="pet_id" value="<%=petBean.getId()%>">
						<input class="btn btn-primary" type="submit" value="ส่งตรวจ">
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
						<input type="hidden" name="owner_id" value="<%=request.getParameter("owner_id")%>">
						<input type="hidden" name="owner_name" value="<%=request.getParameter("owner_name")%>"> 
						<input type="hidden" name="owner_lname"	value="<%=request.getParameter("owner_lname")%>">  
						<input type="hidden" name="page_ownerView" value="<%=request.getParameter("page_ownerView")%>">
						<input type="hidden" name="pet_id" value="<%=petBean.getId()%>">
						<input type="hidden" name="Status" value="1">
						<input onclick="return checkConfirm();" class="btn btn-warning"	type="submit" value="ยกเลิกการตรวจ">
					</form>
					<%
 	}
 %>

				</td>
				<td>
				<form action="petDetail.jsp" method="post">
						<input type="hidden" name="page_ownerView"	value="<%=request.getParameter("page_ownerView")%>">
						<input type="hidden" name="reference_owner_id"	value="<%=request.getParameter("owner_id")%>">
						<input type="hidden" name="owner_name"	value="<%=request.getParameter("owner_name")%>"> 
						<input type="hidden" name="owner_lname"	value="<%=request.getParameter("owner_lname")%>">  
						<input type="hidden" name="owner_id"value="<%=request.getParameter("owner_id")%>">
						<input type="hidden" name="pet_id"	value="<%=petBean.getId()%>"> 
						<input type="hidden"name="pet_name" value="<%=petBean.getPet_name()%>">
						<input type="hidden" name="pet_category"value="<%=petBean.getPet_category()%>"> 
						<input	type="hidden" name="pet_gene"	value="<%=petBean.getPet_gene()%>"> 
						<input type="hidden" name="pet_gender" value="<%=petBean.getPet_gender()%>">
						<input type="hidden" name="pet_weight"	value="<%=petBean.getPet_weight()%>"> 
						<input	type="hidden" name="pet_birthday"	value="<%=petBean.getPet_birthday()%>"> 
						<input	type="hidden" name="pet_age"value="<%=petBean.getPet_age()%>"> 
						<input type="hidden" name="pet_extra" value="<%=petBean.getPet_extra()%>">
						<input  class="btn btn-info"	type="submit" value="รายละเอียดสัตว์เลี้ยง">
					</form>
				</td>
			</tr>
			<%
				}
			%>

		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pagePetViewServlet">
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
				
			</form>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
	</div>
	<%
		}
	%>
</div>
<%@ include file="footer_index.jsp"%>