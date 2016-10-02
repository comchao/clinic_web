<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp" %>
<script type="text/javascript" src="js/dropdown.js"></script> 
      
    <br><br><br><br><br><br>
        <div class="container">
        <div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
            <div class="row">
					<h3 align="center">เพิ่มข้อมูลเจ้าของสัตว์เลี้ยง</h3>
					<br/>
					<form name="form1" id="form1" method="POST" action="InsertOwnerServlet"
						style="margin: 10px, 10px, 10px, 10px;">
						<div class="row">

							<div class="col-sm-6">
								<div class="form-group">
									<div class="row">
										<div class="col-sm-3">
											<div>
												<p>เลขประชาชน</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<input type="text" name="owners_idcard" id="owners_idcard" maxlength="13" placeholder="หมายเลขบัตรประชาชน"
													class="form-control" required="required"   onKeyUp="IsNumeric(this.value,this)" />
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
												<input type="text" name="owners_name" id="owners_name" placeholder="ชื่อ" class="form-control"
													required="required" />
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
												<input type="text" name="owners_lname" id="owners_lname" placeholder="นามสกุล" class="form-control"
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
												<select name="owners_gender" id="owners_gender" class="form-control">
													<option value="ชาย">ชาย</option>
												</select>
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
												<p>ที่อยู่</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<textarea name="address" rows="5" class="form-control" 
												placeholder="ที่อยู่"
												required data-validation-required-message="Please enter a petgens."></textarea>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<p>เบอร์โทร</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<input type="text" name="telephon" id="telephon" placeholder="เบอร์โทร" class="form-control"
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
											<input type="text" name="owners_birthday" id="dateInput" placeholder="dd-mm-yyyy" class="form-control" required="required" /> 
												
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<br><br>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group" style="text-align: right">
									<input type="submit" name="submit" id="success"
										class="btn btn-success" value="บันทึกข้อมูล" onclick="success(id)" />
								</div>
							</div>

						</div>

					</form>

                
            </div>
        </div>
   
<%@ include file="footer_index.jsp" %>
