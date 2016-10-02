<%@page import="dao.CageTypeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
String day = request.getParameter("days");
%>
<br>
<br>
<br>
<br>

<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="pet_depositView.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
<div class="col-sm-14">
		
		<form name="form1" id="form1" method="POST"
			action="InsertPetDepositServlet"
			style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">
				
				<div class="col-sm-6">
<h3 align="center">ข้อมูลการฝากลี้ยง</h3>
		<br />
				<div class="col-sm-6">
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<p align="right">อัตราการรับฝากเลี้ยง</p>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<input type="text" name="rates_price" id="rates_price"
							value="<%=request.getParameter("rates_price")%>"
							class="form-control" readonly="readonly" />
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<p align="right">อาหารสัตว์เลี้ยง</p>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<input type="text" name="deposit_food" id="deposit_food"
							value="<%=request.getParameter("deposit_food")%>"
							class="form-control" readonly="readonly" /> 
						<input type="text"
							name="food_detail" id="food_detail"
							value="<%=request.getParameter("food_detail")%>" class="form-control" readonly="readonly" />
						<input type="text" name="food_price" id="food_price"
							value="<%=request.getParameter("food_price")%>"  class="form-control"
							readonly="readonly" />
					</div>

				</div>

			</div>

			
			
			</div>
			
			
			<div class="col-sm-6">
					<div class="form-group">
					
			
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<p align="right">เริ่ม</p>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<input type="text" name="from" id="from"
							value="<%=request.getParameter("from")%>"  class="form-control"
							readonly="readonly"/>

					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<p align="right">ถึง</p>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<input type="text" name="to" id="to"
							value="<%=request.getParameter("to")%>"  class="form-control"
							readonly="readonly" />

					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<p align="right">เป็นเวลา</p>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<input type="text" id="num_days" name="num_days" class="form-control"
						value="<%=day%>" 
							readonly="readonly" />
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<p align="right">ค่าใช้จ่าย</p>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<input type="text" id="result" name="result" class="form-control"
							readonly="readonly" value=""/>
					</div>
				</div>

			</div>
			</div>
			</div>
			
			
			</div>
			
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group" style="text-align: center">
						<input
							type="hidden" name="reference_owner_id"
							value="<%=request.getParameter("owner_id")%>"> <input
							type="submit" name="submit" id="submit" class="btn btn-success"
							value="ยืนยันการฝากเลี้ยง" />
					</div>
				</div>

			</div>

		</form>
		</div>
		</div>
			

<%@ include file="footer_index.jsp"%>
