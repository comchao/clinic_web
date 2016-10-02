package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import model.CalendarBean;
import model.MembersBean;

/**
 * Servlet implementation class CalendarServlet2
 */
@WebServlet("/CalendarServlet2")
public class CalendarServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarServlet2() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		System.out.println("ID :"+id);
		
		
		ArrayList<CalendarBean> list = new ArrayList<CalendarBean>();
		
		CalendarDAO dao = new CalendarDAO();
		
		list = dao.selectId(Integer.parseInt(id));
	
/*//		while ((list != null)) { 	
*/		request.setAttribute("list", list);
       
        
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
