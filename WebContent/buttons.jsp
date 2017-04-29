<%@page import="dao.TypeDrugDAO"%>
<%@page import="model.TypeDrug"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_index.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="buttons.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<br><br><br>

 h2> radio button demo </h2>
<h2> Bootstrap automatically handles adding and remove the active class on clicked items</h2>
<div class="container">
 
    <div class="row">
      <h4>Role</h4>
		<div class="btn-group" data-toggle="buttons">
			<label class="btn btn-default active">
				<input type="radio">None
			</label>
			<label class="btn btn-default">
				<input type="radio">User
			</label>
			<label class="btn btn-default">
				<input type="radio">Manager
			</label>
      </div>
</div></div>


            <div id="push"></div>
        
  

</body>
</html>