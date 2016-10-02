package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MembersDAO;
import model.MembersBean;

/**
 * Servlet implementation class memberSearchServlet
 */
@WebServlet("/memberSearchServlet")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("");

		String searchType = request.getParameter("searchType");
		String mem_name = request.getParameter("mem_name");
		String sql = "", page = "";
		ArrayList<MembersBean> memsList = null;
		MembersDAO memDAO = new MembersDAO();

		
			
			
		memsList = memDAO.queryMembers(mem_name);
				page = "memberView.jsp";
			
			
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) { 
			request.setAttribute("memList", memsList);
			dispatcher.forward(request, response);
		}
	}

}
