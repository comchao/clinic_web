 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="dao.purchaseDAO"%>
<%@page import="model.purchaseBean"%>
<%@ include file="header_shop.jsp" %>
<%@page import="java.util.List"%>
<%@ page import="java.text.*" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
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
			 
			var currentDate =  fullDate.getFullYear()+ "-" + twoDigitMonth + "-" + fullDate.get();
			
			$("span[name='date_now']").text(currentDate);
			document.frmProduct.datenow.value = currentDate;
		});
		
	</script>
</head>

<body>


<% Locale lc = new Locale("th","TH"); %>
	
	<%java.text.DateFormat df = new java.text.SimpleDateFormat("EEEE ที่ dd เดือน MMMM พ.ศ. yyyy", new Locale("th", "TH")); %>
		<br>
	<h3 align="center"><b>คิวสัตว์ ที่รอตรวจรักษา</b></h3> <br>
	<h4 align="center"> <b>ณ วันที่  <%= df.format(new java.util.Date()) %></b> </h4>
<div id="site">
	<header id="masthead">
	
		<h1>รายการสินค้า</h1>
	</header>
	<div id="content">
	 <input type="hidden" name='datenow' ">
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
					
				</tr>

		<form name="frmProduct" method="POST"  action="InsertProductHisServlet">
		 <input type="hidden" name="datenow" value="<%= df.format(new java.util.Date()) %>" >	
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
       <input name="Product_name[]" value="<%=bean.getProduct_name()%>" type="hidden">
         <input name="Totalnumber[]" value="<%=bean.getTotalnumber()%>" type="hidden">
           <input name="Product_price[]" value="<%=bean.getProduct_price() %>" type="hidden">
             <input name="Totalprice[]" value="<%=bean.getTotalprice() %>" type="hidden">
       
       
       
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
	
	int  number = Integer.parseInt(request.getParameter("number"));
	int SUM = bean1.getTotal();
	
	int total = 0 ;
	
	total =  number - SUM ;
	
	
 
%>	
		
				
				 	<p align="right"> <b> ราคารวม   &nbsp;   &nbsp;  <%=bean1.getTotal()%>.0  &nbsp;   &nbsp;  บาท  </p> 
				 	
				 <p align="right" >จำนวนเงินที่รับ &nbsp; &nbsp; <%=number%>.0 &nbsp;&nbsp; &nbsp;บาท </p>
				 
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
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			
			
			เงินทอน &nbsp;&nbsp; <font color="red"> <%=total%>.0 </font>  บาท  </p>
			<br>
			
			
			
			
		  <p align="right" > 
		  
		  
		  <input type="submit" value="ชำระเงิน"   class="btn"  ></p>
			
			
			</form>
	
             <%}
%>
			</tr>
			<br>
			
			
</table>

         
			
		
		
		
	
	
	</div>
	
	

</div>


</body>
</html>	