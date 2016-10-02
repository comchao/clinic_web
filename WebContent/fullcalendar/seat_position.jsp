<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
$(function() {
$( "#datepicker" ).datepicker({
	dateFormat: 'yy-mm-dd' 
	});
});
</script>

</head>
<body>
<h1></h1>
<table border="1">
<tr><td></td><td></td><td></td></tr>
<tr>
	<td><input type="text" id="datepicker" name="play_date"></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
</table>
</body>
</html>