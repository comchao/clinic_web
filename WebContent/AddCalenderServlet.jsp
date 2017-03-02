<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ include file="1NewFile.jsp" %>
    <!-- Header -->
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="all" type="text/css" href="jquery-ui.css" />
		
<link rel="stylesheet" media="all" type="text/css" href="jquery-ui-timepicker-addon.css" />

		
<script type="text/javascript" src="jquery-1.10.2.min.js"></script>
		
<script type="text/javascript" src="jquery-ui.min.js"></script>

		
<script type="text/javascript" src="jquery-ui-timepicker-addon.js"></script>
		
<script type="text/javascript" src="jquery-ui-sliderAccess.js"></script>




</head>
<body>
<br><br><br>

<center>
<div class="cal_input_table">
<script type="text/javascript">

$(function(){
	$("#dateInput").datetimepicker({
		dateFormat: 'yy-mm-dd', 
		timeFormat: "HH:mm:ss"
		
	});
});

</script>
			<form action="AddCalenderServlet" method="post">
			<h3><b>เพิ่มรายการวันนัด</b></h3>
				<table >
				<tr><td ></td></tr>
			     <input type="hidden" name="id"  id="id" value="<%=session.getAttribute("id")%>"/>
			   <input type="hidden" name="id_calendar"  id="id_calendar" value="<%=session.getAttribute("id")%>"  />
			
				<tr><td><br><center>ชื่อเจ้าของสัตว์</center> <br> </td><td><input type="text" name="title" required="required"></td></tr>
				<tr><td><br><center>วัน/เวลา/เดือน/ปี</center> <br> </td><td><input type="text" name="date"  id="dateInput" required="required"></td></tr>
				<tr><td><br><center>เรื่องนัดหมาย</center></td><td> <input type="text" name="url" required="required"> </td></tr>
				<tr><td><br><center></center></td><td><input type="submit" class="btn btn-success"  value="ตกลง"></td></tr>
				</table>
		
			</form>
			
</div>
</center>




      
<%@ include file="footer_index.jsp" %>
   <br><br><br>   <br><br><br>   <br><br><br>   <br><br><br><br><br><br><br>
