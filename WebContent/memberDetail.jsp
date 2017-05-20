<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<script type="text/javascript" src="js/dropdown.js"></script> 
<br>
<br>
<br>
<br>
<script>
	function editConfirm() {
		if (confirm("คุณต้องการแก้ไขข้อมูลพนักงานใช่หรือไม่?")) {
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
	<!-- <a href="memberView.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a> -->
</div>
	<div class="row">
	<% request.setCharacterEncoding("UTF-8"); %>
		<h3 align="center">รายละเอียด พนักงาน/สัตวแพทย์</h3>
		<br />
		<form name="form1" id="form1" method="POST"
			action="edit-member.jsp" style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>Username</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="username" id="username"
										class="form-control" value="<%=request.getParameter("username")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>Password</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="password" id="password"
										class="form-control" value="<%=request.getParameter("password")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>คำนำหน้า</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								<input type="text" name="prefix" id="prefix"
										class="form-control" value="<%=request.getParameter("prefix")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ชื่อ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="mem_name" id="mem_name" value="<%=request.getParameter("mem_name")%>"
										 class="form-control" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>นามสกุล</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="mem_lname" id="mem_lname" value="<%=request.getParameter("mem_lname")%>"
										 class="form-control" readonly="readonly"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ที่อยู่</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<textarea name="mem_address" rows="5" class="form-control" 
									readonly="readonly"><%=request.getParameter("mem_address")%></textarea>
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
									<p>เบอร์โทร</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="mem_tel" id="mem_tel"
										 class="form-control" value="<%=request.getParameter("mem_tel")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>

						

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ใบรับรอง/คุณวุฒิ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="mem_certificate" id="mem_certificate"
										 class="form-control" value="<%=request.getParameter("mem_certificate")%>"
										readonly="readonly" />
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
									<input type="text" name="mem_birthday"
										 class="form-control" value="<%=request.getParameter("mem_birthday")%>"
										readonly="readonly"/>
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
								<input type="text" name="mem_gender" id="mem_gender"
										 class="form-control" value="<%=request.getParameter("mem_gender")%>"
										readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ตำแหน่ง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								<input type="text" name="mem_position" id="mem_position" 
									value="<%=request.getParameter("mem_position")%>"
										class="form-control" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>Type-Code</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								<input type="text" name="type_code" id="type_code"
									value="<%=request.getParameter("type_code")%>"
										class="form-control"
										readonly="readonly" />
									
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group" style="text-align: center">
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
						<input type="submit" name="submit" id="submit"
						onclick="return editConfirm();	"class="btn btn-warning" value="แก้ไขข้อมูล" onclick="cal(value)" />
					</div>
							</div>
						</div>

					
					</div>
				</div>
			</div>
			<br>
			<br>
		</form>


	</div>
</div>

<%@ include file="footer_index.jsp"%>
