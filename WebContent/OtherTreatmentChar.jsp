<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header_index.jsp"%>
 <%@page import="dao.TreatmentDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.OtherTreatment"%>
<%@page import="model.CharShopDetailjson"%> 
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="java.util.*" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta content='width=device-width, initial-scale=1' name='viewport' />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"
	type="text/javascript"></script>
<script src="ajaxGetPost.js" type="text/javascript"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Styles -->
<style>
#chartdiv {
  width: 400px;
  height: 400px;
}

.amcharts-export-menu-top-right {
  top: 10px;
  right: 0;
}			
#chartdiv {
	width		: 400px;
	height		: 400px;
	font-size	: 11px;
}		
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
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
<br><br>
<div class="container">
<!-- <div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div> -->
	<div class="row">
		<h3 align="center"></h3>
		<br />
	</div>
	<br>
	
	<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String chart_id = (String)request.getAttribute("chart_id");


String produc_month = (String)request.getAttribute("produc_month"); //จากวันที่ 
                        //จากวันที่ 


String produc_year = (String)request.getAttribute("produc_year");    // ถึงวันที่ 
                         // ถึงวันที่ 
                         
String ON = (String)request.getAttribute("ON");    // ลำดับ





%>
<%if(produc_month!=null){%>
	<div class="col-sm-12" align="center">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3" align="center" >
			<h4>กรุณาเลือกรายการ</h4>
		</div>
		<div class="col-sm-3" >
			<h4>เดือน</h4>
		</div>
		<div class="col-sm-2" align="left" >
			<h4>ปี</h4>
		</div>
		<div class="col-sm-2" align="left" >
		<!-- <h4>อันดับ</h4> -->
		</div>
		<div class="col-sm-2"  >
		
		</div>
	</div>
	
	<div class="col-sm-12" align="center">
	
		<form action="ShopDetailcharServlet" method="get">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3">
			<select name="chart_id" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<%if(chart_id.equals("1")){ %>
				<option value="<%=chart_id%>" >สถิติการขายสินค้า</option>
				<option value="2">สถิติค่ายา</option>
				<option value="3">สถิติค่ารักษา</option>
			    <%} %>
			    	<%if(chart_id.equals("2")){ %>
				<option value="<%=chart_id%>" >สถิติค่ายา</option>
				<option value="1" >สถิติการขายสินค้า</option>
				<option value="3">สถิติค่ารักษา</option>
			    <%} %>
			    	<%if(chart_id.equals("3")){ %>
				<option value="<%=chart_id%>" >สถิติค่ารักษา</option>
				<option value="1" >สถิติการขายสินค้า</option>
				<option value="2">สถิติค่ายา</option>
				
			    <%} %>
			   
				
			</select>
		</div>
		<div class="col-sm-2">
			<select name="produc_month" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<%if(produc_month.equals("01")){ %>
				<option value="<%=produc_month%>" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("02")){ %>
				<option value="<%=produc_month%>" >กุมภาพันธ์</option>
				<option value="01" >มกราคม</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("03")){ %>
				<option value="<%=produc_month%>" >มีนาคม</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("04")){ %>
				<option value="<%=produc_month%>" >เมษายน</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("05")){ %>
				<option value="<%=produc_month%>" >พฤษภาคม</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("06")){ %>
				<option value="<%=produc_month%>" >มิถุนายน</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("07")){ %>
				<option value="<%=produc_month%>" >กรกฎาคม</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
			
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("08")){ %>
				<option value="<%=produc_month%>" >สิงหาคม</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
			
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("09")){ %>
				<option value="<%=produc_month%>" >กันยายน</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
			    <option value="08"> สิงหาคม </option>
				
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("10")){ %>
				<option value="<%=produc_month%>" >ตุลาคม</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
			
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("11")){ %>
				<option value="<%=produc_month%>" >พฤศจิกายน</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				
				<option value="12"> ธันวาคม</option>
				<%} %>
				<%if(produc_month.equals("12")){ %>
				<option value="<%=produc_month%>" >ธันวาคม</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
		
				<%} %>
				
			</select>
		</div>
		<div class="col-sm-2">
			<select name="produc_year" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<%if(produc_year.equals("2017")){ %>
				<option value="<%=produc_year%>" >2017</option>
				
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2018")){ %>
				<option value="<%=produc_year%>" >2018</option>
			    <option value="2017"> 2017</option>
				
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2019")){ %>
				<option value="<%=produc_year%>" >2019</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
			
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
				<%if(produc_year.equals("2020")){ %>
				<option value="<%=produc_year%>" >2020</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2021")){ %>
				<option value="<%=produc_year%>" >2021</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2022")){ %>
				<option value="<%=produc_year%>" >2022</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2023")){ %>
				<option value="<%=produc_year%>" >2023</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2024")){ %>
				<option value="<%=produc_year%>" >2024</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2025")){ %>
				<option value="<%=produc_year%>" >2025</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			<%} %>
				<%if(produc_year.equals("2026")){ %>
				<option value="<%=produc_year%>" >2026</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    
			    <option value="2027"> 2027</option>
				
			<%} %>
			<%if(produc_year.equals("2027")){ %>
				<option value="<%=produc_year%>" >2027</option>
			    <option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			   
				
			<%} %>
			</select>
		</div>
		<%-- <div class="col-sm-2">
			<select name="ON" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<%if(ON.equals("3")){ %>
				<option value="<%=ON%>" >3</option>
				
				<option value="5"> 5 </option>
				<option value="10"> 10</option>
				<% }%>
				<%if(ON.equals("5")){ %>
				<option value="<%=ON%>" >5</option>
				<option value="3"> 3 </option>
				
				<option value="10"> 10</option>
				<% }%>
				<%if(ON.equals("10")){ %>
				<option value="<%=ON%>" >10</option>
				<option value="3"> 3 </option>
				<option value="5"> 5 </option>
				
				<% }%>
				
				
			</select>
		</div> --%>
		<!-- ค่าอันดับ -->
		<input name="ON" type="hidden" value="5">
		
		
	
		
		<div class="col-sm-2" >

			<input type="submit" class="btn btn-info" value="ค้นหา" />
		</div>
		</form>
		
		<% } else{%>
		<div class="col-sm-12" align="center">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3" align="center" >
			<h4>กรุณาเลือกรายการ</h4>
		</div>
		<div class="col-sm-3" >
			<h4>เดือน</h4>
		</div>
		<div class="col-sm-2" align="left" >
			<h4>ปี</h4>
		</div>
		<div class="col-sm-2" align="left" >
		<!-- <h4>ลำดับ</h4> -->
		</div>
		<div class="col-sm-2"  >
		
		</div>
	</div>
	
	<div class="col-sm-12" align="center">
	
		<form action="ShopDetailcharServlet" method="get">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-3">
			<select name="chart_id" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="" >--โปรดเลือกรายการ--</option>
				<option value="1" >สถิติการขายสินค้า</option>
				<option value="2">สถิติค่ายา</option>
				<option value="3">สถิติค่ารักษา</option>
			</select>
		</div>
		<div class="col-sm-2">
			<select name="produc_month" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="" >--โปรดเลือก--</option>
				<option value="01" >มกราคม</option>
				<option value="02">กุมภาพันธ์</option>
				<option value="03">มีนาคม</option>
				<option value="04" > เมษายน</option>
				<option value="05"> พฤษภาคม </option>
				<option value="06"> มิถุนายน </option>
				<option value="07" > กรกฎาคม  </option>
				<option value="08"> สิงหาคม </option>
				<option value="09"> กันยายน </option>
				<option value="10" > ตุลาคม </option>
				<option value="11"> พฤศจิกายน </option>
				<option value="12"> ธันวาคม</option>
			</select>
		</div>
		<div class="col-sm-2">
			<select name="produc_year" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="" >--โปรดเลือก--</option>
				<option value="2017"> 2017</option>
				<option value="2018"> 2018</option>
				<option value="2019"> 2019</option>
				<option value="2020"> 2020</option>
				<option value="2021"> 2021</option>
				<option value="2022"> 2022</option>
				<option value="2023"> 2023</option>
				<option value="2024"> 2024</option>
				<option value="2025"> 2025</option>
			    <option value="2026"> 2026</option>
			    <option value="2027"> 2027</option>
				
			
			</select>
		</div>
		<!-- <div class="col-sm-2">
			<select name="ON" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="" >--โปรดเลือก--</option>
				<option value="3"> 3 </option>
				<option value="5"> 5 </option>
				<option value="10"> 10</option>
			</select>
		</div> -->
		
		<!-- ค่าอันดับ -->
		<input name="ON" type="hidden" value="5">
		
		
	
		
		<div class="col-sm-2" >

			<input type="submit" class="btn btn-info" value="ค้นหา" />
		</div>
		<%} %>
			</form>
		<div class="row">
	<div class="col-sm-8">
			
		</div>
	
		
		
	</div>
	</div>
	
	
	
</div>
		<div class="col-sm-12" align="center">
		
<%if(produc_month!=null){
	%><h4>รายได้จากค่ารักษา</h4><% 
if(produc_month.equals("01")){ %>
	<h4>ค่ารักษา ประจำเดือน  มกราคม  ปี    <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("02")){ %>
	<h4>ค่ารักษา  ประจำเดือน  กุมภาพันธ์  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("03")){ %>
	<h4>ค่ารักษา  ประจำเดือน  มีนาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("04")){ %>
	<h4>ค่ารักษา  ประจำเดือน  เมษายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("05")){ %>
	<h4>ค่ารักษา  ประจำเดือน  พฤษภาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("06")){ %>
	<h4>ค่ารักษา  ประจำเดือน  มิถุนายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("07")){ %>
	<h4>ค่ารักษา  ประจำเดือน  กรกฎาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("08")){ %>
	<h4>ค่ารักษา  ประจำเดือน  สิงหาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("09")){ %>
	<h4>ค่ารักษา  ประจำเดือน กันยายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("10")){ %>
	<h4>ค่ารักษา  ประจำเดือน  ตุลาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("11")){ %>
	<h4>ค่ารักษา  ประจำเดือน  พฤศจิกายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("12")){ %>
	<h4>ค่ารักษา  ประจำเดือน  ธันวาคม  ปี  <%= produc_year%> </h4>
	
	
<% }} %>
<br>
<%if(chart_id!=null){ %>
	
		
		<!-- HTML -->
<div id="chartdiv"></div>
		<%} %>
	<div class="col-sm-12">
	
		<!--    ส่วนของกราฟแท่งสี -->
	</div>

</div>
<br>
<div class="col-sm-2">
</div>

<div class="col-sm-8">

 <%if(chart_id!=null){ %>
<!--ตารางข้อมูล-->
<div class="table-responsive">
<h4>ข้อมูลค่ารักษา</h4>
 <table class="table table-striped">
<thead>
<tr>

 
	  <th>ลำดับ</th>
	  <th>รายการ</th>
	  <th>จำนวน</th>
	  <th>ยอด</th>
	  </tr>
	  </thead>

	  <tbody>

			<%TreatmentDao dao = new TreatmentDao();  
			List<OtherTreatment> list = dao.OtherTreatmentChar(produc_month,produc_year,ON);
			response.setCharacterEncoding("utf-8");
			JSONArray ja = new JSONArray();


			for(int i=0;i<list.size();i++){
			OtherTreatment bean = list.get(i);
			ja.add(new CharShopDetailjson(bean.getCountry() , bean.getVisits()));
			 %>
	
<tr>
 <td><%=i+1%></td>
<td><%=bean.getCountry()%></td>
<td> <%=bean.getOtherUnit()%></td>
<td><%=bean.getVisits()%></td> 
</tr>
<script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "serial",
  "theme": "light",
  "dataProvider":<%out.println(ja);%>,
  "valueAxes": [{
	    "axisAlpha": 0,
	    "position": "left",
	    "title": "Visitors from country"
	  }],
	  "startDuration": 1,
	  "graphs": [{
	    "balloonText": "<b>[[category]]: [[value]]</b>",
	    "fillColorsField": "color",
	    "fillAlphas": 0.9,
	    "lineAlpha": 0.2,
	    "type": "column",
	    "valueField": "visits"
	  }],
	  "chartCursor": {
	    "categoryBalloonEnabled": false,
	    "cursorAlpha": 0,
	    "zoomable": false
	  },
	  "categoryField": "country",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "labelRotation": 45
	  },
	  "export": {
	    "enabled": true
	  }

	});
	</script>

  <% }}%>








</tbody>
</table>

  
	
	

 

</div>
</div>
<!-- Chart code -->



   <script type="text/javascript" src="canvasjs.min.js"></script>
  
<!--    ส่วนของกราฟแท่งสี -->
  

  
  
 
   
   </div>
<!--สินสุด ส่วนของกราฟแท่งสี -->

	




</body>
</html>