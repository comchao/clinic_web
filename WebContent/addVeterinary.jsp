<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div class="row">
		<h3 align="center">เพิ่มข้อมูลสัตว์แพทย์</h3>
		<br />
		<form name="form1" id="form1" method="POST"
			action="InsertOwnerServlet" style="margin: 10px, 10px, 10px, 10px;">
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
										placeholder="username" class="form-control"
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
										placeholder="password" class="form-control"
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
									<input type="text" name="officer_name" id="officer_name"
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
									<input type="text" name="officer_lname" id="officer_lname"
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
									<textarea name="address" rows="5" class="form-control"
										placeholder="ที่อยู่" required
										data-validation-required-message="Please enter a petgens."></textarea>
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
									<input type="text" name="telephon" id="telephon"
										placeholder="เบอร์โทร" class="form-control"
										required="required" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>อีเมล์</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="email" id="email"
										placeholder="email" class="form-control"
										required="required" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>id_certificate</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="id_certificate" id="id_certificate"
										placeholder="id_certificate" class="form-control"
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
									<input type="text" name="owners_birthday" id="owners_birthday"
										placeholder="วันเกิด " class="form-control"
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
									<select name="owners_gender" id="owners_gender"
										class="form-control" required="required">
										<option value="ชาย">ชาย</option>
										<option value="หญิง">หญิง</option>
									</select>
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
									<input type="text" name="age" id="age" placeholder="อายุ"
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
									<input type="text" name="position_Name" id="position_Name"
										placeholder="ตำแหน่ง" class="form-control" required="required" />
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group" style="text-align: right">
						<input type="submit" name="submit" id="submit"
							class="btn btn-success" value="บันทึกข้อมูล" onclick="cal(value)" />
					</div>
				</div>

			</div>

		</form>


	</div>
</div>

<%@ include file="footer_index.jsp"%>
