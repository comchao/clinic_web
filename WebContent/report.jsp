<%@page import="dao.TypeDrugDAO"%>
<%@page import="model.TypeDrug"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<script type="text/javascript">
function mydate() {
	  //alert("");
	  document.getElementById("dt").hidden = false;
	  document.getElementById("ndt").hidden = true;
	}

	function mydate1() {
	  d = new Date(document.getElementById("dt").value);
	  dt = d.getDate();
	  mn = d.getMonth();
	  mn++;
	  yy = d.getFullYear();
	  document.getElementById("ndt").value = dt + "/" + mn + "/" + yy
	  document.getElementById("ndt").hidden = false;
	  document.getElementById("dt").hidden = true;
	}
</script>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	
</div>
	<div class="row"><br><br><br><br><br><br>	
		<h3 align="center">การออกรายงาน</h3>
		<br />
	</div>
	<div class="col-sm-12" align="center">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3">
			<h4>กรุณาเลือกรายการ</h4>
		</div>
		<div class="col-sm-3">
			<h4>วันที่ออกรายงาน </h4>
		</div>
		<div class="col-sm-3">
			<h4>ถึงวันที่</h4>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<div class="col-sm-12" align="center">
	
		<form action="ReportServlet?id=<%=session.getAttribute("id")%>" method="post">
		
		<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); %>
	  <input type="hidden" name="datenow" value="<%= df.format(new java.util.Date()) %>" >	
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3">
			<select name="report_id" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="1" selected="selected">รายงานสรุปการขายสินค้า</option>
				<option value="2">รายงานสรุปค่ายา</option>
				<option value="3">รายงานสรุปค่ารักษา</option>
				<option value="6">รายงานการนัดหมาย</option>
			</select>
		</div>
		<div class="col-sm-3">
			<input name="date_start" type="date" class="form-control" onchange="Javascript:dateTime(date_start);"	placeholder="yyyy/mm/dd" required="required" style="width:100%;"/> 
		</div>
		<div class="col-sm-3">
			<input name="date_end" type="date" class="form-control"  onchange="Javascript:dateTime(date_end);"	placeholder="yyyy/mm/dd" required="required" style="width:100%;"/> 
		</div>
		<div class="col-sm-2">
			<input type="submit" class="btn btn-info" value="ออกรายงาน" />
		</div>
		</form>
	</div>
</div>
  <script src="jquery-1.10.2.min.js"></script>
<!--   สิ้นสุด -->

<%@ include file="footer_index.jsp"%>
