<%@page import="com.oreilly.servlet.multipart.LimitedServletInputStream"%>
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
<br>

<%

DiseaseDAO dao = new DiseaseDAO();  

List<AnalysisBean> List = dao.getAnalysis();
response.setCharacterEncoding("utf-8");
for(int i = 0;i<List.size();i++){
AnalysisBean bean = List.get(i);

 
 

%>	 

	
	
	
	

       
        
         <h3> <%=bean.getDisease()%><h3>
      <%--   <%=bean.getTotal()%>  --%>
        
           <br><br>
       
           
           
       
           
           
           
           
           
<%}%>
<br>
<%

DiseaseDAO dao2 = new DiseaseDAO();  
List<AnalysisBean> List2 = dao2.Analysis();
response.setCharacterEncoding("utf-8");
for(int i2 = 0;i2<List2.size();i2++){
AnalysisBean bean2 = List2.get(i2);
%>	

<form action="ClearDataServlet" method="post">

<input name="id[]" type="hidden" value="<%=bean2.getId()%>">
 <%}%>
<input type="submit" name="submit"
								id="submit" class="btn btn-success" value="Clear Data"
								onclick="cal(value)" /></form> 
  
  
           </center>
</body>
</html>
<%@ include file="footer_index.jsp"%>