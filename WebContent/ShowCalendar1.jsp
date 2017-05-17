<%@ include file="header_index.jsp"%>
<%@page import="net.calendar.action.CalJson"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="net.calendar.db.CalBean"%>
<%@page import="java.util.List"%>
<%@page import="net.calendar.db.CalDAO"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<br>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>   </title>
    <link rel="stylesheet" href="js/fullcalendar-2.1.1/fullcalendar.min.css">
    <style type="text/css">
    html,body{
        maring:0;padding:0;
        font-family:tahoma, "Microsoft Sans Serif", sans-serif, Verdana;   
        font-size:12px;
    }
	#calendar{
		max-width: 700px;
		margin: 0 auto;
        font-size:13px;
	}        
    </style>
</head>
<body>

<br><br><br><br><br>
<div class="container">
<div align="left">
<a href="index-veterinary.jsp" ><input type="submit" class="btn btn-info" value="     ย้อนกลับ         "   /> </a>
 </div>
<div align="right">
	<a href="ShowAppointmentSservlet"><input type="submit" class="btn btn-info" value="เพิ่มข้อมูลการนัดหมาย"  /></a>
 </div>
<br>
		<div class="col-sm-12"><h3 align="center">ปฏิทินนัดหมายสัตว์เลี้ยง</h3></div>
		<br>	<br>	<br>	<br>	<br>
				
<div style="margin:auto;width:700px;">
 <div id='calendar'></div>
 </div>
	<%-- DI:<%=session.getAttribute("id")%> --%>

	</div>
	

					
					<td>
					<%-- <form action="editProduct.jsp?product_id=<%=pb.getId()%>" method="post">
						<input type="hidden" name="edit_product_id" value="<%=pb.getId()%>">
						<input type="hidden" name="edit_product_name" value="<%=pb.getProduct_name()%>">
						<input type="hidden" name="edit_product_detail" value="<%=pb.getProduct_detail()%>">
						<input type="hidden" name="edit_product_price" value="<%=pb.getProduct_price()%>">
						<input type="hidden" name="edit_product_unit" value="<%=pb.getProduct_unit()%>">
						<input type="submit" onclick="return editConfirm();" class="btn btn-warning" value="แก้ไข">
					</form> --%>
					</td>
					<td>
						<%-- <form action="DelProductServlet" method="post">
							<input type="hidden" name="product_id" value="<%=pb.getId()%>">
							<input onclick="return delConfirm();" class="btn btn-danger" type="submit" value="ลบข้อมูลสินค้า">
						</form> --%>
					</td>
				</tr>
				<%-- <%
					}
				%> --%>
			</table>
			<!-- ตัวแบ่งหน้า -->
			<form action="pageProductServlet">
				<div align="center">
					<br> <br>
					<%-- <%
						int a = 0;
						int b = (allProduct.size() / 10) + 1;
						int c = allProduct.size() % 10;
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
					%> --%>
				</div>
			</form><br>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
		</div>
	
	<%-- <%
		}
	%> --%>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>    
<script type="text/javascript" src="js/fullcalendar-2.1.1/lib/moment.min.js"></script>
<script type="text/javascript" src="js/fullcalendar-2.1.1/fullcalendar.min.js"></script>
<script type="text/javascript" src="js/fullcalendar-2.1.1/lang/th.js"></script>
<script type="text/javascript" src="script.js"></script>  
</div>
<%@ include file="footer_index.jsp"%>