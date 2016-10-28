package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * Servlet implementation class DiseaseGetSymptomServlet
 */
@WebServlet("/DiseaseGetSymptomServlet")
public class DiseaseGetSymptomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiseaseGetSymptomServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			ArrayList<SymptomsBean> diseaseList = new ArrayList<SymptomsBean>();
			// ดึงข้อมูลอาการโรค
			diseaseList = DiseaseDAO.getdisease();
			HttpSession session = request.getSession(true);
			/*String p = "1";
			session.setAttribute("pageN", p);*/
			// เก็บข้อมูลอาการโรค
			session.setAttribute("symptom", diseaseList);
			response.sendRedirect("Disease.jsp");
		} catch (Exception ex) {
			ex.printStackTrace(System.out);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		/* String id_symptom = request.getParameter("id_symptom"+1) */;
/*
		for (int i = 0; i < 50; i++) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String symptom = request.getParameter("symptom" + i);
			String disease = request.getParameter("disease" + i);
			
			String value = request.getParameter("value" + i);
			if ( symptom!= null &&disease != null && value != null) {
				

				DiseaseDAO DAO = new DiseaseDAO();
				AnalysisBean Bean = new AnalysisBean();
				Bean.setSymptom(symptom);
				Bean.setDisease(disease);
				Bean.setValue(Float.parseFloat(value));

				// DAO login
				DAO.insertDisease(Bean);

				// Response to view
				
				  if (Bean.isValid()) { response.setContentType("text/html");
				  PrintWriter out = response.getWriter(); out.println(
				  "<!DOCTYPE HTML>"); out.println("<html>"); out.println(
				  " <body>"); out.println(
				  " <script>alert('สำเร็จ');window.location='index-officer.jsp';</script>"
				  ); out.println("</body>"); out.println("</html>"); } else {
				  response.setContentType("text/html"); PrintWriter out =
				  response.getWriter(); out.println("<!DOCTYPE HTML>");
				  out.println("<html>"); out.println(" <body>"); out.println(
				  " <script>alert('สำเร็จ');window.location='index-officer.jsp';</script>"
				 ); out.println(" </body>"); out.println("</html>"); } }
				 

			}*/
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		  String[] symptom = request.getParameterValues("symptom[]");
		  String[] disease = request.getParameterValues("disease[]");
		  String[] value = request.getParameterValues("value[]");
		  for(int i=0; i<symptom.length; i++){
			  
			  System.out.println(symptom[i]);
			  System.out.println(disease[i]);
			  System.out.println(value[i]);
			  DiseaseDAO DAO = new DiseaseDAO();
				AnalysisBean Bean = new AnalysisBean();
				Bean.setSymptom(symptom[i]);
				Bean.setDisease(disease[i]);
				Bean.setValue(Float.parseFloat(value[i]));

				// DAO login
				DAO.insertDisease(Bean);

				// Response to view
				
				  if (Bean.isValid()) { response.setContentType("text/html");
				  PrintWriter out = response.getWriter(); out.println(
				  "<!DOCTYPE HTML>"); out.println("<html>"); out.println(
				  " <body>"); out.println(
				  " <script>alert('สำเร็จ');window.location='Total.jsp';</script>"
				  ); out.println("</body>"); out.println("</html>"); } else {
				  response.setContentType("text/html"); PrintWriter out =
				  response.getWriter(); out.println("<!DOCTYPE HTML>");
				  out.println("<html>"); out.println(" <body>"); out.println(
				  " <script>alert('สำเร็จ');window.location='Total.jsp';</script>"
				 ); out.println(" </body>"); out.println("</html>"); } }
				 
		}
	}