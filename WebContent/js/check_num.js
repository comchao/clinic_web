function IsNumeric(sText,obj)  
{  
    var ValidChars = "0123456789.";  
   var IsNumber=true;  
   var Char;  
   for (i = 0; i < sText.length && IsNumber == true; i++)   
      {   
      Char = sText.charAt(i);   
      if (ValidChars.indexOf(Char) == -1)   
         {  
         IsNumber = false;  
         }  
      }  
        if(IsNumber==false){  
            alert("กรุณากรอกข้อมูลเป็นตัวเลขเท่านั้น");  
            obj.value=sText.substr(0,sText.length-1);  
        }  
   }  