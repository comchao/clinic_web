<%@page import="dao.PetsDAO"%>
<%@page import="model.TypePetBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br><br>
<br>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="productView.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<div class="row">
		<h3 align="center">เพิ่มข้อมูลสินค้า</h3>
		<br />
		<form name="form1" id="form1" method="POST" enctype="multipart/form-data" 
			action="InsertProductServlet" style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">


				<div class="col-sm-6">
					<div class="form-group">
					<div class="row">
							<div class="col-sm-4">
								<div>
									<p>ประเภทสัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-6">
								
								<div class="form-group">
								<select name="refer_type_pet" id="refer_type_pet" class="form-control"
										required="required">
								<%
								ArrayList<TypePetBean> list = PetsDAO.queryTypePetAll();
								for (TypePetBean typePet : list) {
									
								%>
										<option value="<%=typePet.getId()%>"><%=typePet.getTypeName()%></option>
								<%
								}
								%>
								</select>
									
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div>
									<p>รหัสสินค้า</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="product_code" id="poduct_code"
										placeholder="รหัสสินค้า" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div>
									<p>ชื่อสินค้า</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="product_name" id="product_name"
										placeholder="ชื่อสินค้า" class="form-control"
										required="required" />
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
										data-validation-required-message="Please enter a petgens."></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
					
					<div class="row">
							<div class="col-sm-4">
								<div>
									<p>ราคา/ต่อหน่วย</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="number" name="product_price" id="product_price"
										placeholder="ราคา/ต่อหน่วย" class="form-control"
										required="required" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4">
								<div>
									<p>บรรจุภัณฑ์</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="product_unit" id="product_unit"
										placeholder="ขวด/ถุง/กล่อง" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
					
					<div class="row">
							<div class="col-sm-4">
								<div>
									<p>รูปภาพ</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="file" name="pic_product" id="pic_product"
										placeholder="รูปภาพ" class="form-control"
										required="required" size="50" />
										
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group" style="text-align: right">
							<input type="submit" name="submit" id="submit"
								class="btn btn-success" value="บันทึกข้อมูล"
								/>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="footer_index.jsp"%>
