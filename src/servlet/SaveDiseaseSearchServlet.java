package servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiseaseDAO;
import dao.OwnersDAO;
import dao.PetsDAO;
import model.AnalysisBean;
import model.OwnersBean;
import model.PetsBean;

/**
 * Servlet implementation class SaveDiseaseSearchServlet
 */
@WebServlet("/SaveDiseaseSearchServlet")
public class SaveDiseaseSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveDiseaseSearchServlet() {
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
		
		request.setCharacterEncoding("utf-8");

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    String[] Disease = request.getParameterValues("Disease");
		String[] SumPercentage = request.getParameterValues("SumPercentage");
		String[] percentage = request.getParameterValues("percentage");
		
		
		
          for(int i=0; i<Disease.length; i++){ 
          DecimalFormat df = new DecimalFormat();
	  	 df.applyPattern("0.0");
		
		float SumPercentag = 0 ; 
		SumPercentag = Float.parseFloat(SumPercentage[i]);
		

       System.out.println(new DecimalFormat("0.0").format(SumPercentag)); 
    	System.out.println(Disease[i]);
		System.out.println(percentage[i]);
		
		AnalysisBean Bean = new AnalysisBean();
        DiseaseDAO percentageDAO = new DiseaseDAO();
		Bean.setSumPercentage(SumPercentag);; 
		Bean.setDisease(Disease[i]);
		Bean.setId(i+1);
		Bean.setPercentage(percentage[i]);
		percentageDAO.insertdisease_percentage(Bean);
          }
		request.setCharacterEncoding("utf-8");

		PetsBean pb = new PetsBean();
		pb.setPet_name(request.getParameter("pet_name"));
		ArrayList<PetsBean> petList = PetsDAO.search(pb);
				HttpSession session = request.getSession(true);
				String p = "1";
				session.setAttribute("pageN", p);
				session.setAttribute("allPetSS",petList);
			
				response.sendRedirect("SaveDiseaseShow.jsp");
	

}
}