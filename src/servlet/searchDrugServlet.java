package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DrugDAO;
import dao.ProductDAO;
import model.DrugBean;
import model.ProductBean;

/**
 * Servlet implementation class searchDrugServlet
 */
@WebServlet("/searchDrugServlet")
public class searchDrugServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchDrugServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String drug_key = request.getParameter("drug_name");
		ArrayList<DrugBean> allDrug = DrugDAO.search(drug_key);
		
		HttpSession session = request.getSession(true);
		String p = "1";
		session.setAttribute("pageN", p);
		session.setAttribute("allDrugSS", allDrug);
		response.sendRedirect("drugView.jsp");
	}
}
