<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <title>itOffside.com : plugin message</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/jquery.toastmessage.css">
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.toastmessage.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#notice").click(function() {
                    $().toastmessage('showToast', {
                        text : 'ปรับแต่งให้ข้อความอยู่หน้าจอ',
                        sticky : true,
                        type : 'notice',
                        position : 'middle-center'
                    });
                });
                $("#success").click(function() {
                    $().toastmessage('showSuccessToast', 'ข้อความสำเร็จ');
                });
                $("#warning").click(function() {
                    $().toastmessage('showWarningToast', 'ข้อความเตือน');
                });
                $("#error").click(function() {
                    $().toastmessage('showErrorToast', 'ข้อความเออเร่อ');
                });
            });
        </script>
    </head>
    <body>
        <form>
            <input type="button" value="itoffside.com" id="notice">
            <input type="button" value="Test message" id="success">
            <input type="button" value="show now" id="warning">
            <input type="button" value="show step" id="error">
        </form>
    </body>
</html>