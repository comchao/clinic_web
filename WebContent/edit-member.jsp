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
		if (confirm("บันทึกข้อมูลสำเร็จ")) {
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
	<a  href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<div class="row">
	<% request.setCharacterEncoding("UTF-8"); %>
		<h3 align="center">แก้ไขมูลพนักงาน</h3>
		<br />
		<form name="form1" id="form1" method="POST"
			action="UpdateMemberServlet" style="margin: 10px, 10px, 10px, 10px;">
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
										placeholder="username" class="form-control" value="<%=request.getParameter("username")%>"
										required="required" />
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
										placeholder="password" class="form-control" value="<%=request.getParameter("password")%>"
										required="required" />
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
									<select name="prefix" id="prefix" class="form-control"
										required="required">
										<option value="<%=request.getParameter("prefix")%>"><%=request.getParameter("prefix")%></option>
										<option value="นาย">นาย</option>
										<option value="นาง">นาง</option>
										<option value="นางสาว">นางสาว</option>

									</select>
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
										placeholder="ชื่อ" class="form-control" required="required" />
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
										placeholder="นามสกุล" class="form-control" required="required" />
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
										placeholder="ที่อยู่" required
										data-validation-required-message="Please enter a petgens."><%=request.getParameter("mem_address")%></textarea>
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
										placeholder="เบอร์โทร" class="form-control" value="<%=request.getParameter("mem_tel")%>"
										required="required" />
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
										placeholder="ใบรับรอง/คุณวุฒิ" class="form-control" value="<%=request.getParameter("mem_certificate")%>"
										required="required" />
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
									<input type="text" name="mem_birthday" id="dateInput"
										placeholder="วันเกิด " class="form-control" value="<%=request.getParameter("mem_birthday")%>"
										required="required" />
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
									<select name="mem_gender" id="mem_gender" 
										class="form-control" required="required">
										<option value="<%=request.getParameter("mem_gender")%>"><%=request.getParameter("mem_gender")%></option>
										<option value="ชาย">ชาย</option>
										<option value="หญิง">หญิง</option>
									</select>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="hidden" name="mem_age" id="mem_age" placeholder="อายุ"
									value="<%=request.getParameter("mem_age")%>"
										class="form-control" required="required" />
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
									<select name="mem_position" id="mem_position"
										class="form-control" required="required">
										<option value="<%=request.getParameter("mem_position")%>"><%=request.getParameter("mem_position")%></option>
										<option value="สัตวแพทย์-เจ้าของ">สัตวแพทย์-เจ้าของ</option>
										<option value="สัตวแพทย์">สัตวแพทย์</option>
										<option value="พนักงาน">พนักงาน</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="hidden" name="mem_img" id="mem_img"
									value="nojpg"
										placeholder="รูปภาพ" class="form-control"
										required="required" />
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
									<select name="type_code" id="type_code"
										class="form-control" required="required">
										<option><%=request.getParameter("type_code")%></option>
										
									</select>
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
						onclick="return editConfirm();	"class="btn btn-success" value="บันทึกข้อมูล" onclick="cal(value)" />
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
