<%@page import="dao.TypeDrugDAO"%>
<%@page import="model.TypeDrug"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
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
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
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
	
		<form action="ReportServlet" method="post">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3">
			<select name="report_id" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="1" selected="selected">รายงาน การซื้อสินค้าภายในร้าน</option>
				<option value="2">รายงาน ค่ายา</option>
				<option value="3">รายงาน ค่ารักษา</option>
			</select>
		</div>
		<div class="col-sm-3">
			<input name="date_start" type="date" class="search-query" onchange="Javascript:dateTime(date_start);"	placeholder="yyyy-mm-dd" required="required" style="width:100%;"/> 
		</div>
		<div class="col-sm-3">
			<input name="date_end" type="date" class="search-query" onchange="Javascript:dateTime(date_end);"	placeholder="yyyy-mm-dd" required="required" style="width:100%;"/> 
		</div>
		<div class="col-sm-2">
			<input type="submit" class="btn btn-info" value="ออกรายงาน" />
		</div>
		</form>
	</div>
</div>

<%@ include file="footer_index.jsp"%>
