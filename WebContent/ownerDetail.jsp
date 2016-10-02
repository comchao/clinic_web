<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<br>
<br>
<br>
<br><br><br>

<script>
	function delConfirm() {
		if (confirm("คุณแน่ใจที่ต้องการที่จะลบข้อมูลเจ้าของสัตว์เลี้ยงใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
	function editConfirm() {
		if (confirm("คุณแน่ใจที่จะทำการแก้ไขข้อมูลใช่หรือไม่? ")) {
			return true;
		}
		return false;
	}
</script>
<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<div class="row">
	
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<h3 align="center">รายละเอียดข้อมูลเจ้าของสัตว์เลี้ยง</h3>
		<br />
		<br />

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
								<input type="text"
									value="<%=request.getParameter("owners_idcard")%>"
									name="owners_idcard" id="owners_idcard" class="form-control"
									required="required" readonly="readonly" />
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
								<input type="text" name="prefix" id="prefix" readonly="readonly"
									class="form-control" required="required"
									value="<%=request.getParameter("prefix")%>" />

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
								<input type="text" name="owners_name" id="owners_name"
									value="<%=request.getParameter("owners_name")%>"
									class="form-control" required="required" readonly="readonly" />
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
								<input type="text" name="owners_lname" id="owners_lname"
									value="<%=request.getParameter("owners_lname")%>"
									class="form-control" required="required" readonly="readonly" />
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
								<input type="text" name="owners_gender" id="owners_gender"
									value="<%=request.getParameter("owners_gender")%>"
									class="form-control" readonly="readonly" />

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
									readonly="readonly"><%=request.getParameter("address")%></textarea>
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
								<input type="text" name="telephon" id="telephon"
									value="<%=request.getParameter("telephon")%>"
									class="form-control" readonly="readonly" />
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
								<input type="text" name="owners_birthday"
									value="<%=request.getParameter("owners_birthday")%>"
									class="form-control" readonly="readonly" />

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div>
			<div style="display: block; float: right; padding: 5px 5px;">

				<form action="edit-owner.jsp" method="post">

					<input type="hidden" name="owner_id"	value="<%=request.getParameter("owner_id")%>"> 
					<input type="hidden" name="owners_idcard" value="<%=request.getParameter("owners_idcard")%>"> 
					<input type="hidden" name="prefix"	value="<%=request.getParameter("prefix")%>"> 
					<input type="hidden" name="owners_name"	value="<%=request.getParameter("owners_name")%>"> 
					<input type="hidden" name="owners_lname" value="<%=request.getParameter("owners_lname")%>"> 
					<input type="hidden" name="owners_gender" value="<%=request.getParameter("owners_gender")%>">
					<input type="hidden" name="address"	value="<%=request.getParameter("address")%>"> 
					<input type="hidden" name="telephon" value="<%=request.getParameter("telephon")%>"> 
					<input type="hidden" name="owners_birthday"	value="<%=request.getParameter("owners_birthday")%>"> 
					<input type="submit" onclick="return editConfirm();"class="btn btn-warning" value="แก้ไข">
				</form>
			</div>
			<div style="display: block; float: right; padding: 5px 5px;">
				<form action="DelOwnerServlet" method="post">

					<input type="hidden" name="owner_id"	value="<%=request.getParameter("owner_id")%>"> 
					<input type="submit" onclick="return delConfirm();"	class="btn btn-danger" value="ลบข้อมูล">
				</form>

			</div>
		</div>
		
		

	</div>
</div>

<%@ include file="footer_index.jsp"%>
