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
<br>
<br>
<br>
<br>

<div class="container">
	<div align="left"
		style="position: fixed; bottom: 80%; width: 100px; margin: 0px auto;">


	</div>
	<br>
	<br>
	<br>
	<div class="row">
		<h3 align="center">เพิ่มอาการโรค</h3>
		<br />
		<br />

		<form name="form1" id="form1" method="POST"
			action="AddSymptomDiseaseServlet" style="margin: 10px, 10px, 10px, 10px;">
			<div class="row">
				<div class="form-group">
				
			
			
					
					<div class="row">
							<div class="col-sm-3">
								<div>
									<p>โรค</p>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
								<select name=disease id="drug_type" class="form-control"
										required="required">
								<%
								DiseaseDAO dao = new DiseaseDAO();

								List<AnalysisBean> List = dao.disease();
								response.setCharacterEncoding("utf-8");
								for (int i = 0; i < List.size(); i++) {
									AnalysisBean bean = List.get(i);
									
								%>
										<option value="<%=bean.getDisease()%>"><%=bean.getDisease()%></option>
								<%
								}
								%>
								</select>
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
								<input type="text" name="symptom[]" id="symptom"
									placeholder="อาการของโรค" class="form-control"
									required="required" />
							</div>
						</div>
					</div>
					<table id="myTbl" width="1540">
						<tr id="firstTr">
							<td width="140">
							<td width="600"><div class="col-sm-5">
									<div class="form-group">
										<input type="text" name="symptom[]" id="symptom"
											placeholder="อาการของโรค" class="form-control"
											required="required" />
									</div>
								</div></td>



						</tr>
					</table>
					<br />
					<table width="1540">
						<tr>
							<td width="170">
							<td width="300">
							<td width="150">
							<td>  
    <button id="addRow" type="button"  style = "background-color:#228B22">&nbsp;  &nbsp;  +&nbsp;  &nbsp;  </button>    
    &nbsp;  
    <button id="removeRow" type="button" style = "background-color:#B22222" >&nbsp;  &nbsp; - &nbsp;  &nbsp;   </button>  

								&nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" name="submit"
								id="submit" class="btn btn-success" value="บันทึกข้อมูล"
								onclick="cal(value)" />

							</td>
						</tr>
					</table>
		</form>

		<script language="javascript" src="jquery-1.3.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#addRow").click(function() {
					$("#myTbl").append($("#firstTr").clone());
				});
				$("#removeRow").click(function() {
					if ($("#myTbl tr").size() > 1) {
						$("#myTbl tr:last").remove();
					} else {
						alert("ต้องมีรายการข้อมูลอย่างน้อย 1 รายการ");
					}
				});
			});
		</script>



		</form>
	</div>
</div>


<%@ include file="footer_index.jsp"%>
