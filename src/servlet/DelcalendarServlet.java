package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import model.CalendarBean;

/**
 * Servlet implementation class DelcalendarServlet
 */
@WebServlet("/DelcalendarServlet")
public class DelcalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelcalendarServlet() {
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
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String page = "";
	
		CalendarBean id = new CalendarBean();
		CalendarDAO dao = new CalendarDAO();
	
		
		id.setId_auto(Integer.parseInt(request.getParameter("id_auto")));
		page = dao.deleteCalendar(id)?"index-officer.jsp":"index-officer.jsp";

		    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			if (dispatcher != null) {		
				dispatcher.forward(request, response);
			}
		}


	}

		
		
		
