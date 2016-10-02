<%@page import="dao.PetsDAO"%>
<%@page import="model.TypePetBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>ระบบจัดการคลินิกสัตว์</title>
	
	<!-- เรียกใช้งาน bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	
	<!-- เรียกใช้งาน CSS  -->
	<link href="css/freelancer.css" rel="stylesheet">
	<link href="css/petshop.css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="css/css_layout.css">
	
	<!-- เรียกใช้งาน javascript -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.livequery.js"></script>
	<script src="petshop-script.js" type="text/javascript" charset="utf-8"></script>
	<script src="javascripts/simpleCart_uncompressed.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"> simpleCart = new cart("anahcnaw@gmail.com"); </script>
	
	<style>
		.cartHeaders,.totalRow{display:none;}
		.simpleCart_items{
			overflow-y:auto;
			overflow-x:hidden;
			height:324px;
			width:243px;
			margin-bottom:20px;
		}
		.itemContainer{
			clear:both;
			width:229px;
			padding:11px 0;
			font-size:11px;
		}
		.itemImage{
			float:left;
			width:60px;
		}
		.itemName{
			float:left;
			width:85px;
		}
		.itemPrice{
			float:left;
			width:85px;
			color:#418932;
		}
		.itemQuantity{
			float:left;
			width:33px;
			margin-top:-12px;
			vertical-align:middle;
		}
		.itemQuantity input{
			width:20px;
			border:1px solid #ccc;
			padding:3px 2px;
		}
		
		.itemTotal{
			float:left;
			color:#c23f26;
			margin-top:-6px
		}
	</style>
</head>
<body>
	<div align="left" style="position:fixed;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("index.jsp");
		}
	%>
	
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

					<li class="page-scroll"><a href="index-veterinary.jsp">สัตวแพทย์</a>
					</li>

					<%
						}
					%>
					<li class="page-scroll"><a href="LogoutServlet" class="btn">ออกจากระบบ</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
		
	<div class="container" style="margin-top: 90px;">
	<div class="col-md-12">
	<div class="col-md-4" align="right"><p>สินค้าสัตว์เลี้ยง :</p></div>
	<div class="col-md-4">
		<div class="form-group">
				<select name="refer_type_pet" id="refer_type_pet" class="form-control" required="required">
				</select>
		</div>
	</div>
	<div class="col-md-4"></div>
	
	</div>
		<div class="col-md-12">
			<div class="col-md-9" id="detailProduct">
				
				
				
			</div>
			<div class="col-md-3 panel panel-info" style="vertical-align: top;">
				<div id="sidebar" align="center">
					<p align="center"> <h3>รายการสินค้า</h3></p>
					
					<div class="simpleCart_items" ></div>
					
					<!--Here's the Links to Checkout and Empty Cart-->
					<a href="#" class="btn btn-sm btn-danger simpleCart_empty">เคลียร์รายการ</a>
					<a href="#" class="btn btn-sm btn-primary simpleCart_checkout">พิมพ์ใบเสร็จ</a>
					
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer_index.jsp"%>
</body>
</html>
