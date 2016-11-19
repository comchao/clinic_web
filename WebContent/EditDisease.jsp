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
<script>
	function delConfirm() {
		if (confirm("คุณต้องการที่จะลบข้อมูลยาใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
	function editConfirm() {
		if (confirm("คุณต้องการที่จะแก้ไขข้อมูลยาใช่หรือไม่ ?")) {
			return true;
		}
		return false;
	}
</script>
<center>
<style type="text/css">  
/* class สำหรับแถวส่วนหัวของตาราง */  
.tr_head{   
    background-color:#333333;  
    color:#FFFFFF;  
}  
/* class สำหรับแถวแรกของรายละเอียด */  
.tr_odd{  
    background-color:#F8F8F8;  
}  
/* class สำหรับแถวสองของรายละเอียด */  
.tr_even{  
    background-color:#F2F2F2;  
}  
</style> 
<script language="javascript">  
  window.onload = function () {      
        var a=document.getElementById('mytable'); // อ้างอิงตารางด้วยตัวแปร a  
        for(i=0;i<a.rows.length;i++){ // วน Loop นับจำนวนแถวในตาราง  
            if(i>0){  // ตรวจสอบถ้าไม่ใช่แถวหัวข้อ  
                if(i%2==1){   // ตรวจสอบถ้าไม่ใช่แถวรายละเอียด  
                    a.rows[i].className="tr_odd";     // กำหนด class แถวแรก  
                }else{  
                    a.rows[i].className="tr_even";  // กำหนด class แถวที่สอง  
                }     
            }else{ // ถ้าเป็นแถวหัวข้อกำหนด class   
                a.rows[i].className="tr_head";    
            }     
        }  
 }  
 </script>  

									
	
	
	<br><br><br><br><br>
<div class="container">
<table align="left">
<tr>
<td><h3>โรค &nbsp; &nbsp; &nbsp;</h3></td>
<form action="SearchDiseaseServlet" method="post">
								<td><select name="disease"  id="drug_type" class="form-control"
										required="required">
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
								</select></td>
								
								
							
						<td>&nbsp; &nbsp; &nbsp; &nbsp; <input name="" type="submit" value="ค้นหา" class="btn btn-success"></td>
						</form>
						<td width="100"></td>
						
						</tr></table>
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	
</div>

						 
	<div class="row">
		<div align="center">
	
		
		</div>
	</div>
	
		<h3 align="center">ข้อมูลโรค</h3>	
	<div class="table-responsive">
			<table class="table table-hover">
				<tr class="info">
					<th><h4>ลำดับ</h4></th>
					
					<th><h4>อาการ</h4></th>
					<th><h4>โรค</h4></th>
					
					<th><h4>เเก้ไข</h4></th>
					<th><h4>ลบ</h4></th>
					
				</tr>
				<%
								DiseaseDAO dao = new DiseaseDAO();

								List<SymptomsBean> List = dao.symptom();
								response.setCharacterEncoding("utf-8");
								for (int i = 0; i < List.size(); i++) {
									SymptomsBean bean = List.get(i);
									
								%>
				<tr>
						<td><%=i+1 %></td>
								<td><%=bean.getSymptom() %></td>
							
								<td><%=bean.getDisease() %></td>
							  
								
					<td>
					<form action="UpdateDiseaseServlet.jsp" method="post">
					<input name="id_symptom" type="hidden" value="<%=bean.getId_symptom()%>"> 
					<input name="symptom" type="hidden" value="<%=bean.getSymptom()%>">
					<input name="disease" type="hidden" value="<%=bean.getDisease()%>">
						 
						<input type="submit" onclick="return editConfirm();"class="btn btn-warning" value="แก้ไข">
					</form>
					</td>
					<td>
						<form action="Deletesymptoms_diseaseServlet" method="post">
							<input name="id_symptom" type="hidden" value="<%=bean.getId_symptom()%>">
							
							<input onclick="return delConfirm();" class="btn btn-danger" type="submit" value="ลบข้อมูล">
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			
		</div>
	
</div>
<%@ include file="footer_index.jsp"%>
