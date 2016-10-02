<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp" %>
<br><br><br><br>
<div class="container">
	<div class="row">
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<h3 align="center">บันทึก ข้อมูลสัตว์เลี้ยง<br>ของคุณ : <%=request.getParameter("owner_name")+"  "+request.getParameter("owner_lname") +"  "%> เรียบร้อยแล้ว</h3>
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ชื่อสัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_name" id="pet_name"
									value="<%=request.getParameter("pet_name")%>"
										placeholder="ชื่อสัตว์เลี้ยง" class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ประเภท</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_category" id="pet_category"
									value="<%=request.getParameter("pet_category")%>"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>พันธุ์</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gene" id="pet_gene"
										placeholder="พันธุ์สัตว์เลี้ยง" class="form-control"
										value="<%=request.getParameter("pet_gene")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>เพศ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gender" id="pet_gender" 
									value="<%=request.getParameter("pet_gender")%>" class="form-control"
										readonly="readonly">
								</div>
							</div>
						</div>





					</div>

				</div>

				<div class="col-sm-6">
					<div class="form-group">

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>น้ำหนัก</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_weight" id="pet_weight"
									value="<%=request.getParameter("pet_weight")%>"
										placeholder="น้ำหนัก" class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>วันเกิด</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_birthday"
									value="<%=request.getParameter("pet_birthday")%>"
										placeholder="วันเกิด " class="form-control"
										readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>อายุ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_age" id="pet_age"
									value="<%=request.getParameter("pet_age")%>"
										placeholder="อายุ" class="form-control" readonly="readonly" />

								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ตำหนิ/สี</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<textarea name="pet_extra" rows="5" class="form-control"
										placeholder="ตำหนิ/สี" id="pet_extra"readonly="readonly"><%=request.getParameter("pet_extra")%></textarea>
								</div>
							</div>
						</div>
						
						</div>
						
			</div>
		</div>
		<div>
			<div style="display: block; float: right; padding: 5px 5px;">

				<form action="edit-owner.jsp" method="post">

					<input type="hidden" name="id"
						value="<%=request.getParameter("id")%>"> <input
						type="hidden" name="owners_idcard"
						value="<%=request.getParameter("owners_idcard")%>"> <input
						type="hidden" name="prefix"
						value="<%=request.getParameter("prefix")%>"> <input
						type="hidden" name="owners_name"
						value="<%=request.getParameter("owners_name")%>"> <input
						type="hidden" name="owners_lname"
						value="<%=request.getParameter("owners_lname")%>"> <input
						type="hidden" name="owners_gender"
						value="<%=request.getParameter("owners_gender")%>"> <input
						type="hidden" name="address"
						value="<%=request.getParameter("address")%>"> <input
						type="hidden" name="telephon"
						value="<%=request.getParameter("telephon")%>"> <input
						type="hidden" name="owners_birthday"
						value="<%=request.getParameter("owners_birthday")%>"> <input
						type="submit" class="btn btn-warning"
						onclick="return editConfirm();" value="แก้ไขข้อมูลสัตว์เลี้ยง">
				</form>
			</div>
			<div style="display: block; float: right; padding: 5px 5px;">
				<form action="DelOwnerServlet" method="post">

					<input type="hidden" name="id"
						value="<%=request.getParameter("id")%>"> <input
						type="submit" onclick="return delConfirm();"
						class="btn btn-danger" value="ลบข้อมูลสัตว์เลี้ยง">
				</form>

			</div>
			<div style="display: block; float: right; padding: 5px 5px;">
				<form action="pet_view.jsp" method="post">

					<input type="hidden" name="owner_name"
						value="<%=request.getParameter("owners_name")%>"> <input
						type="hidden" name="owner_lname"
						value="<%=request.getParameter("owners_lname")%>"> <input
						type="hidden" name="owner_id" value="<%=request.getParameter("id")%>">
					<input type="submit" class="btn btn-info" value="ฝากเลี้ยง">
				</form>

			</div>
		</div>
	</div>
</div>

<%@ include file="footer_index.jsp"%>
