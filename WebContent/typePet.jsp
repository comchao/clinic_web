<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.PetsDAO,model.TypePetBean"%>
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
		<div class="col-sm-12"><h3 align="center">ข้อมูลเจ้าของสัตว์เลี้ยงและสัตว์เลี้ยง</h3></div>
		<div class="col-sm-12">
		<div class="col-sm-6"><h4 align="center">ค้นหาข้อมูลเจ้าของ</h4>
			
			<form action="SearchOwnerServlet" method="post">
				<input name="owner_name" type="text" class="search-query"
					placeholder="ชื่อ ,รหัสบัตรประชาชน ,เบอร์โทร" style="width:70%;"/> <input type="hidden"
					name="searchType" value="searchOwners">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="เพิ่มประเภท" />
			</form></div>
		
		</div>
			
			
		</div>

	</div>
	<br> <br>
	<%
		ArrayList<TypePetBean> petList = new ArrayList<TypePetBean>();
	petList = PetsDAO.querypetAll();
		
		if (petList != null) {
	%>
	
		<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th>ลำดับ</th>
					<th>ประเภท</th>
					<th></th>
					<th></th>
				</tr>

				<%
					int i = 0;
						for (TypePetBean petBean : petList) {
				%>
				<tr>
					<td><%=++i%></td>
					<td><%=petBean.getTypeName()%></td>
					
					<td>
					<form action="edit-drug.jsp?drug_id=<%=petBean.getId()%>" method="post">
					
					</form>
					</td>
					<td>
						<form action="DelDrugServlet" method="post">
							
							<input type="hidden" name="drug_id" value="<%=petBean.getId()%>">
							<input onclick="return delConfirm();" class="btn btn-danger" type="submit" value="ลบข้อมูลยา">
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