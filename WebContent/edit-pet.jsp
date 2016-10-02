<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp" %>
<script language="JavaScript">
       function editConfirm(){
              if(confirm(' ต้องการแก้ไขข้อมูลใช่ไหม!!! ')){
                     return true; // ถ้าตกลง OK โปรแกรมก็จะทำงานต่อไป
              }else{
                     return false; // ถ้าตอบ Cancel ก็คือไม่ต้องทำอะไร
              }
       }
</script>
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
<br><br><br><br>
<div class="container">
	<div class="row">
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<h3 align="center">แก้ไข ข้อมูลสัตว์เลี้ยงของคุณ : <%=new String(request.getParameter("owner_name").getBytes("ISO8859_1"), "UTF8") %> <%=new String(request.getParameter("owner_lname").getBytes("ISO8859_1"), "UTF8") %></h3>
		<br />
		<form name="form1" id="form1" method="POST" action="UpdatePetServlet"
			style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<p>ชื่อสัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_name" id="pet_name"
									value="<%=request.getParameter("pet_name")%>"
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
									<input type="text" name="pet_category" id="pet_category"
									value="<%=request.getParameter("pet_category")%>"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										required="required" />
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
										value="<%=request.getParameter("pet_gene")%>"
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
									<select name="pet_gender" id="pet_gender" 
									value="<%=request.getParameter("pet_gender")%>" class="form-control"
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
									value="<%=request.getParameter("pet_weight")%>"
										placeholder="น้ำหนัก" class="form-control" required="required" />
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
									<input type="text" name="pet_birthday" id="mydateth"
									value="<%=request.getParameter("pet_birthday")%>"
										placeholder="วันเกิด " class="form-control"
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
									<input type="text" name="pet_age" id="age"
									value="<%=request.getParameter("pet_age")%>"
										placeholder="อายุ" class="form-control" required="required" />

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
										placeholder="ตำหนิ/สี" id="pet_extra" ><%=request.getParameter("pet_extra")%></textarea>
								</div>
							</div>
						</div>
						<br>
						<br>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group" style="text-align: right">
									<input type="hidden" name="reference_owner_id" value="<%=request.getParameter("owner_id") %>">
									<input type="hidden" name="edit_id"
										value="<%=request.getParameter("edit_id")%>"> 
									<input type="hidden" name="owner_name"
										value="<%=request.getParameter("owner_name")%>"> 
										<input type="hidden" name="owner_lname"
										value="<%=request.getParameter("owner_lname")%>"> 
									<input
										type="submit" name="submit" id="submit"
										class="btn btn-success" value="บันทึกการแก้ไข"
										onclick="editConfirm()" />
								</div>
							</div>

						</div>
						</div>
			</div>
		</div>
		</form>
	</div>
</div>

<%@ include file="footer_index.jsp"%>
