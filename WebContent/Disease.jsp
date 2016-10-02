<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO,model.CalendarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="header_index.jsp"%>
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
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

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
	if ($tDate == "")
	{
		return "";
	} else
	{
		return  $y+"-"+$m+"-"+$d;
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
<div class="page">
    <h3 class="page-title"><center>วินิฉัยโรคสัตว์</center></h3>

    <form action="">
        <div class="panel">
            <div class="panel-heading">อาการที่พบเบื้องต้น</div>
            <div class="panel-body">
                <ul class="input-list">
                
                    
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio1" name="radio" type="checkbox" class="radio">
                            <label for="radio1">กินน้ำเยอะ</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio2" name="radio" type="checkbox" class="radio">
                            <label for="radio2">กล้ามเนื้อตามร่างกาายกระตุกชัก</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio3" name="radio" type="checkbox" class="radio">
                            <label for="radio3">ตาขุนมัว ภาสะต้อ เเต่จะไม่พบในเเมว</label>
                        </div>
                    </li><li>
                        <div class="pure-radiobutton">
                            <input id="radio4" name="radio" type="checkbox" class="radio">
                            <label for="radio4">ความอยากอาหารลดลง</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio5" name="radio" type="checkbox" class="radio">
                            <label for="radio5">ซึม เบื่ออาหาร อาจมีไข้</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio6" name="radio" type="checkbox" class="radio">
                            <label for="radio6">ตาขุนมัว ภาสะต้อ เเต่จะไม่พบในเเมว</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio7" name="radio" type="checkbox" class="radio">
                            <label for="radio7">ท้องเสีย ถ่ายน้ำ จนถ่ายเป็ยเลือด เหม็นคาว</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio8" name="radio" type="checkbox" class="radio">
                            <label for="radio8">ที่ตา   พบเเผลหลุมที่จระจกตา ตาเเห้ง</label>
                        </div>
                    </li>

                    <li>
                        <div class="pure-radiobutton">
                            <input id="radio9" name="radio" type="checkbox" class="radio">
                            <label for="radio9">น้ำหนักลด</label>
                        </div>
                    </li>
                    <li>
                        <div class="pure-radiobutton">
                            <input id="radio10" name="radio" type="checkbox" class="radio">
                            <label for="radio10">ปัสสาวะมาก</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio11" name="radio" type="checkbox" class="radio">
                            <label for="radio11">พบมากในสัตว์อายุเยอะ</label>
                        </div>
                    </li>

                    <li>
                        <div class="pure-radiobutton">
                            <input id="radio12" name="radio" type="checkbox" class="radio" >
                            <label for="radio12">มีกลิ้นปากฉุน เหมือนแอมโมเนีย</label>
                        </div>
                    </li>
                    <li>
                        <div class="pure-radiobutton">
                            <input id="radio13" name="radio" type="checkbox" class="radio" >
                            <label for="radio13">มีน้ำมูกใสต่อมาข้นเหลือง อาจมีไอหายใจลำบาก</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio14" name="radio" type="checkbox" class="radio" >
                            <label for="radio14">ไม่กินอาหาร อาจมีอาเจียน</label>
                        </div>
                    </li>
                     <li>
                        <div class="pure-radiobutton">
                            <input id="radio15" name="radio" type="checkbox" class="radio" >
                            <label for="radio15">หิวบ่อย กินอาหารมากขั้น เเต่ไม่อ้วน</label>
                        </div>
                    </li>
                    <li>
                     <div class="pure-radiobutton">
                            <input id="radio16" name="radio" type="checkbox" class="radio" >
                            <label for="radio16">อาเจียน</label>
                        </div>
                    </li>
                     <li>
                      <div class="pure-radiobutton">
                            <input id="radio17" name="radio" type="checkbox" class="radio" >
                            <label for="radio17">อาเจียหรือท้องเสีย</label>
                        </div>
                    </li>
                      <li>
                      <div class="pure-radiobutton">
                            <input id="radio18" name="radio" type="checkbox" class="radio" >
                            <label for="radio18">อาเจียมีท้องเสีย เป็นนมูกหรือปนเลือดและอาเจียน</label>
                        </div>
                    </li>
                     <li>
                      <div class="pure-radiobutton">
                            <input id="radio19" name="radio" type="checkbox" class="radio" >
                            <label for="radio19">อาจมีตุ่มหนองตามผิวหนัง ฝ่าเท้าเข็งในรายเรื้อรัง</label>
                        </div>
                    </li>
                    

                </ul>
            </div>
        </div>
        
                </ul>
            </div>
        </div>
    </form>
</div>
</body>
</html>
	
	
</div>
<%@ include file="footer_index.jsp"%>