package net.calendar.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.calendar.db.CalBean;
import net.calendar.db.CalDAO;

public class CalendarAddAction implements Action {

	@Override
	public net.calendar.action.ActionForward execute(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		CalBean calbean = new CalBean();
		calbean.setId(request.getParameter("id"));
		calbean.setTitle(request.getParameter("title"));
		calbean.setUrl(request.getParameter("url"));
		calbean.setDate(request.getParameter("date"));
		
		CalDAO caldao = new CalDAO();
		int check = caldao.insertCal(calbean);
		if(check==1){
			System.out.println("insert success");
		}else{
			System.out.println("insert fail");
		}
		
		ActionForward forward = new ActionForward(); 
		forward.setRedirect(true);
		forward.setPath("./Calendar.cl");
		return forward;
	}

	
}
