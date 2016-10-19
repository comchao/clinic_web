<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="dao.DiseaseDAO"%>
<%@page import="model.AnalysisBean"%>
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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}
</style>
<link rel="stylesheet" href="demo.css">
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
		if ($tDate == "") {
			return "";
		} else {
			return $y + "-" + $m + "-" + $d;
		}
	}
</script>

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

<center>
	<div class="col-lg-6">
		<div class="cont1">

				
				<div class="panel">
					<div class="panel-heading">อาการที่พบเบื้องต้น</div>
					<div class="panel-body">
						<ul class="input-list">
							<table bgcolor="#FFFFFF">
								<!--   อาการโรคสัตว์ที่พบเบื้องต้น -->
	<tr>							<li>

<th width="200"> <h4>อาการ</h4>  </th>
<th width="150">   <h4>โรค    </h4> </th>
<th width="150">   <h4>รหัสอาการ </h4> </th>
<th width="150">   <h4>รหัสโรค       </h4>  </th>
<th width="150">   <h4>ระดับอาการ</h4>  </th>

</tr>
<%
request.setCharacterEncoding("UTF-8");
/* String id_symptom = request.getParameter("id_symptom"+1) */;

for (int i = 0; i < 50; i++) {
	request.setCharacterEncoding("UTF-8");
String value = request.getParameter("value"+i);
String symptom = request.getParameter("symptom"+i);
String id_symptom = request.getParameter("id_symptom"+i);

%>

 

<%if(value!=null&&symptom!=null){ %>
<form action="" method="post">
 <%--  <tr><center><td> <input name="id_symptom<%=i%>"  type="checkbox" onClick="toggle(this)" value="<%=id_symptom%>" /> <br/>   --%>  
<%-- <center><td><%=i+1%></td><center> --%>

<%-- 
 <tr><td><%=symptom%></td></center> --%>
                                                      
 		
<%

DiseaseDAO dao = new DiseaseDAO();  

List<AnalysisBean> List = dao.symptom(symptom);
response.setCharacterEncoding("utf-8");
for(int x=0;x<List.size();x++){
	AnalysisBean bean = List.get(x);

 

%>	
<tr>  <td><%=bean.getSymptom()%></td>
      <td><%=bean.getDisease() %></td>
	  <td><%=bean.getId_symptom() %></td>
	  
	  <td><%=bean.getId_disease() %></td>
	
	<td><%if(value.equals("1")){%>
              	มาก   
              	 <%}if(value.equals("0.5")){%>
              	น้อย 
              	 <%}if(value.equals("0")){%>
                                          ปกติ<%} %> </td>
      <%--    <input name="value<%=i%>" type="hidden" value="<%=value%>"/>	
         <input name="id_symptom<%=i%>" type="hidden" value="<%=id_symptom%>"/>	     --%>
	
<%}}}
%>


		</form>
</table>
<input name="submit" type="submit" >
					</div>
				</div>
		</div>
	</div>
</center>


</div>
<%@ include file="footer_index.jsp"%>