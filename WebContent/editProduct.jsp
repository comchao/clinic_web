<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/thumbnail-gallery.css" rel="stylesheet">
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<br>


<script>
	function editConfirm() {
		if (confirm("บันทึกการแก้ไขข้อมูลเรียบร้อยแล้ว")) {
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
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="productView.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>

	<div class="row">
		<%
			request.setCharacterEncoding("UTF-8");
		    
		%>
		<h3 align="center">แก้ไข ข้อมูลสินค้า</h3>
		<br />
		<form action="UpdateProductServlet" method="post"method="post" enctype="multipart/form-data"
		
			 style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">

						<div class="row">
							<div class="col-sm-4">
								<div>
									<p>ชื่อสินค้า</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="product_name" id="product_name"
										value="<%=request.getParameter("edit_product_name")%>"
										placeholder="ชื่อยา" class="form-control" required="required" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>รายละเอียดสินค้า</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<textarea name="product_detail" rows="5" class="form-control"
										placeholder="รายละเอียดสินค้า" required
										data-validation-required-message="กรุณากรอกรายละเอียดสินค้า"><%=request.getParameter("edit_product_detail")%></textarea>
								
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4">
								<div>
									<p>ราคา/ต่อหน่วย</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="product_price" id="product_price"
										value="<%=request.getParameter("edit_product_price")%>"
										placeholder="ราคา/ต่อหน่วย" class="form-control"
										required="required" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4">
								<div>
									<p>ชนิด/ประเภท</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="product_unit" id="product_unit"
										value="<%=request.getParameter("edit_product_unit")%>"
										placeholder="ชนิด/ประเภท" class="form-control"
										required="required" />
								</div>
							</div>
						</div>

					</div>

				</div>
				
				<div class="col-sm-6">
					<div class="form-group">
					<table class="info" style="width:100%;height: 100%; border: 1px 1px;">
					<tr style="width:100px;height:280px; ">
						<td>
						<%String product_img_name = request.getParameter("product_img_name"); %>
						<div class="product-image">
						
						 
                <center> <a class="thumbnail" href="#">
                  <img class="img-responsive" src="images/<%=product_img_name%>" width="250px" height="250px">
               </a> </center> 
           
							
						
					</div>
						</td>
					</tr>
					</table>
					<div class="row">
							<div class="col-sm-3">
								<div>
									<p>แก้ไขรูปภาพ</p>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">
								
									<input type="file" name=pic_product id="pic_product"
										placeholder="รูปภาพ" class="form-control"
										 size="50">
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
				
				
					<div class="col-sm-6">
						<div class="form-group" style="text-align: right">
							<input type="hidden" name="product_id"
								value="<%=request.getParameter("product_id")%>"> <input
								type="submit" name="submit" id="submit" onclick="return editConfirm();"class="btn btn-success"
								value="บันทึกข้อมูล"  />
						</div>
					</div>

				</div>
			</div>

		</form>


	</div>
	
</div>

<%@ include file="footer_index.jsp"%>
