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

/**
 * Servlet implementation class AddDiseaseServlet
 */
@WebServlet("/AddDiseaseServlet")
public class AddDiseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDiseaseServlet() {
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
		
		                //รับฟอร์ม
		String[] disease = request.getParameterValues("disease[]"); //โรค           
		
		
		
		  if(disease!= null){

		      for(int i=0; i<disease.length; i++){
			  DiseaseDAO DAO1 = new DiseaseDAO ();
			  DiseaseBean diseasebean = new DiseaseBean ();
			  diseasebean.setDisease(disease[i]);
			  DAO1.insertDisease1(diseasebean);
			  
			  
		  }}
		  
		
		if (disease!=null) {
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
				" <script>alert('สำเร็จ');window.location='Add_Diseas.jsp';</script>");
		out.println(" </body>");
		out.println("</html>");
	}
	}

}
