package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MembersDAO;
import model.MembersBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setCharacterEncoding("utf-8");

		String username = request.getParameter("un");
		String password = request.getParameter("pw");
		
		String page = null;
		MembersBean login = new MembersBean();
		login.setUsername(username);
		login.setPassword(password);
			
		if (MembersDAO.checkLogin(login)) {

			HttpSession session = request.getSession();
			session.setAttribute("username", login.getUsername());
			session.setAttribute("typecode", login.getTypeCode());
			session.setAttribute("firstname", login.getMemName());
			session.setAttribute("lastname", login.getMemLname());
			session.setAttribute("id", login.getId());
		

			if (login.getTypeCode() == 1) {

				session.setAttribute("typecode_name", "");
				session.setAttribute("typecode", "1");
				page = "index-officer.jsp";
				
			} else if (login.getTypeCode() == 2) {

				session.setAttribute("typecode_name", "");
				session.setAttribute("typecode", "2");
				page = "index-veterinary.jsp";
			} else if (login.getTypeCode() == 3) {

				session.setAttribute("typecode_name", "");
				session.setAttribute("typecode", "3");
				page = "index-officer.jsp";
			}
			
		} else {
			page = "index.jsp";
		}

		response.sendRedirect(page);

	}
}
