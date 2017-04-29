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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta content='width=device-width, initial-scale=1' name='viewport' />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"
	type="text/javascript"></script>
<script src="ajaxGetPost.js" type="text/javascript"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	function charts(data, ChartType) {
		var c = ChartType;
		var jsonData = data;
		google.load("visualization", "1", {
			packages : [ "corechart" ],
			callback : drawVisualization
		});
		function drawVisualization() {
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Country');
			data.addColumn('number', 'Population Density');
			$.each(jsonData, function(i, jsonData) {
				var value = jsonData.value;
				var name = jsonData.name;
				data.addRows([ [ name, value ] ]);
			});

			var options = {
				title : "",
				colorAxis : {
					colors : [ '#54C492', '#cc0000' ]
				},
				datalessRegionColor : '#dedede',
				defaultColor : '#dedede'
			};

			var chart;
			if (c == "ColumnChart")
				chart = new google.visualization.ColumnChart(document
						.getElementById('chart_div'));
			else if (c == "PieChart")
				chart = new google.visualization.PieChart(document
						.getElementById('piechart_div'));
			else if (c == "BarChart")
				chart = new google.visualization.BarChart(document
						.getElementById('bar_div'));
			else if (c == "GeoChart")
				chart = new google.visualization.GeoChart(document
						.getElementById('regions_div'));
			
		
			

			chart.draw(data, options);
		}
	}

	$(document).ready(function() {
		url = 'PiechartProduc.jsp';
		ajax_data('GET', url, function(data) {
			charts(data, "ColumnChart");
			charts(data, "PieChart");
			charts(data, "BarChart");
			charts(data, "GeoChart");
			
			
		});
	});
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
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3">
			<select name="report_id" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="1" selected="selected">สถิติการขายสินค้า</option>
				<option value="2">สถิติค่ายา/</option>
				<option value="3">สถิติค่ารักษา</option>
	
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
  <script src="jquery-1.10.2.min.js"></script>
	<h2>กลุ่มสินค้าขายดีภายในคลินิก</h2>


	<div id="piechart_div" style="width: 1300; height: 500px;"></div>
	
	

<%@ include file="footer_index.jsp"%>

</body>
</html>