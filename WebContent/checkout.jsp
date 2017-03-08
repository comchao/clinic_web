<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@page import="dao.ProductDAO,model.CalendarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>ออกบิลใบเสร็จ</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.shop.js"></script>
<script src="js/petshop-script.js" type="text/javascript" charset="utf-8"></script>
<script>
		$(document).ready(function() {
			
			var fullDate = new Date()
			var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
			 
			var currentDate =  fullDate.getFullYear()+ "-" + twoDigitMonth + "-" + fullDate.getDate();
			
			$("span[name='date_now']").text(currentDate);
			document.frmProduct.datenow.value = currentDate;
		});
		
	</script>

</head>

<script type="text/javascript">
function doCalSum(Record, Qty ,Price){
var Sum;
Sum =  parseFloat(Qty) - parseFloat(Price) ;
document.getElementById("hdnSum" + Record).value = Sum.toFixed(2);
document.getElementById("spnSum" + Record).innerHTML = Sum.toFixed(2);
doCalTotal();
}

function doCalTotal(){
var Record = document.getElementById("hdnCount").value;
var Total = 0;
for(i=1;i<=Record;i++){
Total += parseFloat(document.getElementById("hdnSum" + i).value);
}
document.getElementById("spnTotal").innerHTML = Total.toFixed(2);
}
function digitsOnly(obj){
var regExp = /[0-9]$/;
if(!regExp.test(obj.value)){
obj.value = obj.value.substring(0, obj.value.length -1);
return false;
}
}
</script>
</head>


<body id="checkout-page">

<div id="site">
	<header id="masthead">
		<h1>รายการสินค้า</h1>
	</header>
	<form name="frmProduct" method="POST"  action="InsertProductHisServlet">	
	 <input type='hidden' name='datenow' value='"datenow"'>
	<div id="content">
		

			<table id="checkout-cart" class="shopping-cart">
			  <thead>
				<tr>
					<th scope="col">รายการ</th>
					<th scope="col">จำนวน</th>
					<th scope="col">ราคา/ชิ้น</th>
					<th scope="col">รวม</th>
				</tr>
			  </thead>
			  <tbody>
			  
			  </tbody>
			</table>
		 <div id="pricing">
			
			<p id="sub-total">
				<strong>รวมเป็นเงิน</strong>: <span id="stotal" ></span>
			</p>
			<p align="right">
				<strong>รับเงิน</strong>: <input type="text" name="txtQty1" id="txtQty1" > 
				
				
				
				
				
				
			</p>
			<p align="right">
				<strong>เงินทอน</strong>: <span id="">0.0</span>
			</p>
				<p align="right">
			
					<input type="submit" name="empty-cart" id="empty-cart"	value="ชำระเงิน" 	class="btn btn-primary"  />
				</p>
		 </div>
		 
	</div>
	<div class="col-sm-12">
		<div class="form-group" style="text-align: center">
		
		<script type="text/javascript">
			$(function(){
				$('tr').not(':first').each(function() {
					var currentElement = $(this);
					
					var pname = currentElement.find(".pname").text();
					var pqty = currentElement.find(".pqty").text();
					var pprice = currentElement.find(".pprice").text();
					var totalpprice = currentElement.find(".totalpprice").text();
					
					var addInput = $(" <input type='hidden' name='pname[]' value='"+pname+"'> "+
								" <input type='hidden' name='pqty[]' value='"+pqty+"'> " +
								" <input type='hidden' name='pprice[]' value='"+pprice+"'> " +
								" <input type='hidden' name='totalpprice[]' value='"+totalpprice+"'> ");
					
					$(this).append(addInput);
				});
			});
			</script>
			<div style="bottom:0px; width:1000px; margin:0px auto;">
			<ul id="shopping-cart-actions" >
				<li>
					<a href="petshop_view.jsp" class="btn">เลือกสินค้าเพิ่ม</a>
				</li>
			
			</ul>
			
			
		</div>
	</div>
	</form>

</div>


</body>
</html>	
<%@ include file="footer_index.jsp"%>