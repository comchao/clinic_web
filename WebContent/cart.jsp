 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header_shop.jsp" %>

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

<body>

<div id="site">
	<header id="masthead">
		<h1>รายการสินค้า</h1>
	</header>
	<div id="content">
		<form id="shopping-cart" action="checkout.jsp" method="post">
			<table class="shopping-cart">
			  <thead>
				<tr>
					<th scope="col">รายการ</th>
					<th scope="col">จำนวน</th>
					<th scope="col">ราคา/ชิ้น</th>
					<th scope="col">รวมราคา</th>
					<th scope="col">ลบรายการ</th>
				</tr>
			  </thead>
			  <tbody>
			  </tbody>
			</table>
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
						<p id="sub-total"><strong>รวมราคา</strong></p>
				</div>
				<div class="col-sm-2">
						<p id="sub-total"><span id="stotal"></p></span>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
						<p id="sub-total"><strong>ชำระเงิน</strong></p>
				</div>
				<div class="col-sm-2">
						<p id="sub-total"><input type="text" name="txtQty1" id="txtQty1" style="text-align:right;width:100%" required="required" value="" onkeyup="digitsOnly(this);doCalSum(1, this.value ,document.getElementById('stotal').innerHTML)"/></p></span>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
						<p id="sub-total"><strong>เงินทอน</strong></p>
				</div>
				<div class="col-sm-2">
						<p id="sub-total"><input type="text" name="hdnSum1" id="hdnSum1" style="text-align:right;width:100%" value="" readonly="readonly" /></p></span>
				</div>
			</div>
			<div style="bottom:0px; width:1000px; margin:0px auto;">
			<ul id="shopping-cart-actions" >
				<li>
					<a href="petshop_view.jsp" class="btn">เลือกสินค้าเพิ่ม</a>
				</li>
				<li>
					
					<input type="submit" value="ออกใบเสร็จ" class="btn">
				</li>
			</ul>
			</div>
		
		
	
	</form>
	</div>
	
	

</div>


</body>
</html>	