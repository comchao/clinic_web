 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="dao.purchaseDAO"%>
<%@page import="model.purchaseBean"%>
<%@ include file="header_shop.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>

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
<% Locale lc = new Locale("th","TH"); %>
	
	<%java.text.DateFormat df = new java.text.SimpleDateFormat("EEEE ที่ dd เดือน MMMM พ.ศ. yyyy", new Locale("th", "TH")); %>
		<br>
	<h3 align="center"><b>คิวสัตว์ ที่รอตรวจรักษา</b></h3> <br>
	<h5 align="center"> <b>ณ วันที่  <%= df.format(new java.util.Date()) %></b> </h5>
<div id="site">
	<header id="masthead">
	
		<h1>รายการสินค้า</h1>
	</header>
	<div id="content">
	
			<table class="shopping-cart">
			  <thead>
			   <tr>  
	<%--  <td><%=i+1%></td>  --%>

     
				<tr>
				    <th scope="col"><center>ลำดับ </center></th>
					<th scope="col"><center>รายการ </center></th>
					
					<th scope="col"><center>ราคา/ชิ้น</center></th>
					<th scope="col"><center>จำนวน</center></th>
					<th scope="col"><center>รวมราคา</center></th>
					<th scope="col"><center>ลบรายการ</center></th>
				</tr>
			  <%
			  purchaseDAO dao = new purchaseDAO();  
List<purchaseBean> List = dao.getpurchaseBean();
response.setCharacterEncoding("utf-8");
for(int i = 0;i<List.size();i++){
	purchaseBean bean = List.get(i);
 
%>	
<tr>             <td><center><%=i+1%></td>
                  
				
				 <td><center><%=bean.getProduct_name()%></center></td>
				 
      <td><center><%=bean.getProduct_price() %></center></td>
       <td><center><%=bean.getTotalnumber() %></center></td>
       <td><center><%=bean.getTotalprice() %></center></td>
        <form action="deletepurchase" method="post">
       <td><center><input type="submit" value="ลบ" class="btn" ></center></td>
      
       <input name="Product_name" type="hidden" value="<%=bean.getProduct_name()%>"> 
       
       </form>
       
       
     </tr>
  
      <%}
%>
				
				
				
				
			  </thead>
			  <tbody>
			  </tbody>
			</table>
			<br>
		<table>
		<tr>
		
		
		<%
		
		
		%>
				
				 <%
			  purchaseDAO dao1 = new purchaseDAO();  
List<purchaseBean> List1 = dao.getTotal();
response.setCharacterEncoding("utf-8");
for(int i1 = 0;i1<List1.size();i1++){
	purchaseBean bean1 = List1.get(i1);
	
	
 
%>	
		
				
				 	<p align="right"> <b> ราคารวม   &nbsp;   &nbsp;  <%=bean1.getTotal()%>  &nbsp;   &nbsp;  บาท  </p> 
				 	
	
             <%}
%>
			</tr>
			<br>
			
</table>
<form action="SumCart.jsp" method="post">
           <p align="right" >จำนวนเงินที่รับ &nbsp; &nbsp; <input type="text" name="number" required="required" class="form-control"  style="width:20%;"></p>
           <br>
			<p   >  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
			<br>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
			
			เงินทอน  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;0.0  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;บาท  </p>
			<br>
		  <p align="right" > <input type="submit" value="ชำระเงิน"   class="btn"  ></p>
			
			
			</form>

			
			
			<div style="bottom:0px; width:1000px; margin:0px auto;">
			<ul id="shopping-cart-actions" >
			
			
			
				<li>
					<a href="petshop_view.jsp" class="btn">เลือกสินค้าเพิ่ม</a>
				</li>
			
			</ul>
			</div>
		
		
	
	
	</div>
	
	

</div>


</body>
</html>	