<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.CalendarDAO,model.CalendarBean"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.text.ParseException"%>
<%@page import=" java.text.SimpleDateFormat"%>
<%@page import=" java.util.Date"%>
 <%@page import="java.util.Locale"%>
<% request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
%>
<%@ include file="header_index.jsp"%>
 
  <style>
#nav {
	color: white;
	text-align: center;
	background-color: #6666ff;
	width: 30px;
	display: inline-block;
	padding: 5px;
	border: 5px solid #dadada;
	-moz-border-radius: 15px;
	border-radius: 15px;
	cursor: default;
}

.pagination {
	background-color: #dadada;
	padding: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
</style>
  
 <script src="http://code.jquery.com/jquery-latest.js"></script>
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

	<br><br><br>
	
		<% Locale lc = new Locale("th","TH"); %>
	
	<%java.text.DateFormat df = new java.text.SimpleDateFormat("EEEE ที่ dd เดือน MMMM พ.ศ. yyyy", new Locale("th", "TH")); %>
		<br>
	<h3 align="center"><b>คิวสัตว์ ที่รอตรวจรักษา</b></h3> <br>
	<h4 align="center"> <b>ณ วันที่  <%= df.format(new java.util.Date()) %></b> </h4>
	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
			<th>ลำดับ</th>
				<th>ชื่อเจ้าของสัตว์เลี้ยง</th>
				<th>ชื่อสัตว์เลี้ยง</th>
				
				<th>สายพันธุ์</th>
				<th>ประเภท</th>
				<th>สัตวแพทย์</th>
				
				<th></th>
				
				<th>สถานะ</th>
				<th></th>

			</tr>
			
		
<% ArrayList<CalendarBean> list = (ArrayList)request.getAttribute("show") ;%>
	<% CalendarBean bean; for (int i=0; i<list.size(); i++){
bean = (CalendarBean) list.get(i); %>
	
	
	             <tr>
			
			<td><%=i+1%></td>
			<td><%=bean.getOwners_name()%> &nbsp;<%=bean.getOwners_lname()%></td>
			<td><%=bean.getPet_name()%></td>
			
			<td><%=bean.getPet_gene()%></td>
			<td><%=bean.getPet_category()%></td>
			
			<td><%=bean.getMem_position()%> &nbsp;<%=bean.getMem_name()%></td>
			
		  <%if(bean.getStatus().equals("1")){%>
		   <td>
					
					<form action="UpdateTreatmentPet2" method="post">
					<input type="hidden" name="emer_status" value="1">
					&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="owner_id" value="<%=bean.getId_ownerdata()%>"> 
						<input type="hidden" name="owner_name" value="<%=bean.getOwners_name()%>"> 
						<input type="hidden" name="owner_lname"	value="<%=bean.getOwners_name()%>"> 
						<input type="hidden" name="page_ownerView" value="1">
						<input type="hidden" name="pet_id" value="<%=bean.getId()%>">
						<input type="hidden" name="Status" value="OP">
						<td bgcolor="#FF9797" >รอการตรวจรักษา</td>
						<td> <center><input class="btn btn-primary" type="submit" value="ส่งตรวจ"> </center></td>
					</form>
			</td>
				<%} %>
				
				 <%if(bean.getStatus().equals("OP")){%>
		   <td>
					
					<form action="UpdateNoTreatment2" method="post">
					<input type="hidden" name="emer_status" value="1">
					&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="owner_id" value="<%=bean.getId_ownerdata()%>"> 
						<input type="hidden" name="owner_name" value="<%=bean.getOwners_name()%>"> 
						<input type="hidden" name="owner_lname"	value="<%=bean.getOwners_name()%>"> 
						<input type="hidden" name="page_ownerView" value="1">
						<input type="hidden" name="pet_id" value="<%=bean.getId()%>">
						<input type="hidden" name="Status" value="1">
						<td bgcolor="#FFCC66" >อยุ่ระหว่างดำเนินการ</td>
						<td><center><input class="btn btn-primary" type="submit" value="ยกเลิกการตรวจ"></center><td>
					</form>
			</td>
			<%} %>
				
				 <%if(bean.getStatus().equals("0")){%>
		   <td>
					
						<td bgcolor="#33CC66" >ตรวจเรียบร้อย</td>
						<td><center><input class="btn btn-primary" type="submit" value="นัดครั้งต่อไป"></center><td>
						
			</td>
				<%} %>
				<%
		}
	%>
					
				
				
				
				
			</tr>
			
</table>
			
	
</div>
<%@ include file="footer_index.jsp"%>