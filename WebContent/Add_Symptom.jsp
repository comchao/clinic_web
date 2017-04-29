<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.CalendarBean,model.AnalysisBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>

<%@page import="dao.DiseaseDAO,model.SymptomsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="dao.PetsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.PetsBean"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.*"%>

<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>


<!-- เรียกใช้งาน bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- เรียกใช้งาน CSS  -->
<link href="css/freelancer.css" rel="stylesheet">
<title>เพิ่มข้อมูลนัดหมายสัตว์เลี้ยง</title>
<!-- Header -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="all" type="text/css" href="jquery-ui.css" />

<link rel="stylesheet" media="all" type="text/css"
	href="jquery-ui-timepicker-addon.css" />


<script type="text/javascript" src="jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="jquery-ui.min.js"></script>


<script type="text/javascript" src="jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript" src="jquery-ui-sliderAccess.js"></script>
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


	<form action="AddSymptomDiseaseServlet" method="post">

		<div class="col-lg-12">
		
						<h4>
							<b>เพิ่มข้อมูลอาการโรคของสัตว์</b>
						</h4>
					</div>
					<div class="panel-body">
						<div class="col-lg-12">
							<div class="row">
								<div class="row">
								
								
							  
<table id="myTbl"  >  
  <tr id="firstTr">  
   <td width="">
    <td width="600"><div class="col-sm-6">
								<div class="form-group">
								<center><p>อาการของโรค</p></center>
									<input type="text" name="symptom[]" id="symptom"
										placeholder="กรุณากรอกอาการ" class="form-control" required="required" />
										<select name="Symptom_Type[]" class="form-control"
										required="required" > 
											<option value="">-- โปรดเลือก --</option>
										<%
			DiseaseDAO dao7 = new DiseaseDAO (); 
List<SymptomsBean >List7=dao7.Symptom_Type1(); 
for(int i7 = 0;i7<List7.size();i7++){
	SymptomsBean bean = List7.get(i7); %>
	
 
					
			
			<option value="<%=bean.getId()%>"> <%=i7+1%>. <%=bean.getSymptom_Type()%>  </option>
			
			
			
		
		
				
			 
			
				<%}%>	
					</select>
								</div>
							</div> </td>   
    
   
      
    </tr>  
</table>  
<br />  
<table width="1540" >  
  <tr>  
   <td width="170">
    <td width="300">
    
  <td width="150">
    <td>  
    <button id="addRow" type="button"  style = "background-color:#228B22">&nbsp;  &nbsp;  +&nbsp;  &nbsp;  </button>    
    &nbsp;  
    <button id="removeRow" type="button" style = "background-color:#B22222" >&nbsp;  &nbsp; - &nbsp;  &nbsp;   </button>  

						
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	<input type="submit" name="submit" id="submit"
	class="btn btn-success" value="บันทึกข้อมูล" onclick="cal(value)" />  
					
    </td>  </form>
  </tr>  
</table>  
								</div>
								</div></div></div></div></div></div>
								
								
								
								
								
								
<script language="javascript" src="jquery-1.3.2.min.js"></script>  
<script type="text/javascript">
	$(function() {
		$("#addRow").click(function() {
			$("#myTbl").append($("#firstTr").clone());
		});
		$("#removeRow").click(function() {
			if ($("#myTbl tr").size() > 1) {
				$("#myTbl tr:last").remove();
			} else {
				alert("ต้องมีรายการข้อมูลอย่างน้อย 1 รายการ");
			}
		});
	});
</script>	
</div></div></div></div></div></div></div></div> 
                    
                    
                    
                    
                    
             
			</ul>
	</div>
					</div>

	
	
	</div>
	
</div>

	
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</div>
	</div>
	</div>
            
<br><br>
<br>            
<br><br>
<br>
            
<br><br>
<br>








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



