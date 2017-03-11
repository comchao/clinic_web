<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.ProductBean"%>
<%@page import="model.TypePetBean"%>
<%@page import="dao.PetsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_shop.jsp" %>
<script src="js/petshop-script.js" type="text/javascript" charset="utf-8"></script>
<body class="col-md-12">
<div id="site" >
	<header id="masthead">
		<h1>รายการสินค้า</h1>
	</header>
	<div class="row">
		<div align="center">
		<div class="col-sm-12"><br></div>
		<div class="col-sm-12">
		<div class="col-sm-6" ><h3 align="center">ค้นหาตามประเภท</h3>
			
			<form action="searchProductIDServlet" method="POST" >
			<select name="pet_id" id="pet_id"class="search-query"  style="width:70%;">
				<%
					ArrayList<TypePetBean> list = PetsDAO.queryTypePetAll();
					for (TypePetBean typePet : list) {
							
				%>
					<option value="<%=typePet.getId()%>"><%=typePet.getTypeName()%></option>
				<%
				}
				%>
			</select>
			<input type="submit" class="btn btn-info" value="ค้นหา"/>
			</form>
		</div>	
		<div class="col-sm-6"><h3 align="center">ค้นหาจาก รหัสสินค้า / ชื่อสินค้า</h3>
			
			<form action="searchProductShopServlet" method="post">
				<input name="product_name" type="text" class="search-query"	placeholder="ชื่อสินค้าสัตว์เลี้ยง" style="width:70%;"/> 
				<input type="hidden" name="searchType" value="searchProducts">&nbsp;&nbsp; 
				<input type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
		</div>
		<br><br><br><br><br><br>
		</div>
		</div>
	</div>
	<div id="products">
	<div class="col-md-12">
	<%
		// รับข้อมูลจาก Session ---> ArrayList
		ArrayList<ProductBean> allProduct = (ArrayList) session.getAttribute("allProductSS");
		if (allProduct != null) {
			ProductBean pb;
			String allpage = (String) session.getAttribute("pageN");
			int p = Integer.parseInt(allpage);
			for (int i = (p * 16) - 16; i < p * 16; i++) {
				if (i == allProduct.size()) {
					break;
				}
				pb = (ProductBean) allProduct.get(i);
		%>
		<div style="width:210px;float: left;height:550px;padding-right: 10px;" >
					<div class="product-image">
						<img src="images/<%=pb.getProduct_img_name()%>" width="150px" height="150px" alt="" />
					</div>
					<div class="product-description" data-name="<%=pb.getProduct_name()%>" data-price="<%=pb.getProduct_price()%>">
						<textarea  rows="3" cols="13"  class="product-name"><%=pb.getProduct_name()%></textarea>
						<p class="product-price"><%=pb.getProduct_price()%>บาท</p>
						<form  action="purchaseServlet" method="post">
							<div>
								<label for="qty-1">จำนวน</label>
								<input type="text" name="number" id="qty-1" class="qty" value="1" />
								<input type="hidden" name="Product_name"  value="<%=pb.getProduct_name()%>" />
								<input type="hidden" name="Product_price"  value="<%=pb.getProduct_price()%>" />
							</div>
							<p><input type="submit" value="เพิ่มรายการ" class="btn" /></p>
						</form>
					</div>
		</div>
		<%
			}
		%>
		</div>
				<!-- ตัวแบ่งหน้า -->
			<div class="col-md-12"  style="  clear:both;" >
			<form action="pagePetShopServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (allProduct.size() / 16) + 1;
						int c = allProduct.size() % 16;
						if (c != 0) {
							for (a = 0; a < b; a++) {
					%>
					<button value="<%=a + 1%>" name="page" class="btn btn-info"><%=a + 1%></button>
					<%
						}
						} else {
							for (a = 1; a < b; a++) {
					%>
					<button value="<%=a%>" name="page" class="btn btn-info"><%=a%></button>
					<%
						}
						}
					%>
				</div>
			</form>
			<br><br><br><br>
			</div>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
	<%
		}
	%>
	</div>
</div>

<%@ include file="footer_index.jsp"%>
</html>	