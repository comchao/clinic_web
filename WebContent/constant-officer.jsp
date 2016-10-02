<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp" %>
 <section>
        <div class="container">
        <div align="left" style="position:fixed;bottom:80%;width:1000px;margin:0px auto;">
	<a href="index-officer.jsp"><input type="submit" class="btn btn-success" value="ย้อนกลับ" /></a>
</div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>ค่าคงที่ :</h3>
                    <hr>
                </div>
            </div>
            <div align="center">
            <h5>ข้อมูลเจ้าของสัตว์เลี้ยง</h5>
            <a href="#"><input type="submit" value="คำนำหน้า" class="btn btn-success" style="width:40%;"></a><br><br>
            <a href="#"><input type="submit" value="เพศ" class="btn btn-success" style="width:40%;"></a><br><br>
            
            <h5>ข้อมูลสัตว์เลี้ยง</h5>
            <a href="typePet.jsp"><input type="submit" value="ประเภทสัตว์เลี้ยง" class="btn btn-info"  style="width:40%;"></a><br><br>
            
            <h5>ข้อมูลยา</h5>
            <a href="typePet.jsp"><input type="submit" value="กลุ่มยา" class="btn btn-warning"  style="width:40%;"></a><br><br>
            </div>
          </div>
 </section>

<%@ include file="footer_index.jsp" %>