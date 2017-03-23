<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String owner_id = request.getParameter("owner_id");
		String owner_name = request.getParameter("owner_name");
		String owner_lname = request.getParameter("owner_lname");
		String id = request.getParameter("id");
		String idmenber = request.getParameter("idmenber");
	%>



<%=id %>

</body>
</html>