package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiseaseDAO;
import model.AnalysisBean;

import model.SymptomsBean;

/**
 * Servlet implementation class symptomServlet
 */
@WebServlet("/symptomServlet")
public class symptomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public symptomServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		for (int i = 0; i < 50; i++) {
		request.setCharacterEncoding("UTF-8");
		try {
			
		request.setCharacterEncoding("utf-8");  
		response.setCharacterEncoding("utf-8");

			String symptom = request.getParameter("symptom"+i);
			System.out.println("symptom:=" + symptom);
			if (symptom != null) {
				request.setCharacterEncoding("utf-8");  
				response.setCharacterEncoding("utf-8");
				DiseaseDAO dao = new DiseaseDAO();
				ArrayList<AnalysisBean> List = dao.symptom(symptom);
		
				HttpSession session = request.getSession(true);
				String p = "50";
				session.setAttribute("pageN", p);
				// เก็บข้อมูลอาการโรค
				session.setAttribute("symptom", List);
				response.sendRedirect("Disease3.jsp");
		}} catch (Exception ex) {
				ex.printStackTrace(System.out);
			}}}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	}
}