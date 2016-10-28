package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseDAO;
import model.AnalysisBean;
import model.SymptomsBean;

/**
 * Servlet implementation class Analysis_diseaseServlet
 */
@WebServlet("/Analysis_diseaseServlet")
public class Analysis_diseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Analysis_diseaseServlet() {
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
		
	
		
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		/* String id_symptom = request.getParameter("id_symptom"+1) */;

		for (int i = 0; i < 50; i++) {
			
		String sum = request.getParameter("sum"+i);
		String symptom = request.getParameter("symptom"+i);
		
		
		if(sum!=null&&symptom!=null){

		/*System.out.println("sum"+sum);
		System.out.println("symptom"+symptom);*/
		
		DiseaseDAO DAO = new DiseaseDAO();
		AnalysisBean Bean = new AnalysisBean();
		
		Bean.setSymptom(symptom);

		Bean.setSum(Float.parseFloat(sum));

		// DAO login
		DAO.updateSum(Bean);

		// Response to view
		
		  if (Bean.isValid()) { response.setContentType("text/html");
		  PrintWriter out = response.getWriter(); out.println(
		  "<!DOCTYPE HTML>"); out.println("<html>"); out.println(
		  " <body>"); out.println(
		  " <script>alert('สำเร็จ');window.location='AnalysisDisease.jsp';</script>"
		  ); out.println("</body>"); out.println("</html>"); } else {
		  response.setContentType("text/html"); PrintWriter out =
		  response.getWriter(); out.println("<!DOCTYPE HTML>");
		  out.println("<html>"); out.println(" <body>"); out.println(
		  " <script>alert('สำเร็จ');window.location='AnalysisDisease.jsp';</script>"
		 ); out.println(" </body>"); out.println("</html>"); } }
		 

	}
}
}

              
