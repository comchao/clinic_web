<%@page import="dao.CageTypeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PetsDAO,model.PetsBean,model.ShopDetailBean,model.DepositBean"%>
<%@page import="dao.OwnersDAO,model.OwnersBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<script type="text/javascript" src="js/dropdown.js"></script> 
<%
	request.setCharacterEncoding("utf-8");
	DecimalFormat formatter = new DecimalFormat("###,###,###.00");
	
%>
<script>
function formatMoney(inum){  // ฟังก์ชันสำหรับแปลงค่าตัวเลขให้อยู่ในรูปแบบ เงิน  
    var s_inum=new String(inum);  
    var num2=s_inum.split(".",s_inum);  
    var l_inum=num2[0].length;  
    var n_inum="";  
    for(i=0;i<l_inum;i++){  
        if(parseInt(l_inum-i)%3==0){  
            if(i==0){  
                n_inum+=s_inum.charAt(i);         
            }else{  
                n_inum+=","+s_inum.charAt(i);         
            }     
        }else{  
            n_inum+=s_inum.charAt(i);  
        }  
    }  
    if(num2[1]!=undefined){  
        n_inum+="."+num2[1];  
    }  
    return n_inum;  
}  
function checkCal() {
	
	var cage = parseFloat(document.frmMain.cage_total.value);
	var prd_price = parseFloat(document.frmMain.total.value);
	var payment = parseFloat(document.frmMain.deposit_receive.value);
	document.frmMain.product_total.value = formatMoney(prd_price.toFixed(2));
	document.frmMain.total_sum.value = formatMoney((parseFloat(prd_price+cage)).toFixed(2));
	document.frmMain.pay_coin.value = formatMoney((parseFloat(prd_price+cage-payment)).toFixed(2));
	
	var deposit_in = document.frmMain.deposit_in.value;
	
	document.billPledge.deposit_datein.value = deposit_in;
	document.billPledge.d_day.value = document.frmMain.deposit_day.value;
	document.billPledge.c_price.value = document.frmMain.cage_price.value;
	document.billPledge.c_total.value = cage;
	document.billPledge.d_receive.value = payment;
	document.billPledge.cg_id.value = document.frmMain.cage_id.value;
	document.billPledge.own_name.value = document.frmMain.owner_name.value;
	
}
</script>
<body  onload="Javascript:checkCal();" >
<br>
<br>
<br>
<br>

<div class="container" >
<div align="right">
<form name="billPledge" action="ReportServlet" method="post">
							<input type="hidden" name="deposit_id" value="<%=request.getParameter("deposit_id")%>">
							<input type="hidden" name="cg_id" value="<%=request.getParameter("cage_id")%>">
							<input type="hidden" value="5" name="report_id" />
							<input  class="btn btn-info" type="submit" value="ฃำระเงินค่าฝากเลี้ยง">
</form>

</div>
<div align="left" style="position:fixed;bottom:80%;margin:0px auto;">
	<a href="javascript:history.back();"><input type="submit" class="btn btn-success" value="ย้อนกลับ" />
	</a>
</div>

	

		<h3 align="center">ข้อมูลการฝากเลี้ยง</h3>
		<br />
		<div class="col-sm-12">
		<form name="frmMain" id="frmMain" action="UpdatePrdDepositServlet" method="POST">
		
				<!--  ข้อมูลสัตว์เลี้ยง  -->
				<%
					ArrayList<DepositBean> depositList = (ArrayList) session.getAttribute("allDepositSS");
					if (depositList != null) {
						DepositBean depositBean;
							depositBean = (DepositBean) depositList.get(0);
				%>
				<div class="col-sm-4">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>สัตว์เลี้ยง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_name" id="pet_name" placeholder="ชื่อสัตว์เลี้ยง" class="form-control"
										value="<%=depositBean.getRefer_pet_id().getPet_name()%>" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ประเภท</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_category" id="pet_category"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="<%=depositBean.getRefer_pet_id().getPet_category()%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>พันธุ์</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gene" id="pet_gene"
										placeholder="พันธุ์สัตว์เลี้ยง" class="form-control"
										required="required"
										value="<%=depositBean.getRefer_pet_id().getPet_gene()%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>เพศ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_gender" id="pet_gender"
										placeholder="พันธุ์สัตว์เลี้ยง" class="form-control"
										required="required"
										value="<%=depositBean.getRefer_pet_id().getPet_gender()%>"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ตำหนิ/สี</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="pet_extra" id="pet_extra" class="form-control" value="<%=depositBean.getRefer_pet_id().getPet_extra()%>" readonly="readonly" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  ข้อมูลสัตว์เลี้ยง  -->
				<div class="col-sm-4">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>เจ้าของ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="owner_name" value="<%=depositBean.getRefer_owner_id().getOwners_name()+" "+depositBean.getRefer_owner_id().getOwners_lname() %>" class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>วันที่ฝาก</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="deposit_in" id="deposit_in" value="<%=depositBean.getDeposit_in()%>"
										 class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>วันที่มารับ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="deposit_out" id="deposit_out" value="<%=depositBean.getDeposit_out()%>"
										placeholder="วันที่รับสัตว์เลี้ยง" class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>จำนวนวัน</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="deposit_day" id="deposit_day"  class="form-control" readonly="readonly" style="text-align:right" value="<%=depositBean.getDeposit_day()%>" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>อาหาร<h6>(ราคารวม)</h6></p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" value="" name="product_total" style="text-align:right" readonly="readonly" id="product_total">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p style="color:red;">ค่ามัดจำ</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="deposit_receive" id="deposit_receive"  class="form-control" readonly="readonly" style="text-align:right" value="<%=formatter.format(depositBean.getDeposit_receive())%>" />
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ขนาดกรง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								<%
								int size = depositBean.getRefer_cage_id().getRefer_cage_size();
								if(size==1){
								%>
									 <input type="text" class="form-control" readonly="readonly" value="เล็ก" name="cageSize" id="cageSize">
								<%
								}
								if(size==2){
								%>
									 <input type="text" class="form-control" readonly="readonly" value="กลาง" name="cageSize" id="cageSize">
								<%
								}
								if(size==3){
								%>
									 <input type="text" class="form-control" readonly="readonly" value="ใหญ่" name="cageSize" id="cageSize">
								<%
								}
								%>
								   
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ชื่อกรง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								     <input type="text" class="form-control" value="<%=depositBean.getRefer_cage_id().getCage_name()%>"  readonly="readonly" name="product_name" id="product_name">
								     
								</div>
							</div>
						</div>
					    <input type="hidden" class="form-control" value="<%=request.getParameter("cage_id")%>"  readonly="readonly" name="cage_id" id="cage_id">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>ราคากรง</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" style="text-align:right" value="<%=formatter.format(depositBean.getRefer_cage_id().getCage_price())%>" name="cage_price" readonly="readonly" id="cage_price">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p>กรง<h6>(ราคารวม)</h6></p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" style="text-align:right" value="<%=formatter.format(depositBean.getRefer_cage_id().getCage_price()*depositBean.getDeposit_day())%>" name="cage_total" readonly="readonly" id="cage_total">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p style="color:red;">รวมเงิน</p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" value="<%=formatter.format(0)%>" style="text-align:right" name="total_sum" readonly="readonly" id="total_sum">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<p style="color:red;">ค้างชำระ </p>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group">
								    <input type="text" class="form-control" value="" style="text-align:right" name="pay_coin" readonly="readonly" id="pay_coin">
								</div>
							</div>
						</div>
						<%if(depositBean.getRefer_pet_id().getPet_category().equals("สุนัข")){
											
										%>
										<input type="hidden" name="refer_pet_id" id="refer_pet_id"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="1">
										<% }%>
										<%if(depositBean.getRefer_pet_id().getPet_category().equals("แมว")){
											
										%>
										<input type="hidden" name="refer_pet_id" id="refer_pet_id"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="2">
										<% }%>
										<%if(depositBean.getRefer_pet_id().getPet_category().equals("กระต่าย")){
											
										%>
										<input type="hidden" name="refer_pet_id" id="refer_pet_id"
										placeholder="ประเภทสัตว์เลี้ยง " class="form-control"
										value="3">
										<% }%> 
										<input  type="hidden" id="refer_petdeposit" name="refer_petdeposit" class="form-control" value="<%=depositBean.getId() %>" readonly="readonly" />
						<%
				}
			%>
						<input  type="hidden" id="days" name="days" class="form-control" readonly="readonly" />
						<input  type="hidden" id="deposit_status" name="deposit_status" value="1" class="form-control" readonly="readonly" />
					</div>
				</div>
				<div class="row">
				
				<div class="col-sm-12">
					<div class="form-group">
								<script>
									function windowOpen() {
										var refer_id;
										var refer_petdeposit;
										refer_petdeposit=parseInt(document.frmMain.refer_petdeposit.value);
										refer_id=parseInt(document.frmMain.refer_pet_id.value);
										var myWindow=window.open('prdSelectUpdate.jsp?refer_pet_id='+refer_id+'&refer_petdeposit='+refer_petdeposit,'windowRef','width=1200,height=300,top=220,left=25');
										if (!myWindow.opener) myWindow.opener = self;
									}
								</script>
								<div class="col-sm-5">
								</div>
								<div class="col-sm-2">
								<input name="openProduct" class="form-control" type="button" id="openProduct" onClick="Javascript:windowOpen();" value="เลือกอาหารสัตว์เลี้ยง"><br>
								</div>
								<div class="col-sm-5">
								</div>
								
					</div>
				</div>
				<div class="col-sm-12">
					<div class="col-sm-1" style="padding-left: 3px;	padding-right: 3px;width: 12.33333333%">
						<p align="center"> วันที่ </p>
					</div>
					<div class="col-sm-6"  style="padding-left: 3px;	padding-right: 3px">
						<p align="center"> ชื่อสินค้า</p>
					</div>
					<div class="col-sm-1"  style="padding-left: 3px;	padding-right: 3px">
						<p align="center"> ราคา </p>
					</div>
					<div class="col-sm-1"  style="padding-left: 3px;	padding-right: 3px">
						<p align="center"> จำนวน </p>
					</div>
					<div class="col-sm-1"  style="padding-left: 3px;	padding-right: 3px">
						<p align="center"> รวม </p>
					</div>
					<div class="col-sm-2"  style="padding-left: 3px;padding-right: 3px;width: 12.33333333%;">
					</div>
				</div>
				<div class="col-sm-13">
					<div class="col-sm-1" style="padding-left:3px;padding-right:3px;width: 12.33333333%">
						<input type="text" name="prd_date" id="prd_date" class="form-control" placeholder="วัน/เดือน/ปี ค.ศ" required="required"	readonly="readonly" />
					</div>
					<div class="col-sm-6"  style="padding-left:3px;padding-right:3px">
						<input type="text" name="pro_name" id="pro_name" class="form-control" placeholder="ชื่อสินค้า" required="required" readonly="readonly" />
					</div>
					<div class="col-sm-1"  style="padding-left:3px;padding-right:3px">
						<input type="text" name="product_price" id="product_price" class="form-control" placeholder="ราคา/บาท" required="required" readonly="readonly" />
					</div>
					<div class="col-sm-1"  style="padding-left:3px;padding-right:3px">
						<input type="text" name="product_qty" id="product_qty" class="form-control" placeholder="จำนวน" required="required" readonly="readonly" />
					</div>
					<div class="col-sm-1"  style="padding-left:3px;padding-right:3px;">
						<input type="text"name="total_total" id="total_total" class="form-control" placeholder="รวม/บาท" required="required" readonly="readonly">
					</div>
					<div class="col-sm-2"  style="padding-left: 3px;padding-right: 3px;width: 12.33333333%;">
						<input name="addFood" class="form-control" type="submit" id=""  value="เพิ่มอาหาร" onload="Javascript:checkPrd();"><br>
					</div>
				</div>
				
				<div class="col-sm-12">
				
				<%
		ArrayList<ShopDetailBean> prdShopList = (ArrayList) session.getAttribute("allShopSS");
		if (prdShopList != null) {
	%>
	<div class="table-responsive">
		<table class="table table-hover">
			<tr class="info">
				<td>ลำดับ</td>
				<td>วันที่ซื้อสินค้า</td>
				<td align="center">ชื่อสินค้า</td>
				<td align="right">ราคา/ชิ้น</td>
				<td align="right">จำนวน</td>
				<td align="right">รวม/บาท</td>
			</tr>

			<%
			ShopDetailBean prdShopBean;
					String allpage = (String) session.getAttribute("pageN");
					int p = Integer.parseInt(allpage);
					double sum=0;
					for (int i = (p * 10) - 10; i < p * 10; i++) {
						
						if (i == prdShopList.size()) {
							break;
						}
						prdShopBean = (ShopDetailBean) prdShopList.get(i);
						
						sum+=prdShopBean.getPrd_total();
				%>
			<tr>
				<td><%=i+1%></td>
				<td><%=prdShopBean.getPrd_date()%></td>
				<td><%=prdShopBean.getPrd_name()%></td>
				<td align="right"><%=formatter.format(prdShopBean.getPrd_price())%></td>
				<td align="right"><%=prdShopBean.getPrd_qty()%></td>
				<td align="right"><%=formatter.format(prdShopBean.getPrd_total())%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right">รวม</td>
				<td align="right"><%=formatter.format(sum)%><input type="hidden" id="total" value="<%=sum%>"></td>
			</tr>
		</table>
		<!-- ตัวแบ่งหน้า -->
			<form action="pageProductDetailServlet">
				<div align="center">
					<br> <br>
					<%
						int a = 0;
						int b = (prdShopList.size() / 10) + 1;
						int c = prdShopList.size() % 10;
						if (c != 0) {
							for (a = 0; a < b; a++) {
					%>
					<button value="<%=a + 1%>" name="page" class="btn btn-info"><%=a + 1%></button>
					<%
						}
						} else {
							for (a = 1; a < b; a++) {
					%>
					<button value="<%=a%>" name="page" class="btn btn-info"><%=a%></button>
					<%
						}
						}
					%>
				</div>
			</form><br>
			<!-- สิ้นสุดตัวแบ่งหน้า -->
		</div>
		</div>
	</div>

	<%
		}
	%>
			</form>
			</div>
		</div>
		
<%@ include file="footer_index.jsp"%>
