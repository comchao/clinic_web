package net.calendar.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalendarFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequsetURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequsetURI.substring(contextPath.length());
		request.setCharacterEncoding("UTF-8");
		
		
		ActionForward forward=null;
		Action action=null;
		if(command.equals("/Calendar.cl")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./fullcalendar1.html");
		}else if(command.equals("/CalendarAdd.cl")){
			action = new CalendarAddAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CalendarDel.cl")){
			action = new CalendarDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
	
		if(forward!=null){
			if(forward.isRedirect()){
				//true redirect
				response.sendRedirect(forward.getPath());
			}else{
				//false forward
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
