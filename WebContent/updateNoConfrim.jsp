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
	
	alert('ยกเลิกการส่งข้อมูลตรวจเรียบร้อย');
	window.location="ShowPetServlet?owner_id=<%=request.getParameter("owner_id")%>&owner_name=<%=new String(request.getParameter("owner_name").getBytes("ISO8859_1"), "UTF8") %>&owner_lname=<%=new String(request.getParameter("owner_lname").getBytes("ISO8859_1"), "UTF8") %>&page_ownerView=<%=request.getParameter("page_ownerView")%>"


</script>

</body>
</html>