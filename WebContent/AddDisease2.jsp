<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



 <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
            String[] firstnameArr = request.getParameterValues("firstnameArr[]");
            String[] lastnameArr = request.getParameterValues("lastnameArr[]");
         
 
            for(int i=0; i<firstnameArr.length; i++){
        %>
            <p>First name: <%=firstnameArr[i]%></p>
            <p>Last name: <%=lastnameArr[i]%></p>
           
        <%
            }
        %>


