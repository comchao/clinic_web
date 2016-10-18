package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			ArrayList<SymptomsBean> diseaseList = new ArrayList<SymptomsBean>();
			// ดึงข้อมูลอาการโรค
			diseaseList = DiseaseDAO.getdisease();
			HttpSession session = request.getSession(true);
			String p = "1";
			session.setAttribute("pageN", p);
			// เก็บข้อมูลอาการโรค
			session.setAttribute("symptom", diseaseList);
			response.sendRedirect("Disease.jsp");
		} catch (Exception ex) {
			ex.printStackTrace(System.out);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		/* String id_symptom = request.getParameter("id_symptom"+1) */;

		for (int i = 0; i < 50; i++) {
			request.setCharacterEncoding("UTF-8");
		    String id_symptom = request.getParameter("id_symptom"+i);
		    String value = request.getParameter("value"+i);
		    if(id_symptom!= null && value!= null){
		   /*  System.out.println("id_symptom"+id_symptom); System.out.println("value"+value);*/
		     
		      DiseaseDAO DAO = new DiseaseDAO();
		      AnalysisBean Bean = new AnalysisBean();	
				
		        Bean.setId_symptom(Integer.parseInt(id_symptom));
		        Bean.setValue(Integer.parseInt(value));
				
				
				// DAO login
		        DiseaseDAO.insertDisease(Bean);

				// Response to view
				/*if (Bean.isValid()) {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<!DOCTYPE HTML>");
					out.println("<html>");
					out.println(" <body>");
					out.println(
							" <script>alert('สำเร็จ');window.location='drugView.jsp';</script>");
					out.println(" </body>");
					out.println("</html>");
				} else {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<!DOCTYPE HTML>");
					out.println("<html>");
					out.println(" <body>");
					out.println(
							" <script>alert('ไม่สำเร็จ');window.location='errorConfrim.jsp';</script>");
					out.println(" </body>");
					out.println("</html>");
				}
			}*/

		}}}}