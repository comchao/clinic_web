<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp" %>
    <br><br><br><br><br><br>
        <div class="container">
            <div class="row">
					<h3 align="center">การรักษา</h3>
					<br/>
					<form name="form1" id="form1" method="POST" action="InsertTreatmentServlet"
						style="margin: 10px, 10px, 10px, 10px;">
						<div class="row">

							<div class="col-sm-6">
								<div class="form-group">
									<div class="row">
										<div class="col-sm-3">
											<div>
												<p>ตำแหน่ง</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<input value="<%=session.getAttribute("typecode_name") %>" type="text" name="cure_id" id="cure_id" placeholder="ตำแหน่ง"
													class="form-control" readonly="readonly" maxlength="8" />
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<p>วันที่</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<input type="text" name="postdate" id="postdate" placeholder="วันที่ทำการรักษา" class="form-control"
													required="required" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<p>ชื่อสัตว์แพทย์</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<input value="<%=session.getAttribute("firstname") %> <%=session.getAttribute("lastname") %>" type="text" name="veterinary_name" id="veterinary_name" placeholder="ชื่อสัตว์แพทย์" class="form-control"
													readonly="readonly"/>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<p>รหัสสัตว์</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<input type="text" name="pet_id" id="pet_id" placeholder="รหัสสัตว์" class="form-control"
													required="required" />
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<p>ประเภทการรักษา</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<select name="cure_type" id="cure_type" class="form-control"
													required="required">
													<option value="ผ่าตัด">ผ่าตัด</option>
													<option value="เย็บแผล">เย็บแผล</option>
													<option value="ฉีดวัคซีน">ฉีดวัคซีน</option>
													<option value="ทั่วไป">ทั่วไป</option>
													
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
												<p>อาการ</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<textarea name="cure_de" rows="5" class="form-control" 
												placeholder="อาการ" 
												required data-validation-required-message="Please enter a petgens."></textarea>
											</div>
										</div>
									</div>
									
								
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<p>การรักษา</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<textarea name="cure_treament" rows="5" class="form-control" 
												placeholder="การรักษา" 
												required data-validation-required-message="Please enter a petgens."></textarea>
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
									<input type="submit" name="submit" id="submit"
										class="btn btn-success" value="บันทึกข้อมูล" onclick="cal(value)" />
								</div>
							</div>

						</div>

					</form>

                
            </div>
        </div>
   
<%@ include file="footer_index.jsp" %>
