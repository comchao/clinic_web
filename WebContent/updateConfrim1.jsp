<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<script language="javascript">
	
	alert('ส่งข้อมูลตรวจเรียบร้อย');
	window.location="AppointmentSservlet?id=<%=request.getParameter("id")%>&Status=<%=new String(request.getParameter("Status").getBytes("ISO8859_1"), "UTF-8") %>"


</script>

</body>
</html>