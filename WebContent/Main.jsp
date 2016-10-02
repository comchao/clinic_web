<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
<title>number</title>
</head>
<body>
    <script>
function hiddenn(pvar) {
	 if(pvar==0){
		document.getElementById("txt1").style.display = 'none';
	 }else{
	 document.getElementById("txt1").style.display = '';
	 }
	 
}
</script>
<body onload="hiddenn('0')">
EMS
<form>
<input type="radio" name="type" value="sendme" onclick="hiddenn('0')" /> Send Me<br />
<input type="radio" name="type" value="other"  onclick="hiddenn('1')" /> Other
<input type="text" name="txt1" id="txt1" /> 

</form>


</body>
</html>
