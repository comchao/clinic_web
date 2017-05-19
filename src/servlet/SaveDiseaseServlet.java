package servlet;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseDAO;
import dao.ReportDAO;
import model.AnalysisBean;

/**
 * Servlet implementation class SaveDiseaseServlet
 */
@WebServlet("/SaveDiseaseServlet")
public class SaveDiseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveDiseaseServlet() {
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
		/*ตัวแปรที่รับเข้ามา*/
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int report_id = Integer.parseInt(request.getParameter("report_id"));
		
		String id = request.getParameter("id");
		/*ส่วนชองการ Report*/
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String[] Disease = request.getParameterValues("Disease[]");
		String[] SumPercentag = request.getParameterValues("SumPercentage");
		String[] Sum = request.getParameterValues("Sum[]");
		String[] id_member = request.getParameterValues("id_member[]");
		String[] id_pet = request.getParameterValues("id_pet[]");
		
		
		
		
		
		if(Disease != null ){
		for (int i = 0; i < Disease.length; i++) {
			
			DecimalFormat df = new DecimalFormat();
			df.applyPattern("0.0");
		
			
			float SumPercentage = 0;
			SumPercentage = Float.parseFloat(SumPercentag[i]);
			System.out.println("Disease: =" +Disease[i]);
			System.out.println(i+1);
            System.out.println("SumPercentag: ="+new DecimalFormat("0.0").format(SumPercentage));
            
            AnalysisBean Bean = new AnalysisBean();
            DiseaseDAO percentageDAO = new DiseaseDAO();
            Bean.setId(i+1);
			Bean.setSumPercentage(SumPercentage); 
			Bean.setDisease(Disease[i]);
			Bean.setPercentage(Sum[i]);
			Bean.setId_member(Integer.parseInt(id_member[i]));
			Bean.setId_pet(Integer.parseInt(id_pet[i]));
			
			percentageDAO.insertanalysisdisease(Bean);
			percentageDAO.insertanalysisdisease_report(Bean);
	}}
		/*สิ้นสุดส่วนชองการ Report*/
		
		
		if (report_id == 7) { 
		    
			if (ReportDAO.Disease(id)) {
				System.out.println("Servlet:"+id);

				response.sendRedirect(
						"AnalysisDisease.jsp?id="+id);

			} else {
				response.sendRedirect("reportUnConfrim.jsp");
			}
		


}}}
