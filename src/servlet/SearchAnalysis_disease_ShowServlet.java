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
import dao.PetsDAO;
import model.OwnersBean;
import model.PetsBean;

/**
 * Servlet implementation class SearchAnalysis_disease_ShowServlet
 */
@WebServlet("/SearchAnalysis_disease_ShowServlet")
public class SearchAnalysis_disease_ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAnalysis_disease_ShowServlet() {
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
		request.setCharacterEncoding("utf-8");

		PetsBean pb = new PetsBean();
		pb.setPet_name(request.getParameter("pet_name"));
		ArrayList<PetsBean> petList = PetsDAO.search(pb);
				HttpSession session = request.getSession(true);
				String p = "1";
				session.setAttribute("pageN", p);
				session.setAttribute("allPetSS",petList);
				response.sendRedirect("SearchAnalysis_disease_ShowServlet.jsp");
	}

}


