package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseDAO;
import model.DiseaseBean;
import model.SymptomsBean;

/**
 * Servlet implementation class AddDataDiseaseServlet
 */
@WebServlet("/AddDataDiseaseServlet")
public class AddDataDiseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDataDiseaseServlet() {
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
		
		
		for (int i = 0; i < 50; i++) {
		
		                //รับฟอร์ม
		String disease = request.getParameter("disease");    //โรค           
		String symptom = request.getParameter("symptom"+i);
		
		
		 
		    	  DiseaseDAO DAO = new DiseaseDAO ();
		    	 
		    	  SymptomsBean Bean = new SymptomsBean ();
		    	
		    	  Bean.setDisease(disease);
		    	  System.out.println(disease);
		    	 
		    	  Bean.setSymptom(symptom); 
		    	  System.out.println(symptom);
		    	 
		    	
		    	  
		    	  DAO.insertDiseaseData(Bean);
		     
		      
		      
		  
		      
		      
		     
		      
		      if (disease!=null && symptom !=null   ) {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<!DOCTYPE HTML>");
					out.println("<html>");
					out.println(" <body>");
					out.println(" <script>alert('สำเร็จ');window.location='AddDisease.jsp';</script>");
					out.println("</body>");
					out.println("</html>");
				} else {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<!DOCTYPE HTML>");
					out.println("<html>");
					out.println(" <body>");
					out.println(
							" <script>alert('สำเร็จ');window.location='AddDisease.jsp';</script>");
					out.println(" </body>");
					out.println("</html>");
				}
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		  }}}
	
	


