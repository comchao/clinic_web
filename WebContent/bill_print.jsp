<%@page import="dao.TreatmentDrugDAO"%>
<%@page import="model.TreatmentDrugBean"%>
<%@page import="dao.TreatmentDao"%>
<%@page import="model.TreatmentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ใบเสร็จรับเงิน/ใบกำกับภาษี</title>

<!-- เรียกใช้งาน bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- เรียกใช้งาน CSS  -->
<link href="css/freelancer.css" rel="stylesheet">

<!-- กำหนดฟอร์น -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
</head>
<body>

		
	<div class="container">
	
	<%
	if(request.getParameter("tm_id") == null){
		
		response.sendRedirect("LogoutServlet");
		
	}else{
		
		int tm_id = Integer.parseInt(request.getParameter("tm_id"));
		ArrayList<TreatmentDrugBean> tmDrugBean = new ArrayList<TreatmentDrugBean>();
		tmDrugBean = TreatmentDrugDAO.queryForPrint(tm_id);
		

		
	%>
	<div class="col-md-12">
		<div class="col-md-4" align="center"></div>
		<div class="col-md-4" align="center"><br><br><img class="img-responsive" width="150px" height="150px" src="img/profile.png" alt="วัฒนา รักษาสัตว์"><h4>ใบเสร็จรับเงิน</h4><h3>วัฒนา รักษาสัตว์ อุตรดิตถ์ </h3></div>
		<div class="col-md-4" align="center"></div>
	</div>
	<div class="col-md-12">
		<div class="col-md-4" align="left">
			<h5>เวลาทำการ 9.00-20.00  น.<br>
			ถ.ศรีอุตรานอก <br>
			เทศบาลเมืองอุตรดิตถ์ <br>
			53000 <br> 
			เบอร์โทร : 088 865 6185
			</h5>
		</div>
		<div class="col-md-4" align="center"></div>
		<div class="col-md-4" align="left"> 
			<h5>เลขที่ใบเสร็จ: <%=tm_id %> <br>ชื่อลูกค้า:<%=new String(request.getParameter("owner_name").getBytes("ISO8859_1"), "UTF8") %> <br>วันที่ออกบิล :<span name="date_now"></span></h5>
		 </div>
	</div>
		<table class="table table-bordered" style="width: 100%;">
		
		
		
			
			<tr>
				<th class="text-center">ลำดับ</th>
				<th class="text-center">รายการ</th>
				<th class="text-center">จำนวน</th>
				<th class="text-center">ราคารวม</th>
			</tr>
			<% 
			double total_price = 0.00;
			int i = 0;
			for (TreatmentDrugBean tmd : tmDrugBean) {
			%>
			<tr>
				<td class="text-center"><%=++i %></td>
				<td class="text-left"><%=tmd.getRefer_drug_id().getDrug_name() %></td>
				<td class="text-right"><%=tmd.getDrug_qty() %></td>
				<td class="text-right"><%=tmd.getDrug_sumprice() %></td>
			</tr>
			<%
			total_price += tmd.getDrug_sumprice();
			}
			%>
			<tr>
				<td colspan="3" class="text-right"><strong>รวมทั้งหมด </strong></td>
				<td class="text-right"><font color="red"><%=total_price %></font></td>
			</tr>
			<tr>
				<td colspan="3" class="text-right"><strong>ชำระเงิน</strong></td>
				<td class="text-right">
					<form action="TreatmentUpdatePaymentServlet" method="post">
						<input type="hidden" name="tm_id" value="<%=tm_id %>" />
						<button type="submit" class="btn btn-success" onClick="JavaScript:window.print();">
							ชำระเงินเรียบร้อย
						</button>
					</form>
				</td>
			</tr>
		</table>
	<div class="col-md-12">
	<div class="col-md-4" align="right"><br><h5>ผู้รับเงิน............................................................</h5></div>
	<div class="col-md-4" ></div>
	<div class="col-md-4" align="right"><br><h5>วันที่รับเงิน...................................................</h5><br></div>
	</div>
		
	<%
	}
	%>
	</div>
			
	<script src="jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			
			var fullDate = new Date()
			var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
			 
			var currentDate = fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
			
			$("span[name='date_now']").text(currentDate);
			
		});
		
	</script>
</body>
</html>