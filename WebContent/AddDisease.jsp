<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.CalendarBean,model.AnalysisBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<%@page import="dao.DiseaseDAO,model.SymptomsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}
/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}
</style>
<link rel="stylesheet" href="demo.css">
<br>
<br>
<br>
<br>
<script>
	function editConfirm() {
		if (confirm("คุณต้องการแก้ไขข้อมูลสินค้าใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
	function delConfirm() {
		if (confirm("คุณต้องการลบข้อมูลสินค้าใช่หรือไม่?")) {
			return true;
		}
		return false;
	}
</script>
<script type="text/javascript">
	function dateTime($tDate) //แปลงวันที่เป็นวันที่ไทย
	{
		$y = substr($tDate, 0, 4);
		$m = substr($tDate, 5, 2);
		$d = substr($tDate, 8, 9);
		if ($tDate == "") {
			return "";
		} else {
			return $y + "-" + $m + "-" + $d;
		}
	}
</script>

<script>
	// Get the modal
	var modal = document.getElementById('myModal');
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	// When the user clicks the button, open the modal
	btn.onclick = function() {
		modal.style.display = "block";
	}
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
<center>
	<style type="text/css">
/* class สำหรับแถวส่วนหัวของตาราง */
.tr_head {
	background-color: #333333;
	color: #FFFFFF;
}
/* class สำหรับแถวแรกของรายละเอียด */
.tr_odd {
	background-color: #F8F8F8;
}
/* class สำหรับแถวสองของรายละเอียด */
.tr_even {
	background-color: #F2F2F2;
}
</style>
	<script language="javascript">
		window.onload = function() {
			var a = document.getElementById('mytable'); // อ้างอิงตารางด้วยตัวแปร a  
			for (i = 0; i < a.rows.length; i++) { // วน Loop นับจำนวนแถวในตาราง  
				if (i > 0) { // ตรวจสอบถ้าไม่ใช่แถวหัวข้อ  
					if (i % 2 == 1) { // ตรวจสอบถ้าไม่ใช่แถวรายละเอียด  
						a.rows[i].className = "tr_odd"; // กำหนด class แถวแรก  
					} else {
						a.rows[i].className = "tr_even"; // กำหนด class แถวที่สอง  
					}
				} else { // ถ้าเป็นแถวหัวข้อกำหนด class   
					a.rows[i].className = "tr_head";
				}
			}
		}
	</script>
	<style>
header, section {
	display: block;
}

body {
	font-family: 'Droid Serif';
}

h1, h2 {
	text-align: center;
	font-weight: normal;
}

#features {
	margin: auto;
	width: 460px;
	font-size: 0.9em;
}

.connected, .sortable, .exclude, .handles {
	margin: auto;
	padding: 0;
	width: 310px;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.sortable.grid {
	overflow: hidden;
}

.connected li, .sortable li, .exclude li, .handles li {
	list-style: none;
	border: 1px solid #CCC;
	background: #F6F6F6;
	font-family: "Tahoma";
	color: #1C94C4;
	margin: 5px;
	padding: 5px;
	height: 40px;
}

.handles span {
	cursor: move;
}

li.disabled {
	opacity: 0.5;
}

.sortable.grid li {
	line-height: 80px;
	float: left;
	width: 80px;
	height: 80px;
	text-align: center;
}

li.highlight {
	background: #FEE25F;
}

#connected {
	width: 440px;
	overflow: hidden;
	margin: auto;
}

.connected {
	float: left;
	width: 200px;
}

.connected.no2 {
	float: right;
}

li.sortable-placeholder {
	border: 1px dashed #CCC;
	background: none;
}
</style>




<form action="AddDataDiseaseServlet" method="post">

		<div class="col-lg-4">
			<div class="cont1">
				<div class="panel">
					<div class="panel-heading">
						<h4><b>เพิ่มข้อมูลโรคสัตว์เลี้ยง</b></h4></div>
					<div class="panel-body">
						
							<div class="row">
							<div class="col-sm-2">
								<div>
									<p>ชื่อโรค</p>
								</div>
								
								
							</div>
							
							<div class="col-sm-5">
								<div class="form-group">
								
										<select name="disease"  class="form-control"
										required="required">
										<option value="">--โปรดเลือก--</option>
										
								<%
								DiseaseDAO dao1 = new DiseaseDAO();

								List<AnalysisBean> List1 = dao1.disease();
								response.setCharacterEncoding("utf-8");
								for (int i1 = 0; i1 < List1.size(); i1++) {
									AnalysisBean bean = List1.get(i1);
									
								%>
								        
										<option value="<%=bean.getDisease()%>"><%=bean.getDisease()%></option>
								<%
								}
								%>
								</select>
							
								
								</div>
									
								
								
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>อาการของโรค</p>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
								<ul class="connected list">
                                <font color="red"><p><h6>*กรุณา ลาก วาง อาการของโรค*</h6></p></font>
                              
                                
                                
								</ul>
								
								<br><br><br><br><br><br><br><br><br><br><br><br><br>
								
							
								</div>
								<div align="right">
	
	<input type="submit" value="บันทึกข้อมูล" class="btn btn-success" />
	
	 </form>
							</div>
							</div>  
							
	</div>  

<br />  
</div></div></div>

  
						
	
		




					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</div></div></div>
                 
                    
                    
                    
                    
                    
                    
                    <div class="col-lg-8">
			<div class="cont1">
				<div class="panel">
					<div class="panel-heading">
						<h4><b>ข้อมูลอาการโรคของสัตว์</b></h4></div>
					<div class="panel-body">
					
					
					
					
						<div class="row">
    <div class="col-sm-4">  
    <ul class="connected list">
			<p>ระบบทางเดินอาหาร</p>
			 	<%
				DiseaseDAO dao3 = new DiseaseDAO (); 
List<SymptomsBean >List3 =dao3.Symptom_Type(); 
for(int i3 = 0;i3 < List3.size();i3++){
	SymptomsBean bean = List3.get(i3); %>
	
 
					
			<%if(bean.getSymptom_Type().equals("อาการที่เกี่ยวกับระบบทางเดินอาหาร")){%>
			 	<input name="symptom<%=i3%>"  type="text" value="<%=bean.getSymptom()%>" readonly="readonly" class="form-control" required="required"  />	</li>
			
				<%}}%>			
			</ul>
    
    
    </div>
    
    
    <div class="col-sm-4"> 
    <ul class="connected list">
			<p>ระบบสืบพันธุ์และทางเดินปัสสาวะ</p>
			 	<%
				DiseaseDAO dao4 = new DiseaseDAO (); 
List<SymptomsBean >List4=dao4.Symptom_Type(); 
for(int i4 = 0;i4<List4.size();i4++){
	SymptomsBean bean = List3.get(i4); %>
	
 
					
			<%if(bean.getSymptom_Type().equals("อาการที่เกี่ยวกับระบบสืบพันธุ์และทางเดินปัสสาวะ")){%>
			 		<input name="symptom<%=i4%>"  type="text" value="<%=bean.getSymptom()%>" readonly="readonly" class="form-control" required="required"  />	</li>
			
				<%}}%>	
			</ul>
			<ul class="connected list">
			<p>อาการทางผิวหนัง</p>
			<%
				DiseaseDAO dao6 = new DiseaseDAO (); 
List<SymptomsBean >List6=dao6.Symptom_Type(); 
for(int i6 = 0;i6<List6.size();i6++){
	SymptomsBean bean = List6.get(i6); %>
	
 
					
			<%if(bean.getSymptom_Type().equals("อาการทางผิวหนัง")){%>
			 		<input name="symptom<%=i6%>"  type="text" value="<%=bean.getSymptom()%>" readonly="readonly" class="form-control" required="required"  />	</li>
			
				<%}}%>	
			</ul>
			<ul class="connected list">
			<p>อาการทางระบบหมุนเวียนโลหิต</p>
			<%
			DiseaseDAO dao = new DiseaseDAO (); 
List<SymptomsBean >List=dao.Symptom_Type(); 
for(int i = 0;i<List.size();i++){
	SymptomsBean bean = List.get(i); %>
	
 
					
			<%if(bean.getSymptom_Type().equals("อาการทางระบบหมุนเวียนโลหิต")){%>
				<ul><input name="symptom<%=i%>"  type="text" value="<%=bean.getSymptom()%>" readonly="readonly"  class="form-control" required="required"  />	</ul>
				
				</ul>
			 
			
				<%}}%>	


    </div>
    <div class="col-sm-4">
		
			<ul class="connected list">
			<p>อาการทางระบบทางเดินหายใจ<p>
							<%
				DiseaseDAO dao2 = new DiseaseDAO (); 
List<SymptomsBean >List2=dao2.Symptom_Type(); 
for(int i2 = 0;i2<List2.size();i2++){
	SymptomsBean bean = List2.get(i2); %>
	
 
					
			<%if(bean.getSymptom_Type().equals("อาการทางระบบทางเดินหายใจ")){%>
			 	<input name="symptom<%=i2%>"  type="text" value="<%=bean.getSymptom()%>" readonly="readonly" class="form-control" required="required"  />	</li>
			
				<%}}%>			
			
			</ul>
			<ul class="connected list">
				<p>ระบบประสาท</p>
			 	<%
				DiseaseDAO dao5 = new DiseaseDAO (); 
List<SymptomsBean >List5=dao5.Symptom_Type(); 
for(int i5 = 0;i5<List5.size();i5++){
	SymptomsBean bean = List3.get(i5); %>
	
 
					
			<%if(bean.getSymptom_Type().equals("อาการที่เกี่ยวกับระบบประสาท")){%>
			 		<input name="symptom<%=i5%>"  type="text" value="<%=bean.getSymptom()%>" readonly="readonly" class="form-control" required="required"  />	</li>
			
				<%}}%>	
			</ul>
				
			
	</div>
	
	
	
	
	<div class="row" align="right">
    <div class="col-sm-12">  
    <input type="submit" value="เพิ่มอาการ" class="btn btn-success"  onClick="Javascript:windowOpenCage();" /> <input type="submit" value="เพิ่มโรค" class="btn btn-success"  onClick="Javascript:windowOpenCage1();" />
     
	 </div>
   
	
    <div class="col-sm-6"> 
   
     </div>
</div>
	<script>
					
	 
			
					
					
									function windowOpenCage() {
										
										var myCage=window.open('Add_Symptom.jsp','windowRef','width=990,height=500,top=110,left=30');
										if (!myCage.opener) myCage.opener = self;
									}
					</script> 
					<script>
					
			
					
					
									function windowOpenCage1() {
										
										var myCage=window.open('Add_Diseas.jsp','windowRef','width=990,height=500,top=110,left=30');
										if (!myCage.opener) myCage.opener = self;
									}
					</script> 

	<div align="right">
	
	
	
	</div>
		
		
			
	</div></div>
	  
                    
	
	 
	
</div>

	
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</div></div></div>
	
	
</div>

					
						
	
			
			
	
	






<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.sortable.js"></script>
<script>
	$(function() {
		$('.sortable').sortable();
		$('.handles').sortable({
			handle : 'span'
		});
		$('.connected').sortable({
			connectWith : '.connected'
		});
		$('.exclude').sortable({
			items : ':not(.disabled)'
		});
	});
</script>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>



