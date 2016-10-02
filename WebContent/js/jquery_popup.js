$(document).ready(function() {
    
    $("#login #cancel").click(function() {
        $(this).parent().parent().hide();
    });

    $("#login_onclick").click(function() {
        $("#logindiv").css("display", "block");
    });


//login form popup login-button click event
    $("#loginbtn").click(function() {
        var name = $("#username").val();
        var password = $("#password").val();
        if (username == "" || password == "")
        {
            alert("Username or Password was Wrong");
        }
        else
        {
            $("#logindiv").css("display", "none");
        }
    });

});