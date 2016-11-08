package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseDAO;
import model.AnalysisBean;

/**
 * Servlet implementation class UpdateDiseaseServlet
 */
@WebServlet("/UpdateDiseaseServlet")
public class UpdateDiseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDiseaseServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String page = "";
	
		AnalysisBean disease = new AnalysisBean();
		DiseaseDAO dao = new DiseaseDAO();
		
		
		disease.setSymptom(request.getParameter("symptom"));
		disease.setDisease(request.getParameter("disease"));
		System.out.println(request.getParameter("symptom"));
		disease.setId_symptom(Integer.parseInt(request.getParameter("id_symptom")));
		page = dao.updateanalysis_disease(disease)?"EditDisease.jsp":"EditDisease.jsp";

		    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			if (dispatcher != null) {		
				dispatcher.forward(request, response);
			}
		}

	}
