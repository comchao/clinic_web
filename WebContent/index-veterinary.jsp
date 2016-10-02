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
                        <img src="img/portfolio/queue.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-3 officer-menu-item">
                    <a href="showHistoryServlet" class="officer-menu-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/treatment.jpg" class="img-responsive" alt="">
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
                        <img src="img/portfolio/member.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                
                <%
							}
				%>
                
                
            </div>
        </div>
    </section>

    
<%@ include file="footer_index.jsp" %>