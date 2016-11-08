package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseDAO;
import model.AnalysisBean;

/**
 * Servlet implementation class ClearDataServlet
 */
@WebServlet("/ClearDataServlet")
public class ClearDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClearDataServlet() {
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
		
		String[] id = request.getParameterValues("id[]");
		 for(int i=0; i<id.length; i++){
			 
	    	  System.out.println("ID:"+id[i]);
	    	  
	    	  DiseaseDAO DAO = new DiseaseDAO();
              AnalysisBean Bean = new AnalysisBean();
              Bean.setId(Integer.parseInt(id[i]));
              DAO.ClearData(Bean);
              if (Bean.isValid()) {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<!DOCTYPE HTML>");
					out.println("<html>");
					out.println(" <body>");
					out.println(" <script>alert('สำเร็จ');window.location='DiseaseGetSymptomServlet';</script>");
					out.println("</body>");
					out.println("</html>");
				} else {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<!DOCTYPE HTML>");
					out.println("<html>");
					out.println(" <body>");
					out.println(" <script>alert('สำเร็จ');window.location='DiseaseGetSymptomServlet';</script>");
					out.println(" </body>");
					out.println("</html>");
				}
		 }}}
