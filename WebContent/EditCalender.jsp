<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="1NewFile.jsp"%>
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
	<br>
	<br>
	<br>

	<center>
		<div class="cal_input_table">
			<script type="text/javascript">
				$(function() {
					$("#dateInput").datetimepicker({
						dateFormat : 'yy-mm-dd',
						timeFormat : "HH:mm:ss"

					});
				});
			</script>
			<%
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				String id_auto = request.getParameter("id_auto");
				String title = request.getParameter("title");
				String date = request.getParameter("date");
			%>

			<form action="EditcalendarServlet" method="post">
			<input type="hidden" name="id_auto" value="<%=id_auto%>">
				<h3>
					<b>เพิ่มรายการวันนัด</b>
				</h3>
				<table border="1" width="">
					<tr>
						<td colspan="2"></td>
					</tr>


					<tr>
						<td><br>
						<center>เรื่องนัดหมาย</center> <br></td>
						<td><input type="text" name="title" value="<%=title%>"></td>
					</tr>
					<tr>
						<td><br>
						<center>วัน/เวลา/เดือน/ปี</center> <br></td>
						<td><input type="text" name="date" id="dateInput"
							value="<%=date%>"></td>
					</tr>
					<tr>
						<td><br>
						<center>อื่นๆ</center></td>
						<td><input type="text" name="url"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" class="btn btn-success"
							value="ตกลง"></td>
					</tr>
				</table>

			</form>
			<img alt=""
				src="http://www.thaijob.com/upload/employer/G7aYgLXX67aaGAfWv61.jpg "
				width="250" height="250">
		</div>
	</center>
	<div class="container">
		<div align="left"
			style="position: fixed; bottom: 80%; margin: 0px auto;">
			<a href="index-officer.jsp"><input type="submit"
				class="btn btn-success" value="ย้อนกลับ" /></a>
		</div>



		<%@ include file="footer_index.jsp"%>
		<br>
		<br>
		<br> <br>
		<br>
		<br> <br>
		<br>
		<br> <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>