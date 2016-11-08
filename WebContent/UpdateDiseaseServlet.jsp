<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="dao.DiseaseDAO"%>
<%@page import="model.SymptomsBean"%>
<%@ include file="header_index.jsp"%>
<%@page import="model.AnalysisBean"%>
<br>
<br>
<br>
<br><br><br>




<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:100px;margin:0px auto;">
	
	
</div>



	<div class="row">
		
			<h3 align="center">แก้ไขข้อมูล</h3>
		<br /><br />
		
		
	
		
		<form name="form1" id="form1" method="POST" action="UpdateDiseaseServlet" style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">
					<div class="form-group">
					<div class="row">
							<div class="col-sm-3">
								<div>
									<p>ชื่อโรค</p>
								</div>
								
							</div>
							<div class="col-sm-5">
								<div class="form-group">
							<select name="disease"   class="form-control"
										required="required">
								<%
								request.setCharacterEncoding("UTF-8");
								response.setCharacterEncoding("UTF-8");	
								
								String symptom = request.getParameter("symptom");
								String disease = request.getParameter("disease");
								String id_symptom = request.getParameter("id_symptom"); %>
							
								<option value="<%=disease%>"><%=disease%></option>
									
								<% 
								DiseaseDAO dao1 = new DiseaseDAO();
								List<AnalysisBean> List1 = dao1.disease();
								response.setCharacterEncoding("utf-8");
								for (int i = 0; i < List1.size(); i++) {
									AnalysisBean bean = List1.get(i);
									
								%>    
							
										<option value="<%=bean.getDisease()%>"><%=bean.getDisease()%></option>
								<%
								}
								%>
								
							
								</select>
									<input name="id_symptom" type="hidden" value="<%=id_symptom%>">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div>
									<p>อาการของโรค</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<input type="text" name="symptom"
										placeholder="อาการของโรค" class="form-control" required="required"  value="<%=symptom%>"/>
								</div>
							</div>
							</div>    

<br />  
<table width="1540" >  
  <tr>  
   <td width="170">
    <td width="300">
    
  <td width="150">
    <td>  
   

						
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
	<input type="submit" name="submit" id="submit"
	class="btn btn-success" value="บันทึกข้อมูล" onclick="cal(value)" />  
					
    </td>  
  </tr>  
</table>  
</form>
<script language="javascript" src="jquery-1.3.2.min.js"></script>  
<script type="text/javascript">  
$(function(){  
    $("#addRow").click(function(){  
        $("#myTbl").append($("#firstTr").clone());  
    });  
    $("#removeRow").click(function(){  
        if($("#myTbl tr").size()>1){  
            $("#myTbl tr:last").remove();  
        }else{  
            alert("ต้องมีรายการข้อมูลอย่างน้อย 1 รายการ");  
        }  
    });           
});  
</script>
							
						
			
		
	</div>
</div>


<%@ include file="footer_index.jsp"%>
