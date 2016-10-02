<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ออกรายงาน</title>
</head>
<body>
<script language="javascript">

	alert('ออกรายงานเรียบร้อยแล้ว');
	window.location="UpdateStatusPetDepositServlet?deposit_id=<%=request.getParameter("deposit_id")%>&cage_id=<%=request.getParameter("cage_id")%>";


</script>

</body>
</html>