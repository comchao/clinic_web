package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.VerterinaryDAO;
import model.VeterinaryBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		VeterinaryBean login = new VeterinaryBean();
		login.setUsername(username);
		login.setPassword(password);

		if (VerterinaryDAO.checkLogin(login)) {

			HttpSession session = request.getSession();
		
			System.out.println(login.getId());
			session.setAttribute("username", login.getUsername());
			session.setAttribute("typecode", login.getTypeCode());
			session.setAttribute("firstname", login.getVetName());
			session.setAttribute("lastname", login.getVetLname());
			
			System.out.println(login.getVetLname());

			if (login.getTypeCode() == 1) {

				session.setAttribute("typecode_name", "");
				
			} else if (login.getTypeCode() == 2) {

				session.setAttribute("typecode_name", "");
				
			} else if (login.getTypeCode() == 3) {

				session.setAttribute("typecode_name", "");
				
			}
			page = "index-officer.jsp";
		} else {
			page = "index.jsp";
		}

		response.sendRedirect(page);

	}
}
