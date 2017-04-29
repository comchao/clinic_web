package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseDAO;
import model.DiseaseBean;
import model.SymptomsBean;

/**
 * Servlet implementation class AddSymptomDiseaseServlet
 */
@WebServlet("/AddSymptomDiseaseServlet")
public class AddSymptomDiseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSymptomDiseaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		                //รับฟอร์ม
	   
		String[] symptom = request.getParameterValues("symptom[]");
		String[] Symptom_Type = request.getParameterValues("Symptom_Type[]");
		
		
		
   	 
		  if(symptom!=null && Symptom_Type !=null  ){
		
		      for(int i=0; i<symptom.length; i++){
		    	  System.out.println("Symptom"+symptom[i]);
		    	  
		    	  DiseaseDAO DAO = new DiseaseDAO ();
		    	 
		    	  SymptomsBean Bean = new SymptomsBean ();
		    	
		    	  
		    	  Bean.setSymptom(symptom[i]);
		    	  Bean.setSymptom_Type(Symptom_Type[i]);
		    	
		    	  
		    	  DAO.insertSymptomsBean(Bean);
		     
		      
		      
		      }
		      
		      
		     
		      
		      if (symptom!=null && Symptom_Type !=null   ) {
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
							" <script>alert('ไม่สำเร็จกรุณาทำรายการใหม่อีกครั้ง');window.location='Add_Symptom.jsp';</script>");
					out.println(" </body>");
					out.println("</html>");
				}
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		  }}
	}
	


