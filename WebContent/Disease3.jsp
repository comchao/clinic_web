
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="dao.DiseaseDAO"%>
<%@page import="model.AnalysisBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



	<%
		ArrayList<AnalysisBean> List = (ArrayList) session.getAttribute("symptom");
		AnalysisBean bean;
		for (int i = 0; i < List.size(); i++) {
			bean = (AnalysisBean) List.get(i);
	%>
	<%if(bean.getSymptom()!=null){%>
	<td><%=bean.getSymptom()%></td>
	<td><%=bean.getId_symptom()%> </td>
	<td><%=bean.getId_disease()%> </td> 


	<%
		}}
	%>








</body>
</html>