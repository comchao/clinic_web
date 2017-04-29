<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.ShopDetailBean"%>
<%@page import="model.json"%> 
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	

<%-- 	<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");



ProductDAO dao = new ProductDAO();  
List<ShopDetailBean> list = dao.ShopDetail();
response.setCharacterEncoding("utf-8");
JSONArray ja = new JSONArray();

for(int i=0;i<list.size();i++){
	ShopDetailBean bean = list.get(i);
	 ja.add(new json(bean.getValue(),bean.getName()));
	 
} 
out.println(ja); 

%>	
 --%>
