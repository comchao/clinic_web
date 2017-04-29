<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_login.jsp" %>
    <!-- Header -->
    <header>
        <div class="container">
           <div class="row">
                <img class="img-responsive" src="img/profile.png" alt="วัฒนา รักษาสัตว์">
                <div class="intro-text">
                    <span class="name">วัฒนา รักษาสัตว์</span>
                    <hr class="star-light">
                    <span class="skills">ตรวจรักษาโรค...สัตว์เลี้ยงที่คุณรัก</span><br/>
                    <span class="skills">โรคทั่วไป ผ่าตัด ทำหมัน บริการฉีดยา</span><br/>
                    <span class="skills">บริการรับฝากเลี้ยง(มีพื้นที่ให้สัตว์เลี้ยงวิ่งเล่น)</span><br/>
                    <span class="skills">เปิดให้บริการ 09.00 - 20.00 น.</span><br/>
                </div>
            </div>
        </div>
    </header>
    <!--Login Form -->	
        <div id="logindiv">			
            <form class="form" action="LoginServ" id="login" method="POST" >
                <img src="img/button/button_cancel.png" class="img" id="cancel"/>	
                <h3>-เข้าสู่ระบบ-</h3><br>
                <div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<h5>Username</h5>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="form-group">
							<input type="text" name="un" id="username" placeholder="Username"/><br/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<h5>Password</h5>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="form-group">
							<input type="password" name="pw"  id="password"  placeholder="**********"/><br/>
						</div>
					</div>
				</div>
                <h3><input type="submit" id="loginbtn" class="btn btn-success" value="เข้าสู่ระบบ"/></h3>
            </form>
        </div>
<%@ include file="footer_index.jsp" %>
