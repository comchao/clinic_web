<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.PetsDAO,model.DepositBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>
<div class="container">
<!-- <div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div> -->

	<div class="row">
		<div align="center">
		<div class="col-sm-12"><h3 align="center">สถานะการฝากเลี้ยง</h3></div>
		<div class="col-sm-12">
		<div class="col-sm-6"><h4 align="center">ค้นหาประวัติจากข้อมูลเจ้าของ</h4>
			<form action="SearchHistoryDepositServlet" method="post">
				<input name="owner_history" type="text" class="form-control" style="width:70%;"
					required="required"  placeholder="ชื่อเจ้าของสัตว์เลี้ยง,หมายเลขบัตรประชาชน,เบอร์โทรศัพท์" /> 
				<input type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
		</div>
		<div class="col-sm-6"><h4 align="center">ค้นหาประวัติจากชื่อสัตว์เลี้ยง</h4>
			
			<form action="SearchDepositHistorySearvlet" method="post">
				<input name="pet_name" required="required"  type="text" class="form-control"	placeholder="ชื่อสัตว์เลี้ยง" style="width:70%;"/> 
				<input type="hidden" name="searchType" value="searchPets">&nbsp;&nbsp; 
				<input type="submit" class="btn btn-info" value="ค้นหา" />
			</form></div>
		</div>
			
			
		</div>
	</div>
	<br> <br>
	<%
		ArrayList<DepositBean> depositList = (ArrayList) session.getAttribute("allDepositSS");
		if (depositList != null) {
	%>

	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>เลขบัตรประชาชน</th>
				<th>เจ้าของสัตว์เลี้ยง</th>
				<th>ชื่อสัตว์เลี้ยง</th>
				<th>ประเภท</th>
				<th>วันที่รับฝาก</th>
				<th>ถึงวันที่</th>
				<th>ชื่อกรง</th>
				<th>โทรศัพท์</th>
				<th></th>
			</tr>
				<%
				DepositBean depositBean;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == depositList.size()) {
							break;
						}
						depositBean = (DepositBean) depositList.get(i);
				%>
				<tr>
				<td><%=i+1%></td>
				<td><%=depositBean.getRefer_owner_id().getOwners_idcard()%></td>
				<td><%=depositBean.getRefer_owner_id().getOwners_name()+" "+depositBean.getRefer_owner_id().getOwners_lname() %></td>
				<td><%=depositBean.getRefer_pet_id().getPet_name() %></td>
				<td><%=depositBean.getRefer_pet_id().getPet_category() %></td>
				<td><%=depositBean.getDeposit_in()%></td>
				<td><%=depositBean.getDeposit_out()%></td>
				<td><%=depositBean.getRefer_cage_id().getCage_name()%></td>
				<td><%=depositBean.getRefer_owner_id().getTelephon()%></td>
				<td>
				<form action="ShowShopDetailServlet">
				<input type="hidden" name="cage_id" value="<%=depositBean.getRefer_cage_id().getId()%>">
				<input type="hidden" name="deposit_id" value="<%=depositBean.getId()%>">
					<input type="submit" class="btn btn-success"  value="รายละเอียดการฝากเลี้ยง">
				</form></td>
			</tr>
			<%
				}
			%>
		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pageDepositHistoryServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (depositList.size() / 10) + 1;
						int c = depositList.size() % 10;
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
		if (depositList.size() == 0) {
	%>
	<script>
		alert('ไม่พบข้อมูลที่ต้องการค้นหา /รายชื่อนี้ไม่ได้ทำการฝากเลี้ยง');
	</script>
	<%
		}
	%>

</div>

<%@ include file="footer_index.jsp"%>