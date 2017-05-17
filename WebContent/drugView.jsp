<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.DrugDAO,model.DrugBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<script>
	function delConfirm() {
		if (confirm("คุณต้องการที่จะลบข้อมูลยาใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
	function editConfirm() {
		if (confirm("คุณต้องการที่จะแก้ไขข้อมูลยาใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
</script>
<br><br><br><br>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
<div align="right">
	<a href="addDrug.jsp"><input type="submit"
				class="btn btn-primary" value="เพิ่มข้อมูลยา" /></a>
</div>
	<div class="row">
		<div align="center">
		<h3 align="center">ข้อมูลยา</h3>	<br />
			<h4 align="center">ค้นหายา</h4>
			<form action="searchDrugServlet" method="post">
				<input name="drug_name" type="text" class="form-control" 
					placeholder="ชื่อยา,รหัสยา" style="width:20%;" /> <input type="hidden"
					name="searchType" >&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
		</div>
	</div>
	<br> <br>
	<%
		// รับข้อมูลจาก Session ---> ArrayList
		ArrayList<DrugBean> drugList = (ArrayList) session.getAttribute("allDrugSS");
		if (drugList != null) {
	%>
	<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th>ลำดับ</th>
					<th>รหัสยา</th>
					<th>ชื่อยา</th>
					<th>รายละเอียด/สรรพคุณ</th>
					<th>ราคา</th>
					<th>ชนิดยา</th>
					<th></th>
					<th></th>
				</tr>
				<%
				DrugBean db;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == drugList.size()) {
							break;
						}
						db = (DrugBean) drugList.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><%=db.getDrug_code()%></td>
					<td><%=db.getDrug_name()%></td>
					<td><%=db.getDrug_detail()%></td>
					<td><%=db.getDrug_price()%></td>
					<td><%=db.getDrug_unit()%></td>
					<td>
					<form action="edit-drug.jsp?drug_id=<%=db.getId()%>" method="post">
						<input type="hidden" name="edit_drug_id" value="<%=db.getId()%>">
						<input type="hidden" name="edit_drug_type" value="<%=db.getDrug_type()%>">
						<input type="hidden" name="edit_drug_name" value="<%=db.getDrug_name()%>">
						<input type="hidden" name="edit_drug_detail" value="<%=db.getDrug_detail()%>">
						<input type="hidden" name="edit_drug_price" value="<%=db.getDrug_price()%>">
						<input type="hidden" name="edit_drug_unit" value="<%=db.getDrug_unit()%>">
						<input type="submit" onclick="return editConfirm();"class="btn btn-warning" value="แก้ไข">
					</form>
					</td>
					<td>
						<form action="DelDrugServlet" method="post">
							
							<input type="hidden" name="drug_id" value="<%=db.getId()%>">
							<input onclick="return delConfirm();" class="btn btn-danger" type="submit" value="ลบข้อมูลยา">
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<!-- ตัวแบ่งหน้า -->
			<form action="pageDrugServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (drugList.size() / 10) + 1;
						int c = drugList.size() % 10;
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
				<!-- สิ้นสุดตัวแบ่งหน้า -->
			</form><br>
		</div>
	<%
		}
	%>
</div>
<%@ include file="footer_index.jsp"%>