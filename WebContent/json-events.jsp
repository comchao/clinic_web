<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.CalJson"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model.CalBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.CalendarDAO"%>

	
<%





CalendarDAO caldao = new CalendarDAO();  
Integer id_calendar = (Integer)session.getAttribute("id"); 
List<CalBean> callist = caldao.selectIdCalendar();
response.setCharacterEncoding("utf-8");
JSONArray ja = new JSONArray();

for(int i=0;i<callist.size();i++){
	CalBean calbean = callist.get(i);
	

	ja.add(new CalJson(calbean.getId(),calbean.getTitle(),calbean.getDate(),calbean.getUrl()));
} 
out.println(ja);
%>	
	
