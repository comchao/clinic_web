<%@page import="dao.TreatmentDao"%>
<%@page import="model.TreatmentBean"%>
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
	
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div class="row">
		<div align="center">
		<h3 align="center">ข้อมูลการรักษา</h3>	<br />
			<h4 align="center">ค้นประวัติการรักษา</h4>
			
			<form action="#" method="post">
				<input name="drug_name" type="text" class="search-query"
					placeholder="สัตว์เลี้ยง,เจ้าของ" /> <input type="hidden"
					name="searchType" value="searchOwners">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
		</div>

	</div>
	<br> <br>
	<%
	ArrayList<TreatmentBean> list = new ArrayList<TreatmentBean>();
	list = TreatmentDao.getAllPayment();
		
		if (list != null) {
	%>
	
		<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th>ลำดับ</th>
					<th>วันที่ทำการรักษา</th>
					<th>ชื่อสัตว์เลี้ยง</th>
					<th>เจ้าของ</th>
					<th>อาการ</th>
					<th>หมายเหตู</th>
					<th></th>
				</tr>

				<%
					int i = 0;
						for (TreatmentBean tmb : list) {
				%>
				<tr>
					<td><%=++i%></td>
					<td><%=tmb.getTreatment_date()%></td>
					<td><%=tmb.getRefer_pet_id().getPet_name()%></td>
					<td><%=tmb.getRefer_pet_id().getReference_owner_id().getOwners_name()%> <%=tmb.getRefer_pet_id().getReference_owner_id().getOwners_lname()%></td>
					<td><%=tmb.getTreatment_detail()%></td>
					<td><%=tmb.getNote()%></td>
					<td>
						<a target="_blank" href="bill_print.jsp?tm_id=<%=tmb.getId() %>%>" class="btn btn-warning">
							ดู
						</a>
					</td>
				</tr>
				<%
					}
				%>
				
			</table>s
		</div>
	
	<%
		}
	%>

</div>
</div>
<%@ include file="footer_index.jsp"%>