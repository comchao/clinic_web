<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.CalendarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>
<br>
<br>
<br>
<br>
<script>
	function editConfirm() {
		if (confirm("คุณต้องการแก้ไขข้อมูลสินค้าใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
	function delConfirm() {
		if (confirm("คุณต้องการลบข้อมูลสินค้าใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
	
</script>
<script type="text/javascript">
function dateTime($tDate) //แปลงวันที่เป็นวันที่ไทย
{
	$y = substr($tDate, 0, 4);
	$m = substr($tDate, 5, 2);
	$d = substr($tDate, 8, 9);
	if ($tDate == "")
	{
		return "";
	} else
	{
		return  $y+"-"+$m+"-"+$d;
	}
}
</script>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
<div align="right">
	 <a href="AddCalenderServlet.jsp"><input type="submit"
				class="btn btn-primary" value="เพิ่มข้อมูลการนัดหมาย" /></a>
</div>
	<div class="row">
		<div align="center">
		<h4 align="center">ข้อมูลการนัดหมาย</h4>	
	
			<form action="searchProductServlet" method="post">
				<input name="date" type="date" class="search-query" onchange="Javascript:dateTime(date_end);"	placeholder="yyyy-mm-dd" required="required"> <input type="hidden"
					name="searchType" value="searchProducts">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
		</div>

	</div>
	
	<div align="center">
	<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th>ลำดับ</th>
					<th>รหัสสัตว์เลี้ยง</th>
					<th>ประเภทการนัด</th>
					<th>วัน/เดือน/ปี</th>
					<th>สถานะ</th>
					<th>อื่นๆ</th>
					</tr>
			
				
	<%  ArrayList<CalendarBean> list = (ArrayList)request.getAttribute("list") ;%>
<%  CalendarBean bean;     for (int i=0; i<list.size(); i++){
							bean = (CalendarBean) list.get(i); %>

	
<tr>
						<td><%=i+1%></td>
					<td><%=bean.getId_calendar()%></td>
					
					<td><%=bean.getTitle()%></td>
					<td><%=bean.getDate()%></td>
					
					<td bgcolor="#FF9797"><%=bean.getStatus()%></td>
				<%-- 	<td><%=bean.getUrl()%></td> --%>
					<td><div style="display: block; float: ; padding: 3px 3px;">
						

					<input type="submit" onclick="return editConfirm();"class="btn btn-warning" value="รายละเอียด">
				
		</td>

			</tr>
				<% }%>	
					

			<!-- สิ้นสุดตัวแบ่งหน้า -->
		</div>
	
	<%-- <%
		}
	%> --%>
	<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
	
	
</div>
<%@ include file="footer_index.jsp"%>