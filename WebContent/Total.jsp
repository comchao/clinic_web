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
<table>
<tr>
<th><h3>อาการที่พบ<h3></h3></th>
<!-- <th>Totalcolumvalue</th>
<th>Totalcolum</th>
<th>Total</th> -->
</tr>
<%

DiseaseDAO dao = new DiseaseDAO();  

List<AnalysisBean> List = dao.getvaluecolum();
response.setCharacterEncoding("utf-8");
for(int i = 0;i<List.size();i++){
AnalysisBean bean = List.get(i);

 
 

%>	 <tr>  
	<%--  <td><%=i+1%></td>  --%>

    <%--   <td><%=bean.getSymptom()%></td>  
      <td><%=bean.getValue()%></td>
      <td><%=bean.getTotal()%></td> --%>
         
     <%--    <%
        float Value = bean.getValue();
        float Total = bean.getTotal();
        float ValueTotal = 0;
        
        ValueTotal = Value/Total;
     
        %>
        <td><%=ValueTotal%></td> --%>
        
        
          <td><%=bean.getSymptom()%></td>
         <%--  <td><%=bean.getTotalvalue()%></td>
          <td><%=bean.getTotalcolum()%></td> --%>
          
          <%
            float Totalvalue =  bean.getTotalvalue();
            float Totalcolum = bean.getTotalcolum();
            
            float Total = 0;
            float Total1 = 0;
            Total = Totalvalue/Totalcolum;
            Total1 =  Total/Totalcolum;
          
          %> 
                      
           <%-- <td><%=Total1%></td> --%>
           
           <form action="Analysis_diseaseServlet" method="post">
           <input type="hidden" name="sum<%=i%>" value="<%=Total1%>">
           <input type="hidden" name="symptom<%=i%>" value="<%=bean.getSymptom()%>">
           
           
       
           
           
           
           
           
<%}%>
</tr>
    <input type="submit" value="วิเคราะห์โรค"/>
           </form></center>
</body>
</html>
<%@ include file="footer_index.jsp"%>