<%@page import="com.oreilly.servlet.multipart.LimitedServletInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="dao.DiseaseDAO"%>
<%@page import="model.AnalysisBean"%>
<%@ include file="header_index.jsp"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>

		<h2>ผลของการวิเคราะห์โรค</h2>
		<br>
		<%
			DiseaseDAO dao6 = new DiseaseDAO();
			List<AnalysisBean> List = dao6.getAnalysis();
			response.setCharacterEncoding("utf-8");
			for (int i = 0; i < List.size(); i++) {
				AnalysisBean bean = List.get(i);
		%>








		<h3 >
			<font color="red"> <%=bean.getDisease()%></font><h3>











				<%
					}
				%>
				<br>

				<table>
					<tr>
						<%
							DiseaseDAO dao5 = new DiseaseDAO();
							List<AnalysisBean> diseaseList5 = dao5.getpercentagetotal();
							response.setCharacterEncoding("utf-8");
							for (int i5 = 0; i5 < diseaseList5.size(); i5++) {
								AnalysisBean bean1 = diseaseList5.get(i5);
						%>

						<%
							
						%>
						<%
							DiseaseDAO dao = new DiseaseDAO();

								List<AnalysisBean> diseaseList = dao.getpercentage();
								response.setCharacterEncoding("utf-8");
								for (int i = 0; i < diseaseList.size(); i++) {
									AnalysisBean bean = diseaseList.get(i);
									
						%>
						    
		<form action="SaveDisease.jsp" method="post">
	    

						<%
							float SumPercentage = 0;
									float TotalPercentage = Float.parseFloat(bean.getPercentage());
									float Total = bean1.getTotal();
									DecimalFormat df = new DecimalFormat();
									df.applyPattern("0.00");

									SumPercentage = TotalPercentage / Total * 100;
									new DecimalFormat("0.0").format(SumPercentage);
						%>






					
							<%--    
        <td> <h3> <%=bean.getDisease()%><h3> </td>
        <td> <h3> <%=bean.getPercentage()%><h3></td> --%>
        
                          <%if(SumPercentage!=0){ %>
                        	  <h4><%=bean.getDisease()%>
								<%=new DecimalFormat("0.0").format(SumPercentage)%> % <% 
        	}%>
        
							
								<input type="hidden" name="Disease" value="<%=bean.getDisease()%>"> 
								<input type="hidden" name="SumPercentage" value="<%=SumPercentage%>">


							</h4>














							<%
								}
								}
							%>
							   <%
							DiseaseDAO dao4 = new DiseaseDAO();

								List<AnalysisBean> diseaseList4 = dao4.getpercentage();
								response.setCharacterEncoding("utf-8");
								for (int i4 = 0; i4 < diseaseList4.size(); i4++) {
									AnalysisBean bean4 = diseaseList4.get(i4);
									
						%>
						    <input type="hidden" name="percentage" value="<%=bean4.getPercentage()%>"> 
					  

							
							<%
								}%>
						
						<td><input type="submit" name="submit" id="submit"
							class="btn btn-success" value="SaveData" onclick="cal(value)" />
							</form></td>
				
				<br>
				

						<%
							DiseaseDAO dao2 = new DiseaseDAO();
							List<AnalysisBean> List2 = dao2.Analysis();
							response.setCharacterEncoding("utf-8");
							for (int i2 = 0; i2 < List2.size(); i2++) {
								AnalysisBean bean2 = List2.get(i2);
						%>

						<form action="ClearDataServlet" method="post">

							<input name="id[]" type="hidden" value="<%=bean2.getId()%>">
							<%
								}
							%>
<td width="10"></td>

							<td><input type="submit" name="submit" id="submit"
								class="btn btn-success" value="Clear Data" onclick="cal(value)" />
						</form>
		<td width="10"></td>
						
				<!-- 	<td><form action="ReportServlet" method="post"> -->
						<%
							DiseaseDAO dao7 = new DiseaseDAO();
							List<AnalysisBean> diseaseList7 = dao5.getpercentagetotal();
							request.setCharacterEncoding("UTF-8");
							response.setCharacterEncoding("UTF-8");
							for (int i5 = 0; i5 < diseaseList5.size(); i5++) {
								AnalysisBean bean1 = diseaseList5.get(i5);
						
							DiseaseDAO dao = new DiseaseDAO();

								List<AnalysisBean> diseaseList = dao.getpercentage();
								request.setCharacterEncoding("UTF-8");
								response.setCharacterEncoding("UTF-8");
								for (int i = 0; i < diseaseList.size(); i++) {
									AnalysisBean bean = diseaseList.get(i);
						%>
	         
						<%
							float SumPercentage = 0;
									float TotalPercentage = Float.parseFloat(bean.getPercentage());
									float Total = bean1.getTotal();
									DecimalFormat df = new DecimalFormat();
									df.applyPattern("0.00");

									SumPercentage = TotalPercentage / Total * 100;
									new DecimalFormat("0.0").format(SumPercentage);
						%>


		
					   <input type="hidden" name="Disease[]"value="<%=bean.getDisease()%>"> 
					   <input type="hidden"name="SumPercentage" value="<%=SumPercentage%>">
					   
					  

							
							<%
								}
								}
							%>

           

			<!-- <input name="report_id" value="7" type="hidden"> 
			<input type="submit" name="submit" id="submit" class="btn btn-success"value="Report" onclick="cal(value)" />
		   </form> -->
						</td>
	</center>
	</tr>
	</table>
</body>
</html>




<%@ include file="footer_index.jsp"%>