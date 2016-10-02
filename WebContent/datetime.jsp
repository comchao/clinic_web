<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <title>Age</title>  
    <link rel="stylesheet" href="css/jquery.datetimepicker.css">  
</head>  
<body>  
    
  <br><br>  
  <div style="margin:auto;width:500px;">  
        
      BirthDay: <input type="text" name="mydateth" id="mydateth" value="">  
        
      <br><br>  
        
      Age: <input type="text" name="age" id="age" value="">  
        
      <br><br>  
        
      <div id="mydateth3"></div>  
  </div>    
   
<script src="js/jquery.min.js"></script>      
<script src="js/jquery.datetimepicker.full.js"></script>  
<script type="text/javascript" src="js/moment-with-locales.min.js"></script>      
<script type="text/javascript">  
$(function(){  
      
    var thaiYear = function (ct) {  
        var leap=3;    
        var dayWeek=["พฤ.", "ศ.", "ส.", "อา.","จ.", "อ.", "พ."];    
        if(ct){    
            var yearL=new Date(ct).getFullYear()-543;    
            leap=(((yearL % 4 == 0) && (yearL % 100 != 0)) || (yearL % 400 == 0))?2:3;    
            if(leap==2){    
                dayWeek=["ศ.", "ส.", "อา.", "จ.","อ.", "พ.", "พฤ."];    
            }    
        }                
        this.setOptions({    
            i18n:{ th:{dayOfWeek:dayWeek}},dayOfWeekStart:leap,    
        })                  
    };  
      
    $("#mydateth").datetimepicker({  
        timepicker:false,  // กำหนด ไม่แสดงตัวเลือกเวลา    
        format:'d-m-Y',  // กำหนดรูปแบบวันที่ ที่ใช้ เป็น 00-00-0000    
        lang:'th',  // แสดงภาษาไทย    
        onShow:thaiYear,  
        onChangeMonth:thaiYear,  
		onSelectDate:function(dp,$input){
			var yearT=new Date(dp).getFullYear()-0;  
			var yearTH=yearT+543;
			var fulldate=$input.val();
			var fulldateTH=fulldate.replace(yearT,yearTH);
			$input.val(fulldateTH);
		}
 
    });     
      
    $("#mydateth").on("change",function(){    
        var dayBirth=$(this).val();    
        var getdayBirth=dayBirth.split("-");    
        var YB=getdayBirth[2]-543;    
        var MB=getdayBirth[1];    
        var DB=getdayBirth[0];    
            
        var setdayBirth=moment(YB+"-"+MB+"-"+DB);      
        var setNowDate=moment();    
        var yearData=setNowDate.diff(setdayBirth, 'years', true); // ข้อมูลปีแบบทศนิยม    
        var yearFinal=Math.round(setNowDate.diff(setdayBirth, 'years', true),0); // ปีเต็ม    
        var yearReal=setNowDate.diff(setdayBirth, 'years'); // ปีจริง    
        var monthDiff=Math.floor((yearData-yearReal)*12); // เดือน    
        var str_year_month=yearReal+" ปี "+monthDiff+" เดือน"; // ต่อวันเดือนปี    
        $("#age").val(str_year_month);    
  
    });    
      
});  
</script>      
</body>  
</html>  