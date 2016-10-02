package net.calendar.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.calendar.db.CalDAO;

public class CalendarDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String date = request.getParameter("date");
		
		CalDAO caldao = new CalDAO();
		int check = caldao.deleteCal(date);
		if(check==1){
			System.out.println("delete success");
		}else{
			System.out.println("delete fail");
		}
		
		
		ActionForward forward = new ActionForward(); 
		forward.setRedirect(true);
		forward.setPath("./Calendar.cl");
		return forward;
	}

}
