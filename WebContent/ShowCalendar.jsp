<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.CalendarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<%@page import=" java.util.Date"%>
 <%@page import="java.util.Locale"%>
 
 <%@page import ="java.text.SimpleDateFormat"%>
 <%@page import =" java.util.Date"%>
 <%@page import =" java.text.ParseException"%>
 <%@page import="model.CalJson"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model.CalBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.CalendarDAO"%>
 
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
<% Locale lc = new Locale("th","TH"); %>
	<%java.text.DateFormat df = new java.text.SimpleDateFormat("EEEE ที่ dd เดือน MMMM พ.ศ. yyyy", new Locale("th", "TH")); %>
	<h4 align="right"> <b>  <%= df.format(new java.util.Date()) %></b> </h4>
	
	

		<br>
	<h3 align="center"><b>ข้อมูลการนัดหมายสัตว์เลี้ยงทั้งหมด</b></h3> <br>

	<div align="left">
		<!-- <a href="index-veterinary.jsp"  ><input type="submit" class="btn btn-info" value="ย้อนกลับ" align="left" /></a> </div>
 -->

						<div align="right">
					
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						    <%  if ((session.getAttribute("typecode") == "1")||(session.getAttribute("typecode") == "1")&(session.getAttribute("typecode") == "2")||(session.getAttribute("typecode") == "2")) {
						%>
							<a href="ShowAppointmentSservlet"><input type="submit" class="btn btn-info" value="เพิ่มข้อมูลการนัดหมาย"   ></a>
						
						<%
						}
						%>

							
</div>




<div class="row">
		<div align="right">
		
	
		<script>
				function windowOpenCage() {
			    var myCage=window.open('ShowAppointmentSservlet','windowRef','width=800,height=800,top=100,left=100');
			    if (!myCage.opener) myCage.opener = self;
									}
							     	</script> 
								
			</form>
		</div>

	</div>






</table>
	<div class="row">
		<div align="center">
		<h4 align="center"></h4>	
	
			<form action="searchCalenderServlet" method="get">
				<input name="dateCalender" type="date" class="form-control" style="width:30%;"  onchange="Javascript:dateTime(date_end);"	placeholder="yyyy-mm-dd" required="required"> <input type="hidden"
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
					<th>ชื่อเจ้าของสัตว์เลี้ยง</th>
					<th>ชื่อสัตว์เลี้ยง</th>
				
					<th>ประเภท</th>
						<th>สายพันธุ์</th>
					<th>สัตว์แพทย์ผู้นัด</th>
					<th>เรื่องที่นัด</th>
					<th>วันนัด</th>
					<th>สถานะ</th>
					
						
						<th></th>
					<th></th>
						
						
					</tr>
			
				
	<%  ArrayList<CalendarBean> list = (ArrayList)request.getAttribute("list");%>
<%  CalendarBean bean;     for (int i=0; i<list.size(); i++){
							bean = (CalendarBean) list.get(i); %>
							
							
	<%
	
	
	
	%>

<tr>
					
					
					
					
						<td><%=i+1%></td>
					<td><%=bean.getOwners_name()%>&nbsp; &nbsp;<%=bean.getOwners_lname()%></td>
					<td><%=bean.getPet_name()%></td>
					<td><%=bean.getPet_category()%></td>
					<td><%=bean.getPet_gene()%></td>
				
					
					<td><%=bean.getMem_name()%>&nbsp; &nbsp;<%=bean.getMem_lname()%></td>
						<td  bgcolor="#FFFFF0" ><%=bean.getTitle() %></td>
						<%  SimpleDateFormat sourceDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    Date date = sourceDateFormat.parse(bean.getDate());
    SimpleDateFormat targetDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
   
						
						%>
						
					<td><%="&nbsp; &nbsp;" +targetDateFormat.format(date)%></td>
					
					
					<td bgcolor="#FF9797">&nbsp; &nbsp;นัดหมาย&nbsp; &nbsp;</td>
				
				<!-- EditcalendarServlet" -->
					
					
					<% if ((session.getAttribute("typecode") == "1")||(session.getAttribute("typecode") == "1")&(session.getAttribute("typecode") == "2")||(session.getAttribute("typecode") == "2")) {
						%>
							
						
					<td>
					<!-- EditcalendarServlet" -->
				<form action="ViewAppointment.jsp" method="post"> 
						
						<input type="hidden" name=id_pet value="<%=bean.getId()%>">
						<input type="hidden" name="title" value="<%=bean.getTitle()%>">
						<input type="hidden" name="date" value="<%=bean.getDate()%>">
						<input type="hidden" name=id_auto value="<%=bean.getId_auto()%>">
						<input type="hidden" name=idmenber value="<%=session.getAttribute("id")%>">
						<input type="hidden" name=Date value="<%=bean.getDate()%>">
						<input type="hidden" name=note value="<%=bean.getNote()%>">
						
						
						
						<input type="submit"  class="btn btn-success" value="รายละเอียด">
					
					 </form> 
				<!-- EditcalendarServlet" -->
					</td>
					
				<%} %>
					
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
	
	
</div></table>

<%@ include file="footer_index.jsp"%>
