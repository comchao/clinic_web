<%@page import="model.ShopDetailBean"%>
<%@page import="dao.DepositDAO"%>
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
	<script>
function checkCal() {
	
	var prd_total = parseFloat(document.billPledge.prd_total.value);
	var cage_total = parseFloat(document.billPledge.cage_total.value);
	var receive = parseFloat(document.billPledge.receive.value);
	
	document.billPledge.totalPrice.value = prd_total+cage_total-receive;
}
</script>
</head>

<body  onload="Javascript:checkCal();" >

		
	<div class="container">
	<form name="billPledge" action="UpdateStatusPetDepositServlet" method="post">
	<%
	if(request.getParameter("deposit_id") == null){
		
		response.sendRedirect("LogoutServlet");
		
	}else{
		
		int deposit_id = Integer.parseInt(request.getParameter("deposit_id"));
		ArrayList<ShopDetailBean> depoBean = new ArrayList<ShopDetailBean>();
		depoBean = DepositDAO.queryForPrint(deposit_id);
		
		

		
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
			<h5>เลขที่ใบเสร็จ: <%=deposit_id %> <br>ชื่อลูกค้า: <%=new String(request.getParameter("own_name").getBytes("ISO8859_1"), "UTF8") %><br>วันที่ออกบิล :<span name="date_now"></span></h5>
		 </div>
	</div>
		<table class="table table-bordered" style="width: 100%;">
			<tr>
				<th class="text-center">ลำดับ</th>
				<th class="text-center">วันที่ทำรายการ</th>
				<th class="text-center">รายการ</th>
				<th class="text-center">จำนวน</th>
				<th class="text-center">ราคารวม</th>
			</tr>
			<% 
			double total_price = 0.00;
			int i = 0;
			for (ShopDetailBean dpb : depoBean) {
			%>
			<tr>
				<td class="text-center"><%=++i %></td>
				<td class="text-left">0<%=dpb.getPrd_date()%></td>
				<td class="text-left"><%=dpb.getPrd_name()%></td>
				<td class="text-right"><%=dpb.getPrd_qty() %></td>
				<td class="text-right"><%=dpb.getPrd_total() %></td>
			</tr>
			<%
			total_price += dpb.getPrd_total();
			}
			%>
			<tr>
				<td class="text-center"><%=++i %></td>
				<td class="text-left"><%=request.getParameter("deposit_datein") %></td>
				<td class="text-left">ราคากรง</td>
				<td class="text-right"><%=request.getParameter("d_day") %>x<%=request.getParameter("c_price") %></td>
				<td class="text-right"><%=request.getParameter("c_total") %><input type="hidden" id="cage_total" value="<%=request.getParameter("c_total") %>"></td>
			</tr>
			<tr>
				<td class="text-center"><%=++i %></td>
				<td class="text-left"><%=request.getParameter("deposit_datein") %></td>
				<td class="text-left">ค่ามัดจำ</td>
				<td class="text-right"><h5 style="color:red;">-<%=request.getParameter("d_receive") %></h5></td>
				<td class="text-right"><h5 style="color:red;">-<%=request.getParameter("d_receive") %></h5><input type="hidden" id="receive" value="<%=request.getParameter("d_receive") %>"></td>
				
			</tr>
			<tr>
				<td colspan="4" class="text-right" ><strong>ค่าใช้จ่าย</strong></td>
				<td class="text-right"><input type="text" id="totalPrice" value="" style="color:red;border:0px;text-align:right;"><input type="hidden" id="prd_total" value="<%=total_price %>"></td>
			</tr>
			<tr>
				<td colspan="4" class="text-right"><strong>ชำระเงิน</strong></td>
				<td class="text-right">
						<input type="hidden" name="cage_id" value="<%=request.getParameter("cg_id") %>" />
						<input type="hidden" name="deposit_id" value="<%=deposit_id %>" />
						<button type="submit" class="btn btn-success" onClick="JavaScript:window.print();">
							ชำระเงินเรียบร้อย
						</button>
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
	</form>
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