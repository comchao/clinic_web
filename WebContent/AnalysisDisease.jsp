<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="dao.DiseaseDAO"%>
<%@page import="model.AnalysisBean"%>
<%@ include file="header_index.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>

<h2>ผลของการวิเคราะห์โรค</h2><br>


<%

DiseaseDAO dao = new DiseaseDAO();  

List<AnalysisBean> List = dao.getAnalysis();
response.setCharacterEncoding("utf-8");
for(int i = 0;i<List.size();i++){
AnalysisBean bean = List.get(i);

 
 

%>	 
	
       
        
         <h4> <%=bean.getDisease()%><h4>
        <%--    <%=bean.getTotal()%> --%>
        
           
       
           
           
       
           
           
           
           
           
<%}%>

   
           </form></center>
</body>
</html>
<%@ include file="footer_index.jsp"%>