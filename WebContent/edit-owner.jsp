<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp" %>

<script>
	
	function editConfirm() {
		if (confirm("ยืนยันการแก้ไขข้อมูล")) {
			return true;
		}
		return false;
	}
</script>
<script type="text/javascript" src="js/dropdown.js"></script> 
    <br><br><br><br>
        <div class="container">
        <%
			request.setCharacterEncoding("UTF-8");
		%>
        
        <div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
<!-- 	<a  href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /> -->
	<input type="hidden" name="id" value="<%=request.getParameter("owners_idcard")%>">
	</a>
</div>
            <div class="row">
           
					<h3 align="center">แก้ไขข้อมูลเจ้าของสัตว์เลี้ยง</h3>
					<br/>
					<form name="form1" id="form1" method="POST" action="UpdateOwnerServlet"
						style="margin: 10px, 10px, 10px, 10px;">
						<div class="row">

							<div class="col-sm-6">
								<div class="form-group">
									<div class="row">
										<div class="col-sm-3">
											<div>
												<p>หมายเลขบัตรประชาชน</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
									<input type="text" value="<%=request.getParameter("owners_idcard")%>"
										name="owners_idcard" id="owners_idcard"/ class="form-control">
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
												<select name="prefix" id="prefix"  class="form-control">
													<option value="<%=request.getParameter("prefix") %>" ><%=request.getParameter("prefix") %></option>
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
												<input type="text" name="owners_name" id="owners_name" value="<%=request.getParameter("owners_name") %>" class="form-control"/>
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
												<input type="text" name="owners_lname" id="owners_lname" value="<%=request.getParameter("owners_lname") %>" class="form-control"/>
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
													<option value="<%=request.getParameter("owners_gender") %>"><%=request.getParameter("owners_gender") %></option>
													<option value="ชาย">ชาย</option>
													<option value="หญิง">หญิง</option>
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
												<textarea name="address" rows="5" class="form-control"><%=request.getParameter("address") %></textarea>
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
												<input type="text" name="telephon" id="telephon" value="<%=request.getParameter("telephon") %>" class="form-control"
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
												<input type="text" name="owners_birthday" id="dateInput"
													value="<%=request.getParameter("owners_birthday") %>" class="form-control" />
											
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
									<input type="hidden" name="owner_id" value="<%=request.getParameter("owner_id") %>">
									<input type="submit" name="submit" id="submit"
										onclick="return editConfirm();" class="btn btn-success" value="บันทึกการแก้ไข" onclick="cal(value)" />
								</div>
							</div>

						</div>

					</form>

                
            </div>
        </div>
   
<%@ include file="footer_index.jsp" %>
