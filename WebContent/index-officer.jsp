<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
							if ((session.getAttribute("typecode") == "1")||(session.getAttribute("typecode") == "3")) {
						%>
							<li class="page-scroll"><a href="index-officer.jsp">พนักงาน</a>
							</li>
						<%
						}
						%>

						<%
						if ((session.getAttribute("typecode") == "1")||(session.getAttribute("typecode") == "2")) {
						%>
							
							<li class="page-scroll"><a href="index-veterinary.jsp">สัตวแพทย์</a></li>
						<%
							
						}
						%>
<%@ include file="header_index.jsp"%>
<!--Officer-Menu Grid Section -->


						
						
<section id="officer-menu">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h4>รายการ</h4>
				
			</div>
		</div>
		<!-- จัดการข้อมูลสัตว์เลี้ยง เจ้าของสัตว์เลี้ยง -->
		<div class="row">
			<div class="col-sm-3 officer-menu-item">
				<a href="showOwnerServlet" class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/girl.png" class="img-responsive" alt="" width="130" height="130"> <h6>ข้อมูลเจ้าของเเละสัตว์เลี้ยง</h6> </center>
				</a>
			</div>
			<!-- รับฝากสัตว์เลี้ยง -->
			<div class="col-sm-3 officer-menu-item">
				<a href="showPetDepositServlet" class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/dog (2).png" class="img-responsive" alt="" width="130" height="130"> <h6>รับฝากสัตว์เลี้ยง </h6> </center>
				</a>
			</div>
			<!-- ข้อมูลรับฝากสัตว์เลี้ยง -->
			<div class="col-sm-3 officer-menu-item">
				<a href="showDepositHistoryServlet" class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/dog (1).png" class="img-responsive" alt=""width="130" height="130"> <h6>ข้อมูลฝากสัตว์เลี้ยง</h6> </center>
				</a>
			</div>
			<!-- ซื้อสินค้า -->
			<div class="col-sm-3 officer-menu-item">
				<a href="ShowPetShopServlet" class="officer-menu-link" data-toggle="modal"><!-- petshop.jsp -->
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/cart.png" class="img-responsive" alt=""width="130" height="130"> <h6>ชื้อสิ้นค้า </h6> </center>
				</a>
			</div>
			<div class="col-sm-3 officer-menu-item">
				<a href="ShowPaymentServlet" class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/money-bag (1).png" class="img-responsive" alt="" width="130" height="130"> <h6>ชำระค่ารักษา </h6> </center>
				</a>
			</div>
			<!-- จัดการข้อมูลยา -->
			<div class="col-sm-3 officer-menu-item">
				<a href="showDrugServlet" class="officer-menu-link" data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/drugs (1).png" class="img-responsive"  alt="" width="130" height="130"> <h6>ข้อมูลยา</h6> </center>
				</a>
			</div>
			<!-- จัดการข้อมูลสินค้า -->
			<div class="col-sm-3 officer-menu-item">
				<a href="showProductServlet" class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/store.png" class="img-responsive"  alt="" width="130" height="130"> <h6>ข้อมูลสิ้นค้า</h6> </center>
				</a>
			</div>
			<!-- รายงานประจำเดือน -->
			<div class="col-sm-3 officer-menu-item">
				<a href="report.jsp" class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/doc.png" class="img-responsive" alt="" width="130" height="130"><h6>รายงาน</h6></center>
				</a>
			</div>
			
			<!-- ปฎิทิน -->
			<div class="col-sm-3 officer-menu-item">
				<a href="CalendarServlet2?id=<%=session.getAttribute("id")%>"class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/calendar (5).png" class="img-responsive" alt="" width="130" height="130"><h6>ตารางนัดหมาย</h6></center>
				</a>
				
			</div>
			
		<div class="col-sm-3 officer-menu-item">
				<a href="ShowCalendar1.jsp"class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/calendar (4).png" class="img-responsive" alt="" width="130" height="130"><h6>ปฏิทินนัดหมาย</h6></center>
				</a>
				
			</div>
			
			<!-- ปฎิทิน -->
			<div class="col-sm-3 officer-menu-item">
				<a href="DiseaseGetSymptomServlet?id=<%=session.getAttribute("id")%>"class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/syringe.png" class="img-responsive" alt="" width="130" height="130"><h6>วินิจฉัยโรค</h6></center>
				</a>
				
			</div>
	</div>
	</div>
		<%-- <form action="showProductServlet" method="get">
				<input type="text" name="id" value="<%=session.getAttribute("id")%>"> 
			     <input type="submit" name="submit" value="submit">
				</form> --%>
</section>


<%@ include file="footer_index.jsp"%>