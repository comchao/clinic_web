<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- เรียกใช้งาน bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- เรียกใช้งาน CSS  -->
<link href="css/freelancer.css" rel="stylesheet">

<!-- กำหนดฟอร์น -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
</head>
<body onload="window.print();">
<div class="col-md-3" align="center"><img class="img-responsive" width="100px" height="100px" src="img/profile.png" alt="วัฒนา รักษาสัตว์"></div>
	<div class="col-md-12">
	<div class="col-md-3" align="left" style="position:fixed;bottom:85%;width:1000px;margin:0px auto;">วันที่ออกบิล :<span name="date_now"></span></div>
	<div class="col-md-3" align="center" >วัฒนา รักษาสัตว์ อุตรดิตถ์ <br> ถ.ศรีอุตรานอก เทศบาลเมืองอุตรดิตถ์ 53000 </div>
	<div class="col-md-3" align="right">เบอร์โทร : 088 865 6185</div>
	</div>
	<table class="table table-bordered" style="width: 100%;">
	
		
		
		<tr>
			<th class="text-center">ลำดับ</th>
			<th class="text-center">รายการ</th>
			<th class="text-center">ราคา/หน่วย</th>
			<th class="text-center">จำนวน</th>
			<th class="text-center">ราคารวม</th>
		</tr>
		<%
		int count = Integer.parseInt(request.getParameter("QtyItem"));
		double price = 0.00, total_price = 0.00, price_sum = 0.00;
		int itemQty = 0;
		
		for(int i = 1; i <= count; i++){
			String item_name = new String (request.getParameter("item_name_"+i).getBytes ("iso-8859-1"), "UTF-8");
			itemQty = Integer.parseInt(request.getParameter("quantity_"+i));
			price = Double.parseDouble(request.getParameter("amount_"+i));
			
			price_sum = (double)price*itemQty;
		%>
		<tr>
			<td class="text-center"><%=i %></td>
			<td class="text-left"><%=item_name %></td>
			<td class="text-right"><%=price %></td>
			<td class="text-right"><%=itemQty %></td>
			<td class="text-right"><%=price_sum %></td>
		</tr>
		<%
		total_price += price_sum;
		}
		%>
		<tr>
			<td colspan="4" class="text-right"><strong>รวมทั้งหมด </strong></td>
			<td class="text-right"><font color="red"><%=total_price %></font></td>
		</tr>
	</table>
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