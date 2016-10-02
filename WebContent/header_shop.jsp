<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script>
	function logoutConfirm() {
		if (confirm("คุณต้องการออกจากระบบใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
</script>
 <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css_menu/style.css" />
		<script type="text/javascript" src="js/modernizr.custom.79639.js"></script> 
		<link rel="stylesheet" type="text/css" href="css_menu/noJS.css" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- เรียกใช้งาน bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- เรียกใช้งาน CSS  -->
<link href="css/freelancer.css" rel="stylesheet">

<!-- กำหนดฟอร์น -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- จัดการวันที่ -->
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.shop.js"></script>


<title>ระบบจัดการคลินิกสัตว์</title>
</head>

<body>
	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("index.jsp");
		}
	%>
	
	
	<div class="container">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->

				<a class="navbar-brand" href="javascript:history.back();">วัฒนารักษาสัตว์</a>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden"><a href="#page-top"></a></li>
						
						
						<% 
							if ((session.getAttribute("typecode") == "1")||(session.getAttribute("typecode") == "3")) {
						%>
						
							<li class="page-scroll"><a href="index-officer.jsp">พนักงาน</a>
							</li>
						<%
						}
						%>

						<%
						if ((session.getAttribute("typecode") == "1")||(session.getAttribute("typecode") == "2")) {
						%>
							
							<li class="page-scroll"><a href="index-veterinary.jsp">สัตวแพทย์</a></li>
						<%
							
						}
						%>
						<li class="page-scroll">
						<div id="dd" class="wrapper-dropdown-5" tabindex="1"><a href="#"><i class="icon-user"></i><%=session.getAttribute("firstname")%> <%=session.getAttribute("lastname")%></a>
						<ul class="dropdown">
							<li><a href="LogoutServlet" onclick="return logoutConfirm();"><i class="icon-remove"></i>ออกจากระบบ</a></li>
						</ul>
					</div>
					</li>
					
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>