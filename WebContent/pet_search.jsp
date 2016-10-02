<%@page import="model.OwnersBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>
<div class="container">

<div align="left" style="position:fixed;bottom:80%;width:500px;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
<div align="right">
	<a href="addOwner.jsp"><input type="submit" class="btn btn-info" value="เพิ่มข้อมูลเจ้าของสัตว์เลี้ยง" /></a>
</div>


	<div class="row">
		<div align="center">
		<div class="col-sm-12"><h3 align="center">ข้อมูลเจ้าของสัตว์เลี้ยงและสัตว์เลี้ยง</h3></div>
		<div class="col-sm-12">
		<div class="col-sm-6"><h4 align="center">ค้นหาข้อมูลเจ้าของ</h4>
			
			<form action="SearchOwnerServlet" method="post">
				<input name="owner_name" type="text" class="search-query"
					placeholder="ชื่อเจ้าของสัตว์เลี้ยง,หมายเลขบัตรประชาชน,เบอร์โทรศัพท์" style="width:70%;"/> <input type="hidden"
					name="searchType" value="searchOwners">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form></div>
		<div class="col-sm-6"><h4 align="center">ค้นหาข้อมูลสัตว์เลี้ยง</h4>
			
			<form action="SearchPetServlet" method="post">
				<input  name="pet_name" type="text" class="search-query"	placeholder="ชื่อสัตว์เลี้ยง" style="width:70%;"/> 
				<input type="hidden" name="searchType" value="searchPets">&nbsp;&nbsp; 
				<input type="submit" class="btn btn-info" value="ค้นหา" />
			</form></div>
		</div>
			
			
		</div>
	</div>
	<br> <br>
	<%
		ArrayList<PetsBean> petList = (ArrayList) session.getAttribute("allPetSS");
		if (petList != null) {
	%>

	<div  class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>ชื่อสัตว์เลี้ยง</th>
				<th>ประเภท</th>
				<th>สายพันธุ์</th>
				<th>ชื่อเจ้าของ</th>
				<th>เบอร์โทรติดต่อ</th>
				<th></th>
				<th></th>
			</tr>
			<%
					PetsBean pb;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == petList.size()) {
							break;
						}
						pb = (PetsBean) petList.get(i);
				%>
			<tr>
				<td><%=i+1%></td>
				<td><%=pb.getPet_name() %></td>
				<td><%=pb.getPet_category() %></td>
				<td><%=pb.getPet_gene() %></td>
				<td><%=pb.getReference_owner_id().getOwners_name() %> <%=pb.getReference_owner_id().getOwners_lname() %></td>
				<td><%=pb.getReference_owner_id().getTelephon() %></td>
				<td>
					<form action="ownerDetail.jsp" method="post">
					<input type="hidden" name="owner_id" value="<%=pb.getReference_owner_id().getId()%>">
					<input type="hidden" name="owners_idcard" value="<%=pb.getReference_owner_id().getOwners_idcard()%>"> 
					<input type="hidden" name="prefix"	value="<%=pb.getReference_owner_id().getPrefix()%>"> 
					<input type="hidden" name="owners_name" value="<%=pb.getReference_owner_id().getOwners_name()%>">
					<input type="hidden" name="owners_lname" value="<%=pb.getReference_owner_id().getOwners_lname()%>"> 
					<input type="hidden" name="owners_gender" value="<%=pb.getReference_owner_id().getOwners_gender()%>"> 
					<input type="hidden" name="address"	value="<%=pb.getReference_owner_id().getAddress()%>"> 
					<input type="hidden" name="telephon" value="<%=pb.getReference_owner_id().getTelephon()%>">
					<input type="hidden" name="owners_birthday"	value="<%=pb.getReference_owner_id().getOwners_birthday()%>">
						
					<input  class="btn btn-success" type="submit" value="ข้อมูลเจ้าของ">
					</form>
				</td>
				<td>
				<form action="petDetail.jsp" method="post">
						<input type="hidden" name="owner_name"	value="<%=pb.getReference_owner_id().getOwners_name() %>"> 
						<input type="hidden" name="owner_lname"	value="<%=pb.getReference_owner_id().getOwners_lname() %>">  
						<input type="hidden" name="owner_id"value="<%=request.getParameter("owner_id")%>">
						<input type="hidden" name="pet_id"	value="<%=pb.getId()%>"> 
						<input type="hidden"name="pet_name" value="<%=pb.getPet_name()%>">
						<input type="hidden" name="pet_category"value="<%=pb.getPet_category()%>"> 
						<input	type="hidden" name="pet_gene"	value="<%=pb.getPet_gene()%>"> 
						<input type="hidden" name="pet_gender" value="<%=pb.getPet_gender()%>">
						<input type="hidden" name="pet_weight"	value="<%=pb.getPet_weight()%>"> 
						<input	type="hidden" name="pet_birthday"	value="<%=pb.getPet_birthday()%>"> 
						<input	type="hidden" name="pet_age"value="<%=pb.getPet_age()%>"> 
						<input type="hidden" name="pet_extra" value="<%=pb.getPet_extra()%>">
						<input type="hidden" name="page_petSearch" value="1">
					<input  class="btn btn-info" type="submit" value="รายละเอียดสัตว์เลี้ยง">
				</form>
				</td>
				
			</tr>
			<%
				}
			%>
		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pagePetViewSerachServlet">
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
			</form><br>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
	</div>

	<%
		}
		if (petList.size() == 0) {
	%>
	<script>
		alert('ไม่พบข้อมูลสัตว์เลี้ยงที่ค้นหา กรุณาตรวจสอบข้อมูลอีกครั้ง !!');
	</script>
	<%
		}
	%>

</div>


<%@ include file="footer_index.jsp"%>