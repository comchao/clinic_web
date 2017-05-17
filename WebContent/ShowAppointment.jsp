<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.OwnersDAO,model.OwnersBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>
<div class="container">



	<a href="index-veterinary.jsp"><input type="submit" class="btn btn-info" value="ย้อนกลับ"  align="right" /></a>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; 
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      
       



	<a href="addOwner.jsp"><input type="submit" class="btn btn-info" value="เพิ่มข้อมูลเจ้าของสัตว์เลี้ยง"  align="left" /></a>



	<div class="row">
		<div align="center">
		<div class="col-sm-12"><h3 align="center">เพิ่มข้อมูลนัดหมายสัตว์เลี้ยง</h3></div>
		<div class="col-sm-12">
		<div class="col-sm-6"><h4 align="center">ค้นหาข้อมูลเจ้าของ</h4>
			
			<form action="SearchOwnerAppointmentServlet" method="post">
				<input name="owner_name" type="text" class="form-control"  placeholder="ชื่อเจ้าของสัตว์เลี้ยง,หมายเลขบัตรประชาชน,เบอร์โทรศัพท์" style="width:70%;"/> 
				<input type="hidden" name="searchType" >
				<input type="submit" class="btn btn-info" value="ค้นหา" />
			</form></div>
		<div class="col-sm-6"><h4 align="center">ค้นหาข้อมูลสัตว์เลี้ยง</h4>
			
			<form action="SearchPetAppointmentServlet" method="post">
				<input name="pet_name" type="text" class="form-control"	placeholder="ชื่อสัตว์เลี้ยง" style="width:70%;"/> 
				<input type="hidden" name="searchType" value="searchPets">&nbsp;&nbsp; 
				<input type="submit" class="btn btn-info" value="ค้นหา" />
			</form></div>
		</div>
			
			
		</div>
	</div>
	<br> <br>
	<%
		ArrayList<OwnersBean> ownerList = (ArrayList) session.getAttribute("allOwnerSS");
		if (ownerList != null) {
	%>

	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<th>ลำดับ</th>
				<th>เลขบัตรประชาชน</th>
				<th>คำนำหน้า</th>
				<th>ชื่อ</th>
				<th>นามสกุล</th>
				<th>เพศ</th>
				<th>เบอร์โทร</th>
				<th></th>
				<th></th>
			</tr>
			<%
					OwnersBean ob;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == ownerList.size()) {
							break;
						}
						ob = (OwnersBean) ownerList.get(i);
				%>
			<tr>
				<td><%=i+1%></td>
				<td><%=ob.getOwners_idcard() %></td>
				<td><%=ob.getPrefix()%></td>
				<td><%=ob.getOwners_name()%></td>
				<td><%=ob.getOwners_lname()%></td>
				<td><%=ob.getOwners_gender()%></td>
				<td><%=ob.getTelephon()%></td>
				
				<td><form action="ShowPetAppointmentServlet" method="post">
						<input type="hidden" name="owner_id" value="<%=ob.getId()%>">
						<input type="hidden" name="owner_name" value="<%=ob.getOwners_name()%>">
						<input type="hidden" name="owner_lname" value="<%=ob.getOwners_lname()%>">
						<input type="hidden" name="page_ownerView" value="1">
						
						<input type="submit" class="btn btn-success"
						value="นัดหมาย">
				</form></td>
				<td>
					<form action="ownerDetail.jsp" method="post">
					<input type="hidden" name="owner_id" value="<%=ob.getId()%>">
					<input type="hidden" name="owners_idcard" value="<%=ob.getOwners_idcard()%>"> 
					<input type="hidden" name="prefix"	value="<%=ob.getPrefix()%>"> 
					<input type="hidden" name="owners_name" value="<%=ob.getOwners_name()%>">
					<input type="hidden" name="owners_lname" value="<%=ob.getOwners_lname()%>"> 
					<input type="hidden" name="owners_gender" value="<%=ob.getOwners_gender()%>"> 
					<input type="hidden" name="address"	value="<%=ob.getAddress()%>"> 
					<input type="hidden" name="telephon" value="<%=ob.getTelephon()%>">
					<input type="hidden" name="owners_birthday"	value="<%=ob.getOwners_birthday()%>">
					<input  class="btn btn-info" type="submit" value="รายละเอียดเจ้าของ">
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pageOwnerViewServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (ownerList.size() / 10) + 1;
						int c = ownerList.size() % 10;
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
			<br>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
	</div>

	<%
		}
		if (ownerList.size() == 0) {
	%>
	<script>
		alert('ไม่พบข้อมูลที่ต้องการค้นหา กรุณาตรวจสอบข้อมูลอีกครั้ง !!');
	</script>
	<%
		}
	%>

</div>


<%@ include file="footer_index.jsp"%>