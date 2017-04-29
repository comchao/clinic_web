<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.CalendarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<%@page import=" java.util.Date"%>
<%@page import="java.util.Locale"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import=" java.util.Date"%>
<%@page import=" java.text.ParseException"%>
<%@page import="model.CalJson"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model.CalBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.CalendarDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta content='width=device-width, initial-scale=1' name='viewport' />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"
	type="text/javascript"></script>
<script src="ajaxGetPost.js" type="text/javascript"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
      <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" /> -->
<script src="chartdiv.js"></script>
<link href="chartdiv.css" rel="stylesheet" type="text/css" />



<script>
var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "serial",
	  "theme": "light",
	  "dataProvider": [ {
	    "country": "USA",
	    "visits": 2025
	  }, {
	    "country": "China",
	    "visits": 1882
	  }, {
	    "country": "Japan",
	    "visits": 1809
	  }, {
	    "country": "Germany",
	    "visits": 1322
	  }, {
	    "country": "UK",
	    "visits": 1122
	  }, {
	    "country": "France",
	    "visits": 1114
	  }, {
	    "country": "India",
	    "visits": 984
	  }, {
	    "country": "Spain",
	    "visits": 711
	  }, {
	    "country": "Netherlands",
	    "visits": 665
	  }, {
	    "country": "Russia",
	    "visits": 580
	  }, {
	    "country": "South Korea",
	    "visits": 443
	  }, {
	    "country": "Canada",
	    "visits": 441
	  }, {
	    "country": "Brazil",
	    "visits": 395
	  } ],
	  "valueAxes": [ {
	    "gridColor": "#FFFFFF",
	    "gridAlpha": 0.2,
	    "dashLength": 0
	  } ],
	  "gridAboveGraphs": true,
	  "startDuration": 1,
	  "graphs": [ {
	    "balloonText": "[[category]]: <b>[[value]]</b>",
	    "fillAlphas": 0.8,
	    "lineAlpha": 0.2,
	    "type": "column",
	    "valueField": "visits"
	  } ],
	  "chartCursor": {
	    "categoryBalloonEnabled": false,
	    "cursorAlpha": 0,
	    "zoomable": false
	  },
	  "categoryField": "country",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "gridAlpha": 0,
	    "tickPosition": "start",
	    "tickLength": 20
	  },
	  "export": {
	    "enabled": true
	  }

	} );
</script>
<style>
body {
	font-family: arial
}
</style>
</head>
<body style="text-align: center">
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
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<div class="row"><br><br>	<br><br>
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
			<input name="date_start" type="date" class="search-query" onchange="Javascript:dateTime(date_start);"	placeholder="yyyy-mm-dd" required="required" style="width:100%;"/> 
		</div>
		<div class="col-sm-3">
			<input name="date_end" type="date" class="search-query" onchange="Javascript:dateTime(date_end);"	placeholder="yyyy-mm-dd" required="required" style="width:100%;"/> 
		</div>
		<div class="col-sm-2">
			<input type="submit" class="btn btn-info" value="ออกรายงาน" />
		</div>
		</form>
			<br><br><br>
			
  
      			
	</div>
	<div class="col-sm-12" align="center">
	<div class="col-sm-12">
	  <div id="chartdiv"></div>	
	</div>
</div>
  <script src="jquery-1.10.2.min.js"></script>
	
		
</body>
</html>