<%@page import="dao.TreatmentDao"%>
<%@page import="model.TreatmentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.DrugDAO,model.DrugBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br><br>
<br>

<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<!-- <a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a> -->
</div>
	<div class="row">
		<div align="center">
		<h3>คิวการชำระเงินค่ารักษาและค่ายา</h3>	<br />
		</div>
	</div>
	<%
		// รับข้อมูลจาก Session ---> ArrayList
		ArrayList<TreatmentBean> list = (ArrayList) session.getAttribute("allPaymentSS");
		if (list != null) {
	%>
		<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th>ลำดับ</th>
					<th>หมายเลขบิล</th>
					<th>วันที่ทำการรักษา</th>
					<th>ชื่อเจ้าของ</th>
					<th>ชื่อสัตว์เลี้ยง</th>
					<th></th>
				</tr>
				<%
				TreatmentBean tmb;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == list.size()) {
							break;
						}
						tmb = (TreatmentBean) list.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><%=tmb.getNo_Bil()%></td>
					<td><%=tmb.getTreatment_date() %></td>
					<td><%=tmb.getRefer_pet_id().getReference_owner_id().getOwners_name()%> <%=tmb.getRefer_pet_id().getReference_owner_id().getOwners_lname()%></td>
					<td><%=tmb.getRefer_pet_id().getPet_name()%></td>
					<td class="text-right">
					<form action="PaymentBilServlet" method="post">
					<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); %>
						 <input type="hidden" name="datenow" value="<%= df.format(new java.util.Date()) %>" >
					<input type="hidden" name="name" value="<%=tmb.getRefer_pet_id().getReference_owner_id().getOwners_name()%> <%=tmb.getRefer_pet_id().getReference_owner_id().getOwners_lname()%>" />
							<input type="hidden" name="id" value="<%= tmb.getId()%>" />
							<input type="hidden" value="4" name="report_id" />
							<input type="submit" class="btn btn-info" value="ชำระเงินค่ารักษา" />
					</form>
					</td>
				</tr>
				<%
					}
				%>
				
			</table>
			<!-- ตัวแบ่งหน้า -->
			<form action="pagePaymentViewServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (list.size() / 10) + 1;
						int c = list.size() % 10;
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
				</div><br>
				<!-- สิ้นสุดตัวแบ่งหน้า -->
		</div>
	
	<%
		}
	%>

</div>
<%@ include file="footer_index.jsp"%>