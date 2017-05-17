<%@page import="dao.CageTypeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<%@page import="java.text.DecimalFormat" %>
<script type="text/javascript" src="js/dropdown.js"></script> 
<script>
function chkra(pvar){
	if(pvar==9){
		document.getElementById("openProduct").style.display = 'none';
	 }else{
	 document.getElementById("openProduct").style.display = '';
	 }
}
function fnccheck(pvar){
	if(pvar==9){
		document.getElementById("pe_config").style.display = 'none';
	 }else{
	 document.getElementById("pe_config").style.display = '';
	 }
	var cage;
	var product;
	var day;
	var sum;
	var cal_day;
	var cal_cash;
	var percent;
	var pe_config;
	var total;
	pe_config=parseFloat(document.frmMain.pe_config.value);
	percent=parseFloat(document.frmMain.dep_persent.value);
	day=parseFloat(document.frmMain.days.value);
	cal_day=day+1;
	cage=parseFloat(document.frmMain.cagePrice.value);
	product=parseFloat(document.frmMain.txtSum.value);
	
	sum=(cage*cal_day)+product;
	
	document.frmMain.sumPrice.value=sum.toFixed(2);
	document.frmMain.cal_day.value=cal_day;
	if(percent==0){
		cal_cash=sum-pe_config.toFixed(2);
		document.frmMain.cash.value=pe_config.toFixed(2);
		document.frmMain.payment.value=cal_cash.toFixed(2);
	}
	else{
		cal_cash=(sum/percent);
		document.frmMain.cash.value=cal_cash.toFixed(2);
		total=sum-cal_cash.toFixed(2);
		document.frmMain.payment.value=total.toFixed(2);
	}
		
	
	
 
}
</script>
<%
	request.setCharacterEncoding("utf-8");
%>
<body onload="fnccheck('9')">
<% 

DecimalFormat Formatter = new DecimalFormat("###,###.00");


%>
<br>
<br>
<br>
<div class="container">
<!-- <div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" />
	</a>
</div> -->
		<h3 align="center">การรับฝากเลี้ยง</h3>
		<br />
		<div class="col-sm-12">
		<form name="frmMain" id="frmMain" action="InsertPetDepositServlet" method="POST">
		 <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
	<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy"); %>
	<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("MM"); %>
	
	          <input type="hidden" name="datenow" value="<%= df.format(new java.util.Date()) %>" >	
			  <input type="hidden" name="produc_year" value="<%= df2.format(new java.util.Date())%>" >
			  <input type="hidden" name="produc_month" value="<%= df3.format(new java.util.Date())%>" >
				<!--  ข้อมูลสัตว์เลี้ยง  -->
				<div class="col-sm-4">
					<div class="form-group">
					<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>เจ้าของ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="owner_name" placeholder="ชื่อเจ้าของสัตว์เลี้ยง "
										class="form-control" required="required"
										value="<%=new String(request.getParameter("owner_name").getBytes("ISO8859_1"), "UTF8") %> <%=new String(request.getParameter("owner_lname").getBytes("ISO8859_1"), "UTF8") %>"
										readonly="readonly" />
										<input type="hidden" name="prd_date" id="prd_date" readonly
										placeholder="วันที่ทำการรักษา" class="form-control"
										required="required" />
										
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>สัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_name" id="pet_name"
										placeholder="ชื่อสัตว์เลี้ยง" class="form-control"
										value="<%=request.getParameter("pet_name")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ประเภท</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_category" id="pet_category"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="<%=request.getParameter("pet_category")%>"
										readonly="readonly" />
										<%if(request.getParameter("pet_category").equals("สุนัข")){
											
										%>
										<input type="hidden" name="refer_pet_id" id="refer_pet_id"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="1">
										<% }%>
										<%if(request.getParameter("pet_category").equals("แมว")){
											
										%>
										<input type="hidden" name="refer_pet_id" id="refer_pet_id"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="2">
										<% }%>
										<%if(request.getParameter("pet_category").equals("กระต่าย")){
											
										%>
										<input type="hidden" name="refer_pet_id" id="refer_pet_id"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="3">
										<% }%>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>พันธุ์</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gene" id="pet_gene"
										placeholder="พันธุ์สัตว์เลี้ยง" class="form-control"
										required="required"
										value="<%=request.getParameter("pet_gene")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>เพศ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gender" id="pet_gender"
										placeholder="พันธุ์สัตว์เลี้ยง" class="form-control"
										required="required"
										value="<%=request.getParameter("pet_gender")%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>อายุ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_age" id="pet_age" placeholder="อายุ" class="form-control" value="<%=request.getParameter("pet_age")%>" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ตำหนิ/สี</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_extra" id="pet_extra" class="form-control" value="<%=request.getParameter("pet_extra")%>" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>มัดจำ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group" align="center">
								<input  type="radio" name="dep_persent" value="4"  onclick="JavaScript:return fnccheck('9');"> 25%
								<input type="radio" name="dep_persent" value="2" checked="checked"  onclick="JavaScript:return fnccheck('9');"> 50%
								<input type="radio" name="dep_persent" value="1" onclick="JavaScript:return fnccheck('9');"> จ่ายเต็ม<br>
								<input type="radio" name="dep_persent" value="0"  onclick="JavaScript:return fnccheck('1');" /> กำหนดเอง
								<input type="text" name="pe_config" id="pe_config" class="form-control" value="" onchange="JavaScript:return fnccheck();"/> 
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  ข้อมูลสัตว์เลี้ยง  -->
				<div class="col-sm-4">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>วันที่ฝาก</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="from" id="from"
										placeholder="วันที่ฝากสัตว์เลี้ยง" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>วันที่มารับ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="to" id="to"
										placeholder="วันที่รับสัตว์เลี้ยง" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>จำนวนวัน</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="cal_day" id="cal_day" placeholder="ระยะเวลาฝากเลี้ยง" class="form-control"
										 readonly="readonly" />
										<input type="hidden" name="days" id="days"
										placeholder="ระยะเวลาฝากเลี้ยง" class="form-control" value="-1"
										required="required" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>เลือกกรง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								<script>
									function windowOpenCage() {
										var myCage=window.open('cageSelect.jsp','windowRef','width=1200,height=300,top=220,left=25');
										if (!myCage.opener) myCage.opener = self;
									}
								</script>
								<input name="opencageSelect" class="form-control" type="button" id="opencageSelect" onClick="Javascript:windowOpenCage();" value="เลือกกรง">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ขนาดกรง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" readonly="readonly" value="ยังไม่ได้เลือก" name="cageSize" id="cageSize">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ชื่อกรง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								     <input type="text" class="form-control" value="ยังไม่ได้เลือก" readonly="readonly" name="cageName" id="cageName" required="required">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ราคากรง</p>
								</div>
							</div>
							<div class="col-sm-8"">
								<div class="form-group">
								    <input type="text" class="form-control" value="0.00" name="cagePrice" id="cagePrice" style="text-align:right" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p style="color:red">จ่าย<br>(มัดจำ)</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" value="0" readonly="readonly" name="cash" style="text-align:right" id="cash"  >
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>อาหาร</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								<input  type="radio" name="deposit_food" value="นำมาเอง"  onclick="chkra('9');"> นำมาเอง<br>
								<input type="radio" name="deposit_food" value="จากทางร้าน" checked="checked" onclick="chkra('1');"> จากทางร้าน
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p></p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								<script>
									function windowOpen() {
										var refer_id;
										refer_id=parseInt(document.frmMain.refer_pet_id.value);
										var myWindow=window.open('productSelect.jsp?refer_pet_id='+refer_id,'windowRef','width=1200,height=300,top=220,left=25');
										if (!myWindow.opener) myWindow.opener = self;
									}
								</script>
								<input name="openProduct" class="form-control" type="button" id="openProduct" onClick="Javascript:windowOpen();" value="เลือกอาหารสัตว์เลี้ยง">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ชื่อสินค้า</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								  <input type="text" class="form-control" value="ยังไม่ได้เลือก" readonly="readonly" name="txtName" id="txtName">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ราคา/ชิ้น</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" value="0" readonly="readonly" style="text-align:right" name="txtPrice" id="txtPrice">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>จำนวน</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								   <input type="text" class="form-control" value="0" name="txtQty" style="text-align:right" readonly="readonly" id="txtQty">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ค่าอาหาร</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								   <input type="text" class="form-control" value="0" name="txtSum" id="txtSum" style="text-align:right" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p style="color:red;">ค่าใช้จ่าย</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" value=""  required="required" name="sumPrice" id="sumPrice" style="text-align:right" readonly="readonly">
								</div>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p style="color:red">ค้างชำระ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" value=""  name="payment" id="payment" readonly="readonly" style="text-align:right" required="required">
								</div>
							</div>
						</div>
						<input type="hidden" id="cage_id" name="cage_id" class="form-control" readonly="readonly" />
						<input type="hidden" id="sizeId" name="sizeId" class="form-control" readonly="readonly" />
						<input type="hidden" id="deposit_status" name="deposit_status" value="1" class="form-control" readonly="readonly" />
						<input type="hidden" name="pet_id" value="<%=request.getParameter("pet_id")%>"> 
						<input type="hidden" name="owner_id" value="<%=request.getParameter("owner_id")%>"> 
						<input type="hidden" name="cage_status" value="1"> 
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group" align="center">
						<input name="calPayment" class="btn btn-success" type="button" id="calPayment" onclick="JavaScript:return fnccheck('9');" value="คำนวณค่าใช้จ่าย">
						<input name="confrimDeposit" class="btn btn-success" type="submit" value="ยืนยันการฝากเลี้ยง">
						
					</div>
				</div>
				
			</form>
			</div>
									
		</div>
		
<%@ include file="footer_index.jsp"%>
