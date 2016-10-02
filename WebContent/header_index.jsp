<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

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
<link rel="stylesheet" type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.css">  
<link rel="stylesheet" type="text/css" href="css/datetime.css">  
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> 
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script> 
<script type="text/javascript" src="js/jquery_datetime.js"></script>  
<!-- คำนวณวัน -->
<script type="text/javascript" src="js/jquery_days.js"></script> 
<!-- เช็คตัวเลข  -->
<script type="text/javascript" src="js/check_num.js"></script> 
<!-- คำนวณค่าหน้าเดิม  -->
<script type="text/javascript" src="js/send_form.js"></script> 

 <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css_menu/style.css" />
		<script type="text/javascript" src="js/modernizr.custom.79639.js"></script> 
		<link rel="stylesheet" type="text/css" href="css_menu/noJS.css" />
<script>

	function logoutConfirm() {
		if (confirm("คุณต้องการออกจากระบบใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
</script>
<title>ระบบจัดการคลินิกสัตว์</title>
</head>

<body>
	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("errorConfrim.jsp");
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
						<div id="dd" class="wrapper-dropdown-5" tabindex="1"><a href="#"><i class="icon-user"></i><%=session.getAttribute("firstname")%> <%=session.getAttribute("lastname")%>
						</a>
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
	<script type="text/javascript">
	$(document).ready(function() {
		$mem_position = $("select[name='mem_position']");
		$type_code = $("select[name='type_code']");

		$mem_position.change(function() {

			if ($(this).val() == "สัตวแพทย์-เจ้าของ") {
				$("select[name='type_code'] option").remove();
				$("<option>1</option>").appendTo($type_code);
			}

			if ($(this).val() == "สัตวแพทย์") {
				$("select[name='type_code'] option").remove();
				$("<option>2</option>").appendTo($type_code);
			}

			if ($(this).val() == "พนักงาน") {
				$("select[name='type_code'] option").remove();
				$("<option>3</option>").appendTo($type_code);
			}

		});
	});

	//คำนำหน้า เพศ เจ้าของสัตว์เลี้ยง
	$(document).ready(function() {
		$prefix = $("select[name='prefix']");
		$owners_gender = $("select[name='owners_gender']");

		$prefix.change(function() {

			if ($(this).val() == "นาย") {
				$("select[name='owners_gender'] option").remove();
				$("<option>ชาย</option>").appendTo($owners_gender);
			}

			if ($(this).val() == "นาง") {
				$("select[name='owners_gender'] option").remove();
				$("<option>หญิง</option>").appendTo($owners_gender);
			}

			if ($(this).val() == "นางสาว") {
				$("select[name='owners_gender'] option").remove();
				$("<option>หญิง</option>").appendTo($owners_gender);
			}

		});
	});


	//คำนำหน้า ระบุเพศ
	$(document).ready(function() {
		$prefix = $("select[name='prefix']");
		$mem_gender = $("select[name='mem_gender']");

		$prefix.change(function() {

			if ($(this).val() == "นาย") {
				$("select[name='mem_gender'] option").remove();
				$("<option>ชาย</option>").appendTo($mem_gender);
			}

			if ($(this).val() == "นาง") {
				$("select[name='mem_gender'] option").remove();
				$("<option>หญิง</option>").appendTo($mem_gender);
			}

			if ($(this).val() == "นางสาว") {
				$("select[name='mem_gender'] option").remove();
				$("<option>หญิง</option>").appendTo($mem_gender);
			}

		});
	});
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}
			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-5').removeClass('active');
				});

			});
			$(function() {

				var dd = new DropDown( $('#ddd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-5').removeClass('active');
				});

			});
		</script>