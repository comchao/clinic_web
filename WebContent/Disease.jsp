<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.CalendarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
<%@page import="dao.DiseaseDAO,model.SymptomsBean"%>
 <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="./nicelabel/css/jquery-nicelabel.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript">

</script>


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
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
	
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
.tr_head{   
    background-color:#333333;  
    color:#FFFFFF;  
}  
/* class สำหรับแถวแรกของรายละเอียด */  
.tr_odd{  
    background-color:#F8F8F8;  
}  
/* class สำหรับแถวสองของรายละเอียด */  
.tr_even{  
    background-color:#F2F2F2;  
}  
</style> 
<script language="javascript">  
  window.onload = function () {      
        var a=document.getElementById('mytable'); // อ้างอิงตารางด้วยตัวแปร a  
        for(i=0;i<a.rows.length;i++){ // วน Loop นับจำนวนแถวในตาราง  
            if(i>0){  // ตรวจสอบถ้าไม่ใช่แถวหัวข้อ  
                if(i%2==1){   // ตรวจสอบถ้าไม่ใช่แถวรายละเอียด  
                    a.rows[i].className="tr_odd";     // กำหนด class แถวแรก  
                }else{  
                    a.rows[i].className="tr_even";  // กำหนด class แถวที่สอง  
                }     
            }else{ // ถ้าเป็นแถวหัวข้อกำหนด class   
                a.rows[i].className="tr_head";    
            }     
        }  
 }  
 </script>  
 
 
 
 
 
 
 
 
	<h3> วิเคราะห์โรคฐานพื้นของสัตว์เลี้ยง </h3>
	<br>
							
				<%
										ArrayList<SymptomsBean> diseaseList = (ArrayList) session.getAttribute("symptom");

										SymptomsBean bean;
										for (int i = 0; i < diseaseList.size(); i++) {
											bean = (SymptomsBean) diseaseList.get(i);
									%>
			

	
						
					
								
	
		
		
		
	
		
		
		<div class="col-md-7">
			<form action="DiseaseGetSymptomServlet" method="post">
		<input name="symptom<%=i%>"  type="hidden" value="<%=bean.getSymptom()%>" ><%=bean.getSymptom()%>
									
								
         
        
</div>



          <div class="col-md-1">
        <div id="text-radio">
		
          <input class="text-nicelabel" data-nicelabel='{"position_class": "text_radio", "checked_text": "มาก", "unchecked_text": "มาก"}' type="radio" name="value<%=i%>" value="1"  />	
            </div>
          </div>
              <div class="col-md-1">
        <div id="text-radio">
		
         <input class="text-nicelabel" data-nicelabel='{"position_class": "text_radio", "checked_text": "น้อย", "unchecked_text": "น้อย"}' type="radio" name="value<%=i%>"  value="0.5"   />	
            </div>
          </div>
              <div class="col-md-2">
        <div id="text-radio" align="left">
		
         <input class="text-nicelabel" data-nicelabel='{"position_class": "text_radio", "checked_text": "ไม่พบอาการ", "unchecked_text": "ไม่พบอาการ"}' checked type="radio" name="value<%=i%>"  value="0" />
            </div>
          </div>

		
		
					
										
									<%
										}
									%> 
							

  <table >
  <tr>
    <th><input name="submit"type="submit" class="btn btn-success" value="วิเคราะห์โรค" > </form></th>
    <th width="5%"></th>
    
    <th><form action="AddDisease.jsp" method="post"><input name="submit" value="เพิ่มข้อมูลโรค" type="submit" class="btn btn-success" > </form></th>
    <th width="5%"></th>
    <th><form action="EditDisease.jsp" method="post"><input name="submit" value="ข้อมูลโรค" type="submit" class="btn btn-success" > </form></th>
  </tr>
  <tr>
   
  </tr>
</table>
</center>	
<br><br><br>						
	<script src="./nicelabel/js/jquery.nicelabel.js"></script>
	<script>
	$(function(){
		$('#rect-checkbox > input').nicelabel();
		$('#rect-radio > input').nicelabel();
		$('#circle-checkbox > input').nicelabel();
		$('#circle-radio > input').nicelabel();
		$('#text-checkbox > input').nicelabel();
		$('#text-radio > input').nicelabel();
		$('#text-checkbox-ico > input:eq(0)').nicelabel({
			checked_ico: './ico/checked.png',
			unchecked_ico: './ico/unchecked.png'
		});
		$('#text-checkbox-ico > input:eq(1)').nicelabel({
			checked_ico: './ico/checked.png',
			unchecked_ico: './ico/unchecked.png'
		});
		$('#text-checkbox-ico > input:eq(2)').nicelabel({
			checked_ico: './ico/checked.png',
			unchecked_ico: './ico/unchecked.png'
		});
		$('#text-checkbox-ico > input:eq(3)').nicelabel({
			uselabel: false
		});
		
	});
	</script><script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>								
	
    
<%@ include file="footer_index.jsp"%>