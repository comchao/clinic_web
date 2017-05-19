<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
%>
<%@ include file="header_index.jsp"%>
<script>
	function getConfirm() {
		if (confirm("ห้ามย้อนกลับ หรือปิดโปรแกรมขณะทำการตรวจ")) {
			return true;
		}
		return false;
	}
	
</script>

<br>
<br>
<br>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="index-veterinary.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<br>
		<h3 align="center">คิวรอตรวจ</h3>	<br>
	<h4 align="center">คิวสัตว์ ที่รอตรวจรักษา</h4>
	
	<%
		// รับข้อมูลจาก Session ---> ArrayList
		ArrayList<PetsBean> petsList = (ArrayList) session.getAttribute("allPetWaitingSS");
		
		if (petsList != null) {
	%>
	
	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>ชื่อสัตว์เลี้ยง</th>
				<th>ประเภท</th>
				<th>สายพันธุ์</th>
				<th>ชื่อเจ้าของ</th>
				<th>หมายเหตุ</th>
				<th></th>
				<th></th>

			</tr>

			<%
					PetsBean petBean;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == petsList.size()) {
							break;
						}
						petBean = (PetsBean) petsList.get(i);
				%>

			<tr>
				<td><%=i+1%></td>
				<td><%=petBean.getPet_name()%></td>
				<td><%=petBean.getPet_category()%></td>
				<td><%=petBean.getPet_gene()%></td>
				<td><%="คุณ "+petBean.getReference_owner_id().getOwners_name() +"  "+petBean.getReference_owner_id().getOwners_lname() %></td>
				<td style="color: red;"><%=petBean.getEmerStatus()==1?"EMER":"-" %></td>
				<td>
					<form action="treatment.jsp" method="post">
					    <input type="hidden" name="No_Bil" value="<%=session.getAttribute("No_Bil_Treatment")%>"> 
						<input type="hidden" name="reference_owner_id" value="<%=request.getParameter("owner_id")%>"> 
						<input type="hidden" name="pet_name" value="<%=petBean.getPet_name()%>">
						<input type="hidden" name="pet_category" value="<%=petBean.getPet_category()%>"> 
						<input type="hidden" name="pet_gene" value="<%=petBean.getPet_gene()%>">
						<input type="hidden" name="pet_gender" value="<%=petBean.getPet_gender()%>"> 
						<input type="hidden" name="pet_weight" value="<%=petBean.getPet_weight()%>"> 
						<input type="hidden" name="pet_birthday" value="<%=petBean.getPet_birthday()%>"> 
						<input type="hidden" name="pet_age" value="<%=petBean.getPet_age()%>">
						<input type="hidden" name="pet_extra" value="<%=petBean.getPet_extra()%>"> 
						<input type="hidden" name="pet_id" value="<%=petBean.getId()%>"> 
						<input
							onclick="return getConfirm();" class="btn btn-success"
							type="submit" value="รับการตรวจ">
					</form>
				</td>
				<td><form action="pet_view_history_list.jsp" method="post">
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
						<button value="ประวัติการรักษา" name="treatment_data" class="btn btn-primary">
							ดูประวัติการรักษา
						</button>
					</form>
			</tr>
			<%
				}
			%>

		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pagePetWaitingServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (petsList.size() / 10) + 1;
						int c = petsList.size() % 10;
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
</div>
<%@ include file="footer_index.jsp"%>