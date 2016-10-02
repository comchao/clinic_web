package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DrugDAO;
import model.DrugBean;

/**
 * Servlet implementation class DrugSearchServlet
 */
@WebServlet("/DrugSearchServlet")
public class DrugSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DrugSearchServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("");

		String searchType = request.getParameter("searchType");
		String drug_name = request.getParameter("drug_name");
		String sql = "", page = "";
		ArrayList<DrugBean> drugList = null;
		DrugDAO drugDAO = new DrugDAO();

		drugList = drugDAO.searchDrug(drug_name);
		page = "drugView.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(page); 
		if (dispatcher != null) {
			request.setAttribute("drugList", drugList);
			dispatcher.forward(request, response);
		}
	}

}
