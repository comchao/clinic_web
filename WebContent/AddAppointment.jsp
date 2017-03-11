<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="dao.PetsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.PetsBean"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.*" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>


<!-- เรียกใช้งาน bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- เรียกใช้งาน CSS  -->
<link href="css/freelancer.css" rel="stylesheet">
<title>เพิ่มข้อมูลนัดหมายสัตว์เลี้ยง</title>
<!-- Header -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="all" type="text/css" href="jquery-ui.css" />

<link rel="stylesheet" media="all" type="text/css"
	href="jquery-ui-timepicker-addon.css" />


<script type="text/javascript" src="jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="jquery-ui.min.js"></script>


<script type="text/javascript" src="jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript" src="jquery-ui-sliderAccess.js"></script>




</head>
<body>
<%

String owner_id = request.getParameter("owner_id");
String owner_name = request.getParameter("owner_name");
String owner_lname = request.getParameter("owner_lname");
String id = request.getParameter("id");
String idmenber = request.getParameter("idmenber");





%>


	<center>

		<script type="text/javascript">
			$(function() {
				$("#dateInput").datetimepicker({
					dateFormat : 'yy-mm-dd',
					timeFormat : "HH:mm:ss"

				});
			});
		</script>
		<div class="container">

			<h3 align="center">เพิ่มข้อมูลนัดหมายสัตว์เลี้ยง</h3>
			
			<br />

			<div class="row">
			<form action="">

				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
					<%
					PetsDAO dao = new PetsDAO (); 
					List<PetsBean >List=dao.searchPet(Integer.parseInt(id));
							
for(int i = 0;i<List.size();i++){
	
	PetsBean bean = List.get(i);

%>
						
						
						
						
						
						
						<b><input name="" type="text" 
							class="form-control" value="<%="ชื่อเจ้าของสัตว์:&nbsp;"+bean.getOwners_name()+"&nbsp;&nbsp;"+bean.getOwners_lname()%>"  readonly="readonly" style="background: #CCFFCC"/>
					</b>
					       <input name="id" type="hidden" value="<%=bean.getId()%>">  <!-- ตัวแปรเพิ่มข้อมูลนัดหมาย -->
					         
					<%}%>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
					<%
					PetsDAO dao8 = new PetsDAO (); 
					List<PetsBean >List8=dao8.searchPet(Integer.parseInt(id));
							
for(int i8 = 0;i8<List8.size();i8++){
	
	PetsBean bean8 = List8.get(i8);
%>
						<input name="Close" type="text" 
							class="form-control" value="<%="เบอร์ติดต่อ:&nbsp;&nbsp;&nbsp;"+bean8.getTelephon()%>"  readonly="readonly" style="background:  "/>
					
					<%}%>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
						
						
						<% PetsDAO dao9 = new PetsDAO (); 
						List<PetsBean >List9=dao9.members(Integer.parseInt(idmenber));
								
	for(int i9 = 0;i9<List9.size();i9++){
		
		PetsBean bean9 = List9.get(i9);
						
						
						%>
						<b><input name="Close" type="text" 
							 class="form-control"   value="<%="แพทย์ผู้นัด:&nbsp;&nbsp;"+bean9.getMem_name()+"&nbsp;&nbsp;"+bean9.getMem_lname()%>" readonly="readonly" style="background: #FF9999"  />
					</b>
					  <input name="idmenber" type="hidden" value="<%=idmenber%>"> <!-- ตัวแปรเพิ่มข้อมูลนัดหมาย -->
					
					<%} %>		
					</div>
				</div>
				<% PetsDAO dao11 = new PetsDAO (); 
						List<PetsBean >List11=dao11.members(Integer.parseInt(idmenber));
								
	for(int i11 = 0;i11<List11.size();i11++){
		
		PetsBean bean11 = List11.get(i11);
						
						
						%>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
						<input name="Close" type="text" 
							 class="form-control"  value="<%="ตำแหน่ง:&nbsp;&nbsp;"+bean11.getMem_position()%>"  readonly="readonly" />
					
					<%} %>
					
					</div>
				</div>
				
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
					<%
					PetsDAO dao2 = new PetsDAO (); 
					List<PetsBean >List2=dao2.searchPet(Integer.parseInt(id));
							
for(int i2 = 0;i2<List2.size();i2++){
	
	PetsBean bean2 = List2.get(i2);
%>
						<B><input name="Close" type="text" 
							 class="form-control"   value="<%="ชื่อสัตว์เลี้ยง:&nbsp;&nbsp;"+bean2.getPet_name()%>"  readonly="readonly" style="background:  #CCFFCC" />
					</B> <%} %>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
					<%
					PetsDAO dao3 = new PetsDAO (); 
					List<PetsBean >List3=dao3.searchPet(Integer.parseInt(id));
							
for(int i3 = 0;i3<List3.size();i3++){
	
	PetsBean bean3 = List3.get(i3);
%>
						<input name="Close" type="text" 
							 class="form-control"   value="<%="ประเภท:&nbsp;&nbsp;"+bean3.getPet_category()%>" readonly="readonly"  />
							 <%} %>
							 
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
						<input name="title" type="text" 
							 class="form-control"    value=""     /> 
					</div>
				</div>
				 
				
				
				<%java.text.DateFormat df = new java.text.SimpleDateFormat("EEEE dd  MMMM yyyy", new Locale("th", "TH")); %>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
						<b><input name="date" type="text" 
							 class="form-control"   value=""  id="dateInput"   /> <!-- ตัวแปรเพิ่มข้อมูลนัดหมาย --> 
					</b></div>
				</div>
				
				
				
				
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
																<%
					PetsDAO dao4 = new PetsDAO (); 
					List<PetsBean >List4=dao4.searchPet(Integer.parseInt(id));
							
for(int i4 = 0;i4<List4.size();i4++){
	
	PetsBean bean4 = List4.get(i4);
%>
						<input name="Close" type="text" 
							 class="form-control"   value="<%="สาพันธุ์:&nbsp;&nbsp;"+bean4.getPet_gene()%>"  readonly="readonly" />
							 <%} %>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
																<%
					PetsDAO dao5 = new PetsDAO (); 
					List<PetsBean >List5=dao5.searchPet(Integer.parseInt(id));
							
for(int i5 = 0;i5<List5.size();i5++){
	
	PetsBean bean5 = List5.get(i5);
%>
						<input name="Close" type="text" 
							 class="form-control"   value="<%="เพศ:&nbsp;&nbsp;"+bean5.getPet_gender() %>"  readonly="readonly" />
					 
					 <%} %>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
						<input name="room" type="text" 
							 class="form-control"   value="ห้องตรวจ"   />  <!-- ตัวแปรเพิ่มข้อมูลนัดหมาย -->  
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group" style="text-align: center">
						<input name="not" type="text" 
							 class="form-control"   value="หมายเหตุ"   /> <!-- ตัวแปรเพิ่มข้อมูลนัดหมาย -->  
					</div>
				</div><div class="col-sm-3">
					<div class="form-group" style="text-align: center">
					<%
					PetsDAO dao6 = new PetsDAO (); 
					List<PetsBean >List6=dao6.searchPet(Integer.parseInt(id));
							
for(int i6 = 0;i6<List5.size();i6++){
	
	PetsBean bean6 = List6.get(i6);
%>
						<input name="Close" type="text" 
							 class="form-control"   value="<%="อายุ:&nbsp;&nbsp;"+bean6.getPet_age() %>"  readonly="readonly" />
							 
					    <input name="id_ownerdata" type="hidden" value="<%=bean6.getOwner_id()%>">    <!-- ตัวแปรเพิ่มข้อมูลนัดหมาย -->  
							 
							 
					<%} %>
					</div>
				</div><div class="col-sm-3">
					<div class="form-group" style="text-align: center">
					<%
					PetsDAO dao7 = new PetsDAO (); 
					List<PetsBean >List7=dao7.searchPet(Integer.parseInt(id));
							
for(int i7 = 0;i7<List7.size();i7++){
	
	PetsBean bean7 = List7.get(i7);
%>
						<input name="Close" type="text" 
							 class="form-control"   value="<%="น้ำหนัก:&nbsp;&nbsp;"+bean7.getPet_weight()+"kg." %>"  readonly="readonly" />
							 <%} %>
							 
					</div>
				</div>
			</div>
			
			
			
			
			<div class="col-sm-12">
		<div class="form-group" style="text-align: center">
			<input name="Close" type="submit" class="btn btn-success" id="CloseCage" onClick="Javascript:updateCage()" value="ยืนยันรายการ">
		</div>
	</div>
			
			</form>
			
			
	</center>






	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>