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

	alert('เพิ่มอาหารสัตว์เลี้ยงเรียบร้อย');
	window.location="ShowShopDetailServlet?deposit_id=<%=Integer.parseInt(request.getParameter("refer_petdeposit"))%>&cage_id=<%=Integer.parseInt(request.getParameter("cage_id"))%>";


</script>

</body>
</html>