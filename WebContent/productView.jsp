<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>
<script>
	function editConfirm() {
		if (confirm("คุณต้องการแก้ไขข้อมูลสินค้าใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
	function delConfirm() {
		if (confirm("คุณต้องการลบข้อมูลสินค้าใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
	
</script>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
<div align="right">
	 <a href="addProduct.jsp"><input type="submit"
				class="btn btn-primary" value="เพิ่มข้อมูลสินค้า" /></a>
</div>
	<div class="row">
		<div align="center">
		<h3 align="center">ข้อมูลสินค้า</h3>	<br />
			<h4 align="center">ค้นหาสินค้า</h4>
			<br />
			<form action="searchProductServlet" method="post">
				<input name="product_name" type="text" class="search-query"
					placeholder="ชื่อสินค้า" /> <input type="hidden"
					name="searchType" value="searchProducts">&nbsp;&nbsp; <input
					type="submit" class="btn btn-info" value="ค้นหา" />
			</form>
		</div>

	</div>
	<br> <br>
	<%
		// รับข้อมูลจาก Session ---> ArrayList
		ArrayList<ProductBean> allProduct = (ArrayList) session.getAttribute("allProductSS");
		
		if (allProduct != null) {
	%>
		<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th>ลำดับ</th>
					<th>รหัสสินค้า</th>
					<th>ชื่อสินค้า</th>
					<th>รายละเอียดสินค้า</th>
					<th>ราคา/ต่อชิ้น</th>
					<th>ชนิด/ประเภท/หน่วย</th>
					<th></th>
					<th></th>
				</tr>
				<%
					ProductBean pb;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);

					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == allProduct.size()) {
							break;
						}
						pb = (ProductBean) allProduct.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><%=pb.getProduct_code()%></td>
					<td><%=pb.getProduct_name()%></td>
					<td><%=pb.getProduct_detail()%></td>
					<td><%=pb.getProduct_price()%></td>
					<td><%=pb.getProduct_unit()%></td>
					<td>
					<form action="editProduct.jsp?product_id=<%=pb.getId()%>" method="post">
						<input type="hidden" name="edit_product_id" value="<%=pb.getId()%>">
						<input type="hidden" name="edit_product_name" value="<%=pb.getProduct_name()%>">
						<input type="hidden" name="edit_product_detail" value="<%=pb.getProduct_detail()%>">
						<input type="hidden" name="edit_product_price" value="<%=pb.getProduct_price()%>">
						<input type="hidden" name="edit_product_unit" value="<%=pb.getProduct_unit()%>">
						<input type="submit" onclick="return editConfirm();" class="btn btn-warning" value="แก้ไข">
					</form>
					</td>
					<td>
						<form action="DelProductServlet" method="post">
							<input type="hidden" name="product_id" value="<%=pb.getId()%>">
							<input onclick="return delConfirm();" class="btn btn-danger" type="submit" value="ลบข้อมูลสินค้า">
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<!-- ตัวแบ่งหน้า -->
			<form action="pageProductServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (allProduct.size() / 10) + 1;
						int c = allProduct.size() % 10;
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
			</form><br>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
		</div>
	
	<%
		}
	%>
</div>
<%@ include file="footer_index.jsp"%>