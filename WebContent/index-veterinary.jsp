<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp" %>

    <!--Veterinary-Menu Grid Section -->
    <section id="officer-menu">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>รายการ</h3>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 officer-menu-item">
                    <a href="showPetWaitingServlet" class="officer-menu-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <center><img src="img/portfolio/Calendar-Time-512.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>คิวรอตรวจ</h6></center>
				</a>
                </div>
                <div class="col-sm-3 officer-menu-item">
                    <a href="showHistoryServlet" class="officer-menu-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                       <center> <img src="img/portfolio/download.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>ประวัติการรักษา</h6></center>
				</a>
                </div>
                <!-- ปฎิทิน -->
			
		<div class="col-sm-3 officer-menu-item">
				<a href="ShowCalendar1.jsp"class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/calendar-flat-2.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>ปฏิทินนัดหมาย</h6></center>
				</a>
				
			</div>
			
			 <!--ข้อมูลนัดหมาย-->
			
		<div class="col-sm-3 officer-menu-item">
				<a href="CalendarServlet2?id=<%=session.getAttribute("id")%>"class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/clients-on-calendar.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>ข้อมูลนัดหมาย</h6></center>
				</a>
				
			</div>
			
			
			
			
			<!-- วินิฉัย -->
			<div class="col-sm-3 officer-menu-item">

				<a href="DiseaseGetSymptomServlet"class="officer-menu-link"
					data-toggle="modal">
					
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/stethoscope_medical_exam_heartbeat_equipment_cardiology_heart_pulse_flat_design_icon-512.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>วินิจฉัยโรค</h6></center>
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
					</div> <center><img src="img/portfolio/doc.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>รายงาน</h6></center>
				</a>
			</div>
			<!--สถิติ-->
			<div class="col-sm-3 officer-menu-item">
				<a href="chart_all.jsp" class="officer-menu-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <center><img src="img/portfolio/analytics-512.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>สถิติ</h6></center>
				</a>
			</div>
			
			
                <% 
							if (session.getAttribute("typecode") == "1") {
				%>
                
                <div class="col-sm-3 officer-menu-item">
                    <a href="ShowMemServlet" class="officer-menu-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                       <center> <img src="img/portfolio/asistante_icon-icons.com_55049.png" class="img-responsive" alt="" width="130" height="130"><font color="#33CC99"><h6>ข้อมูลพนักงาน</h6></center>
				</a>
                </div>
                
                
                	
                
                
                
                <%
							}
				%>
                
                
            </div>
        </div>
    </section>

    
<%@ include file="footer_index.jsp" %>