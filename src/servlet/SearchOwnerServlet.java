package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OwnersDAO;

import model.OwnersBean;


/**
 * Servlet implementation class SearchOwnerServlet
 */
@WebServlet("/SearchOwnerServlet")
public class SearchOwnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchOwnerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		OwnersBean ob = new OwnersBean();
		String owner_key = request.getParameter("owner_name");
		ArrayList<OwnersBean> ownerList = OwnersDAO.search(owner_key);
				HttpSession session = request.getSession(true);
				String p = "1";
				session.setAttribute("pageN", p);
				session.setAttribute("allOwnerSS", ownerList);
				response.sendRedirect("owner_view.jsp");

	}

}
