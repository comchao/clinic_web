<%@page import="dao.TreatmentDrugDAO"%>
<%@page import="model.TreatmentDrugBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.PetsDAO,model.PetsBean"%>
<%@page import="java.util.ArrayList"%>

<% request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
%>

<%@ include file="header_index.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<br>
<br><br>
<br>


<div class="container">
<div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<!-- <a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a> -->
</div>
	<br>
	<h3 align="center">ประวัติการรักษาทั้งหมด </h3><br> 
	<h4 align="center">ชื่อสัตว์เลี้ยง <%=request.getParameter("pet_name") %> ประเภท <%=request.getParameter("category") %> พันธุ์ <%=request.getParameter("gene") %></h4>
	<br>

	<%
		int pet_id = Integer.parseInt(request.getParameter("pet_id"));
		ArrayList<TreatmentDrugBean> tmDrugBean = new ArrayList<TreatmentDrugBean>();
		
		tmDrugBean = TreatmentDrugDAO.queryForHistory(pet_id);
	
		if (tmDrugBean == null) {
			
			out.print("ไม่พบข้อมูลการรักษา");
			
		}else{
	%>

	<div class="table-responsive">
		<table class="table ">
			<tr class="info">
				<th class="text-center col-md-1">ลำดับที่</th>
				<th class="text-center col-md-1">วันที่</th>
				<th class="text-center col-md-3">อาการ</th>
				<th class="text-center col-md-3">หมายเหตุ</th>
				<th class="text-center col-md-4">รายการ</th>
				<th class="text-center col-md-1">จำนวน</th>
				<th class="text-center col-md-4"></th>
				
			</tr>
			<%
			int i = 0;
			String ck = "";
			String dt = "";
			String note = "";
			String snum ="";
			String unit="";
			int idnum = 0;
			for (TreatmentDrugBean tmd : tmDrugBean) {
				
				if(!ck.equals(tmd.getTreatment_date())){
					idnum = ++i;
					ck = tmd.getTreatment_date();
					dt = tmd.getTreatment_detail();
					note = tmd.getNote();
					unit = tmd.getRefer_drug_id().getDrug_unit();
					out.print("<tr><td colspan='5'><hr></td></tr>");
				}else{
					idnum=0;
					if(idnum!=0){
						snum=String.valueOf(idnum);
					}
					ck = "";
					
				}
			%>
			<tr>
			<%if(idnum==0){%>
			
			<td><%=snum%></td>
			
			<% } else{%>
				<td><%=idnum%></td>
				<%} %>
				<td class="text-center"><%=ck %></td>
				<td class="text-center"><%=tmd.getRefer_drug_id().getDetail()==null?"":tmd.getRefer_drug_id().getDetail() %></td>
				<td class="text-center"><%=tmd.getRefer_drug_id().getNote()==null?"":tmd.getRefer_drug_id().getNote() %></td>				
				<td class="text-left"><%=tmd.getRefer_drug_id().getDrug_name() %></td>
				<td class="text-center"><%=tmd.getDrug_qty() %></td>
				<td></td>
			</tr>
			<%
				
				ck = tmd.getTreatment_date();
				dt = tmd.getTreatment_detail();
				note = tmd.getNote();
				
			}
			%>

		</table>
	</div>

	<%
		}
	%>

</div>

<%@ include file="footer_index.jsp"%>