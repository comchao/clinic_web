package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PetsBean;
import dao.PetsDAO;

/**
 * Servlet implementation class SearchPetServlet
 */
@WebServlet("/SearchPetServlet")
public class SearchPetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPetServlet() {
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
		request.setCharacterEncoding("utf-8");

		PetsBean pb = new PetsBean();
		pb.setPet_name(request.getParameter("pet_name"));
		ArrayList<PetsBean> petList = PetsDAO.search(pb);
				HttpSession session = request.getSession(true);
				String p = "1";
				session.setAttribute("pageN", p);
				session.setAttribute("allPetSS",petList);
				response.sendRedirect("pet_search.jsp");
	}

}
