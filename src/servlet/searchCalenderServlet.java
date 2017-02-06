package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CalendarDAO;
import model.CalendarBean;


/**
 * Servlet implementation class searchCalenderServlet
 */
@WebServlet("/searchCalenderServlet")
public class searchCalenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchCalenderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");  
		response.setCharacterEncoding("utf-8");
		String dateCalender = request.getParameter("dateCalender");
		  System.out.println("dateCalender :"+dateCalender);
		
		
		ArrayList<CalendarBean> list = new ArrayList<CalendarBean>();
		
		CalendarDAO dao = new CalendarDAO();
		
		list = dao.searchCalender(dateCalender);
	

	    request.setAttribute("list", list);
    
      
		String page= "ShowCalendar.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if(dispatcher != null){
			  request.setCharacterEncoding("utf-8");  
			   response.setCharacterEncoding("utf-8");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
