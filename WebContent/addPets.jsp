<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" href="css/jquery.datetimepicker.css">  
<script src="js/jquery.min.js"></script>      
<script src="js/jquery.datetimepicker.full.js"></script>  
<script type="text/javascript" src="js/moment-with-locales.min.js"></script>      
<script type="text/javascript">  
$(function(){  
      
    var thaiYear = function (ct) {  
        var leap=3;    
        var dayWeek=["พฤ.", "ศ.", "ส.", "อา.","จ.", "อ.", "พ."];    
        if(ct){    
            var yearL=new Date(ct).getFullYear()-543;    
            leap=(((yearL % 4 == 0) && (yearL % 100 != 0)) || (yearL % 400 == 0))?2:3;    
            if(leap==2){    
                dayWeek=["ศ.", "ส.", "อา.", "จ.","อ.", "พ.", "พฤ."];    
            }    
        }                
        this.setOptions({    
            i18n:{ th:{dayOfWeek:dayWeek}},dayOfWeekStart:leap,    
        })                  
    };  
      
    $("#mydateth").datetimepicker({  
        timepicker:false,  // กำหนด ไม่แสดงตัวเลือกเวลา    
        format:'d-m-Y',  // กำหนดรูปแบบวันที่ ที่ใช้ เป็น 00-00-0000    
        lang:'th',  // แสดงภาษาไทย    
        onShow:thaiYear,  
        onChangeMonth:thaiYear,  
		onSelectDate:function(dp,$input){
			var yearT=new Date(dp).getFullYear()-0;  
			var yearTH=yearT+543;
			var fulldate=$input.val();
			var fulldateTH=fulldate.replace(yearT,yearTH);
			$input.val(fulldateTH);
		}
 
    });     
      
    $("#mydateth").on("change",function(){    
        var dayBirth=$(this).val();    
        var getdayBirth=dayBirth.split("-");    
        var YB=getdayBirth[2]-543;    
        var MB=getdayBirth[1];    
        var DB=getdayBirth[0];    
            
        var setdayBirth=moment(YB+"-"+MB+"-"+DB);      
        var setNowDate=moment();    
        var yearData=setNowDate.diff(setdayBirth, 'years', true); // ข้อมูลปีแบบทศนิยม    
        var yearFinal=Math.round(setNowDate.diff(setdayBirth, 'years', true),0); // ปีเต็ม    
        var yearReal=setNowDate.diff(setdayBirth, 'years'); // ปีจริง    
        var monthDiff=Math.floor((yearData-yearReal)*12); // เดือน    
        var str_year_month=yearReal+" ปี "+monthDiff+" เดือน"; // ต่อวันเดือนปี    
        $("#age").val(str_year_month);    
  
    });    
      
});  
</script>           
<br><br><br>
<br>
<br>
<br>

<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
	<div class="row">
		<h3 align="center">เพิ่มข้อมูลสัตว์เลี้ยง</h3>
		<br />
		<form name="form1" id="form1" method="POST" action="InsertPetServlet"
			style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>สัตว์เลี้ยงของ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text"
										 class="form-control"
										value="<%=new String(request.getParameter("owner_name").getBytes("ISO8859_1"), "UTF8") %> <%=new String(request.getParameter("owner_lname").getBytes("ISO8859_1"), "UTF8") %>" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ชื่อสัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_name" id="pet_name"
										placeholder="ชื่อสัตว์เลี้ยง" class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ประเภท</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<select name="pet_category" id="pet_category" class="form-control"
										required="required">
										<option value="สุนัข">สุนัข</option>
										<option value="แมว">แมว</option>
										<option value="กระต่าย">กระต่าย</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>พันธุ์</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gene" id="pet_gene"
										placeholder="พันธุ์สัตว์เลี้ยง" class="form-control"
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
									<select name="pet_gender" id="pet_gender" class="form-control"
										required="required">
										<option value="เพศผู้">ผู้</option>
										<option value="เพศเมีย">เมีย</option>
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
									<p>น้ำหนัก</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_weight" id="pet_weight"
										placeholder="น้ำหนัก/ก.ก." class="form-control" required="required" />
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
								
									<input type="text" name="pet_birthday" id="mydateth" value=""
										placeholder="dd-mm-yyyy " class="form-control"
										required="required" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>อายุ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_age" id="age" value=""
										placeholder="อายุ" class="form-control" required="required" readonly="readonly" />

								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ตำหนิ/สี</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<textarea name="pet_extra" rows="5" class="form-control"
										placeholder="ตำหนิ/สี" id="pet_extra" required
										data-validation-required-message="Please enter a petgens."></textarea>
								</div>
							</div>
						</div>
						<!-- 
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<p>รูป</p>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
											<input type="file" name="Pet_Picture" id="Pet_Picture"
												class="form-control">
											</div>
										</div>
									</div>
						-->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group" style="text-align: right">
					<input type="hidden" name="owner_id" value="<%=request.getParameter("owner_id") %>">
					<input type="hidden" name="owner_name" value="<%=request.getParameter("owner_name")%>">
					<input type="hidden" name="owner_lname" value="<%=request.getParameter("owner_lname")%>">
					<input type="hidden" name="pet_name" value="<%=request.getParameter("pet_name")%>">
					<input type="hidden" name="pet_category" value="<%=request.getParameter("pet_category")%>">
					<input type="hidden" name="pet_gene" value="<%=request.getParameter("pet_gene")%>">
					<input type="hidden" name="pet_gender" value="<%=request.getParameter("pet_gender")%>">
					<input type="hidden" name="pet_weight" value="<%=request.getParameter("pet_weight")%>">
					<input type="hidden" name="pet_birthday" value="<%=request.getParameter("pet_birthday")%>">
					<input type="hidden" name="pet_age" value="<%=request.getParameter("pet_age")%>">
					<input type="hidden" name="pet_extra" value="<%=request.getParameter("pet_extra")%>">
					<input type="submit" name="submit" id="submit"
							class="btn btn-success" value="บันทึกข้อมูลสัตว์เลี้ยง" onclick="cal(value)" />
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="footer_index.jsp"%>
