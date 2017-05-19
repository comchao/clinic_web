package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dao.ReportDAO;
import dao.TreatmentDao;
import model.DepositBean;

/**
 * Servlet implementation class PaymentBilServlet
 */
@WebServlet("/PaymentBilServlet")
public class PaymentBilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentBilServlet() {
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
		System.out.println("report_id"+report_id);
		String id = request.getParameter("id");
		System.out.println("id"+id);
		
		
		if (report_id == 4) {// ใบเสร็จค่ารักษาและยา
			
			request.setCharacterEncoding("utf-8");  
		    response.setCharacterEncoding("utf-8");
			String datenow = request.getParameter("datenow");
			System.out.println("datenow"+datenow);
			String name = request.getParameter("name");
			System.out.println("name"+name);
//เลขบิล ShopDetail_Bil
			
			TreatmentDao TreatmentDao = new TreatmentDao();
			List<DepositBean> List = TreatmentDao.treatment_Bil(id);
			for (int i = 0; i < List.size(); i++) {
				DepositBean DepositBean = List.get(i);
				DepositBean.getNo_bil();
				
				
			
				
				
				

			
			String No_bil = DepositBean.getNo_bil();;
			System.out.println("treatment_Bil"+DepositBean.getNo_bil());
			
			
			if (ReportDAO.printDrugTreatment(id, name, datenow ,No_bil)) {
				response.sendRedirect("report4Confrim.jsp?tm_id=" + id + "&name=" + name + "&datenow=" + datenow);

			} else {
				response.sendRedirect("report4UnConfrim.jsp");
			}}
	}
		
		
		
		
		

}}
