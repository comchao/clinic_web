package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
		response.setCharacterEncoding("UTF-8");
		try {
			ArrayList<SymptomsBean> diseaseList = new ArrayList<SymptomsBean>();
			// ดึงข้อมูลอาการโรค
			diseaseList = DiseaseDAO.getdisease();
			HttpSession session = request.getSession(true);
			/*
			 * String p = "1"; session.setAttribute("pageN", p);
			 */
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

		

		for (int i = 0; i < 50; i++) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String value = request.getParameter("value" + i);
			String symptom = request.getParameter("symptom" + i);
			if (value != null && symptom != null) {

				DiseaseDAO dao = new DiseaseDAO();
				List<AnalysisBean> List = dao.symptom(symptom);
				
				for (int i1 = 0; i1 < List.size(); i1++) {
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8");
					AnalysisBean bean = List.get(i1);

					System.out.println("Symptom:" + bean.getSymptom());
					System.out.println("Disease" + bean.getDisease());

	
					DiseaseDAO DAO = new DiseaseDAO();

					AnalysisBean Bean = new AnalysisBean();
					Bean.setSymptom(bean.getSymptom());
					Bean.setDisease(bean.getDisease());
					Bean.setValue(Float.parseFloat(value));
					DAO.insertDisease(Bean);

				

					DiseaseDAO dao2 = new DiseaseDAO();

					List<AnalysisBean> List2 = dao2.getvaluecolum();
					for (int i2 = 0; i2 < List2.size(); i2++) {
						request.setCharacterEncoding("UTF-8");
						response.setCharacterEncoding("UTF-8");
						AnalysisBean bean2 = List2.get(i2);

						System.out.println("*Totalvalue*" + bean2.getTotalvalue());
						System.out.println("*Totalcolum*" + bean2.getTotalcolum());

						float Totalvalue = bean2.getTotalvalue();
						float Totalcolum = bean2.getTotalcolum();

						float Total = 0;
						float Total1 = 0;
						Total = Totalvalue / Totalcolum;
						Total1 = Total / Totalcolum;
                        System.out.println(Total1);
                        
                      
						
                        DiseaseDAO DAO2 = new DiseaseDAO();
						
				       AnalysisBean Bean2 = new AnalysisBean();

				       Bean2.setSymptom(bean.getSymptom());

				       Bean2.setSum(Total1);

							// DAO login
							DAO2.updateSum(Bean2);

							if (Bean2.isValid()) {
								response.setContentType("text/html");
								PrintWriter out = response.getWriter();
								out.println("<!DOCTYPE HTML>");
								out.println("<html>");
								out.println(" <body>");
								out.println(" <script>alert('สำเร็จ');window.location='AnalysisDisease.jsp';</script>");
								out.println("</body>");
								out.println("</html>");
							} else {
								response.setContentType("text/html");
								PrintWriter out = response.getWriter();
								out.println("<!DOCTYPE HTML>");
								out.println("<html>");
								out.println(" <body>");
								out.println(" <script>alert('สำเร็จ');window.location='AnalysisDisease.jsp';</script>");
								out.println(" </body>");
								out.println("</html>");
							}
						}
				}}}}}
	