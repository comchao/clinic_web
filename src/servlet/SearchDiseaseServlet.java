package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiseaseDAO;
import model.AnalysisBean;


/**
 * Servlet implementation class DearchDiseaseServlet
 */
@WebServlet("/SearchDiseaseServlet")
public class SearchDiseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDiseaseServlet() {
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
		
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		    String  disease = request.getParameter("disease");
		    DiseaseDAO dao = new DiseaseDAO();
			List<AnalysisBean> List = dao.search(disease);
			// ดึงข้อมูลอาการโรค
	        HttpSession session = request.getSession(true);
			// เก็บข้อมูลอาการโรค
			session.setAttribute("search", List);
			response.sendRedirect("SearchDisease.jsp");
			} catch (Exception ex) {
			ex.printStackTrace(System.out);
		}
	}}