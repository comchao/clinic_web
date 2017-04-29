<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header_index.jsp"%>
 <%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.ShopDetailBean"%>
<%@page import="model.json"%> 
<%@page import="org.json.simple.JSONArray"%>
<!-- Styles -->
<style>
#chartdiv1 {
  width: 100%;
  height: 500px;
}

#chartdiv {
  width: 50%;
  height: 600px;
  font-size: 14px;
}
#chartdiv3 {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}	

.amcharts-pie-slice {
  transform: scale(1);
  transform-origin: 50% 50%;
  transition-duration: 0.3s;
  transition: all .3s ease-out;
  -webkit-transition: all .3s ease-out;
  -moz-transition: all .3s ease-out;
  -o-transition: all .3s ease-out;
  cursor: pointer;
  box-shadow: 0 0 30px 0 #000;
}

.amcharts-pie-slice:hover {
  transform: scale(1.1);
  filter: url(#shadow);
}							
</style>


<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
 <link href="PiechartProduc.css" rel="stylesheet" type="text/css" />															

<!-- Chart code -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" /> -->
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<link href="css.css" rel="stylesheet" type="text/css" />
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>	
</head>
<body>
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
	<a href="chart_all.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>

	
</div>
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
		<h4>อันดับ</h4>
		</div>
		<div class="col-sm-2"  >
		
		</div>
	</div>
	
	<div class="col-sm-12" align="center">
	
		<form action="ChartServlet" method="get">
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
		<div class="col-sm-2">
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
		</div>
		
	
		
		<div class="col-sm-2" >

			<input type="submit" class="btn btn-info" value="ค้นหา" />
		</div>
		
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
		<h4>ลำดับ</h4>
		</div>
		<div class="col-sm-2"  >
		
		</div>
	</div>
	
	<div class="col-sm-12" align="center">
	
		<form action="ChartServlet" method="get">
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
		<div class="col-sm-2">
			<select name="ON" id="report_id" class="form-control"
				required="required" style="width:100%;">
				<option value="" >--โปรดเลือก--</option>
				<option value="3"> 3 </option>
				<option value="5"> 5 </option>
				<option value="10"> 10</option>
			</select>
		</div>
		
	
		
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



<!-- ส่วนของ  chartdiv -->
<div class="col-sm-12" align="center">



<%if(produc_month!=null){

if(produc_month.equals("01")){ %>
	<h4>สินค้าขายดี ประจำเดือน  มกราคม  ปี    <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("02")){ %>
	<h4>สินค้าขายดี ประจำเดือน  กุมภาพันธ์  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("03")){ %>
	<h4>สินค้าขายดี ประจำเดือน  มีนาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("04")){ %>
	<h4>สินค้าขายดี ประจำเดือน  เมษายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("05")){ %>
	<h4>สินค้าขายดี ประจำเดือน  พฤษภาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("06")){ %>
	<h4>สินค้าขายดี ประจำเดือน มิถุนายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("07")){ %>
	<h4>สินค้าขายดี ประจำเดือน  กรกฎาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("08")){ %>
	<h4>สินค้าขายดี ประจำเดือน สิงหาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("09")){ %>
	<h4>สินค้าขายดี ประจำเดือน  กันยายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("10")){ %>
	<h4>สินค้าขายดี ประจำเดือน  ตุลาคม  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("11")){ %>
	<h4>สินค้าขายดี ประจำเดือน  พฤศจิกายน  ปี  <%= produc_year%> </h4>
	
	
<% } %>
<%if(produc_month.equals("12")){ %>
	<h4>สินค้าขายดี ประจำเดือน ธันวาคม  ปี  <%= produc_year%> </h4>
	<%} %>
	

	<div class="col-sm-8">
	<h4>กลุ่มรายได้จากการขายสินค้า</h4>
	<div id="chartdiv1"></div>
	

 	
	
	</div>
<!-- ส่วนของ  chartdiv -->
	
<!--ตารางข้อมูล-->

<div class="col-sm-4">
<h4>ข้อมูลการขายสินค้า</h4>

<!--ตารางข้อมูล-->
<div class="table-responsive">
 <table class="table table-striped">
<thead>
<center><tr>
<th>ลำดับ</th>
<th>รายการ</th>
<th>จำนวน</th>

</tr></center>
</thead>

<tbody>
<% } %>
<!-- ส่วนของ  chartdiv -->
<script type="text/javascript">
var chart = AmCharts.makeChart("chartdiv", {
	  "type": "pie",
	  "startDuration": 0,
	   "theme": "light",
	  "addClassNames": true,
	  "legend":{
	   	"position":"right",
	    "marginRight":100,
	    "autoMargins":false
	  },
	  "innerRadius": "30%",
	  "defs": {
	    "filter": [{
	      "id": "shadow",
	      "width": "200%",
	      "height": "400%",
	      "feOffset": {
	        "result": "offOut",
	        "in": "SourceAlpha",
	        "dx": 0,
	        "dy": 0
	      },
	      "feGaussianBlur": {
	        "result": "blurOut",
	        "in": "offOut",
	        "stdDeviation": 5
	      },
	      "feBlend": {
	        "in": "SourceGraphic",
	        "in2": "blurOut",
	        "mode": "normal"
	      }
	    }]
	  }
	  <%if(chart_id!=null){ 
			
			ProductDAO dao = new ProductDAO();  
			List<ShopDetailBean> list = dao.ShopDetail(produc_month,produc_year,ON);
			response.setCharacterEncoding("utf-8");
			JSONArray ja = new JSONArray();

			for(int i=0;i<list.size();i++){
			ShopDetailBean bean = list.get(i);
			 ja.add(new json(bean.getLitres(),bean.getCountry()));

			 %>,
	  "dataProvider": <%}%>,
	  "valueField": "litres",
	  "titleField": "country",
	  "export": {
	    "enabled": true
	  }
	});

	chart.addListener("init", handleInit);

	chart.addListener("rollOverSlice", function(e) {
	  handleRollOver(e);
	});

	function handleInit(){
	  chart.legend.addListener("rollOverItem", handleRollOver);
	}

	function handleRollOver(e){
	  var wedge = e.dataItem.wedge.node;
	  wedge.parentNode.appendChild(wedge);
	}



</script>
<!-- ส่วนของ  chartdiv -->

  <%if(chart_id!=null){ 
			
			ProductDAO dao2 = new ProductDAO();  
			List<ShopDetailBean> list2 = dao2.ShopDetail(produc_month,produc_year,ON );
			response.setCharacterEncoding("utf-8");
		

			for(int i2=0;i2<list.size();i2++){
			ShopDetailBean bean2 = list2.get(i2);
		

			 %>
	
<tr>
 <td><%=i2+1%></h6></td>
<td><%=bean2.getCountry()%></td>
<td> <%=bean2.getPrd_qty()%></td>

</tr>


	<% 
	
	 
%>




<% }}}%>

</tbody>
</table>
</div></div></div>

<!-- Chart code -->
<script>
var chart = AmCharts.makeChart( "chartdiv1", {
  "type": "pie",
  "theme": "light"
  <%if(chart_id!=null){ 
		
		ProductDAO dao = new ProductDAO();  
		List<ShopDetailBean> list = dao.ShopDetail(produc_month,produc_year,ON );
		response.setCharacterEncoding("utf-8");
		JSONArray ja = new JSONArray();

		for(int i=0;i<list.size();i++){
		ShopDetailBean bean = list.get(i);
		 ja.add(new json(bean.getLitres(),bean.getCountry()));

		 %>,
  "dataProvider": <%out.println(ja);%><%}%>,
  "valueField": "litres",
  "titleField": "country",
   "balloon":{
   "fixedPosition":true
  },
  "export": {
    "enabled": true
  }
} );
</script>

<%} %>
<br><br>

  
	<div id="chartdiv"></div>
</body>
<!-- Chart code -->



<br>
