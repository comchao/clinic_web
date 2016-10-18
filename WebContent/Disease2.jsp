<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<!-- <th>check All  </th> -->
<!-- <th>ลำดับ  </th> -->
<th> อาการที่พบเบื้องต้น:  </th>
<th> ระดับอาการ : </th>

</tr>
<%
request.setCharacterEncoding("UTF-8");
/* String id_symptom = request.getParameter("id_symptom"+1) */;

for (int i = 0; i < 50; i++) {
	request.setCharacterEncoding("UTF-8");
String value = request.getParameter("value"+i);
String symptom = request.getParameter("symptom"+i);
String id_symptom = request.getParameter("id_symptom"+i);

%>

 
 
<!-- <script>
function getcheckboxes() {
    var node_list = document.getElementsByTagName('input');
    var checkboxes = [];
    for (var i = 0; i < node_list.length; i++) 
    {
        var node = node_list[i];
        if (node.getAttribute('type') == 'checkbox') 
    {
            checkboxes.push(node);
        }
    } 
    return checkboxes;
}
function toggle(source) {
  checkboxes = getcheckboxes();
  for(var i=0, n=checkboxes.length;i<n;i++) 
  {
    checkboxes[i].checked = source.checked;
  }
}
</script> -->
<%if(value!=null&&symptom!=null&&id_symptom!=null){ %>
<form action="DiseaseGetSymptomServlet" method="post">
 <%--  <tr><center><td> <input name="id_symptom<%=i%>"  type="checkbox" onClick="toggle(this)" value="<%=id_symptom%>" /> <br/>   --%>  
<%-- <center><td><%=i+1%></td><center> --%>
 <tr><td><%=symptom%></td></center>
 <td><center><%if(value.equals("1")){%>
              	มาก   
              	 <%}if(value.equals("0.5")){%>
              	น้อย 
              	 <%}if(value.equals("0")){%>
                                          ปกติ<%} %> </td></center> 
         <input name="value<%=i%>" type="hidden" value="<%=value%>"/>	
         <input name="id_symptom<%=i%>" type="hidden" value="<%=id_symptom%>"/>	                                                             
 		

<%}}
%>
<td><br><input name="submit" type="submit" ></td></tr>

		</form>
</table>


</body>
</html>