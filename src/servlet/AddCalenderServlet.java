package servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CalendarDAO;
import model.CalenderBeab1;


/**
 * Servlet implementation class AddCalenderServlet
 */
@WebServlet("/AddCalenderServlet")
public class AddCalenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCalenderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		
		        request.setCharacterEncoding("utf-8");  
				response.setCharacterEncoding("utf-8");
			
		String id = request.getParameter("id");
				
				
				String id_calendar = request.getParameter("id_calendar");
			
				String title = request.getParameter("title");
		
				String date = request.getParameter("date");
				CalenderBeab1 addcaltnber = new CalenderBeab1();
				addcaltnber.setId(Integer.parseInt(id));
				addcaltnber.setId_calendar(Integer.parseInt(id_calendar));
				addcaltnber.setTitle(title);
				addcaltnber.setDate(date);
		     
			
				
				CalendarDAO.insert(addcaltnber);
				
				if (addcaltnber.isValid())
				{
				
				response.sendRedirect("ShowCalendar1.jsp"); 
				}
				else
				response.sendRedirect("AddCalenderServlet.jsp"); 
				}
				catch (Throwable theException)
				{
				System.out.println(theException);
				}
	}}

	
				
