package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TreatmentDao;
import model.TreatmentBean;

/**
 * Servlet implementation class TreatmentUpdatePaymentServlet
 */
@WebServlet("/TreatmentUpdatePaymentServlet")
public class TreatmentUpdatePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TreatmentUpdatePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubrequest.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int tm_id = Integer.parseInt(request.getParameter("tm_id"));
		System.out.println("TreatmentUpdatePaymentServlet tm_id="+tm_id);
		TreatmentBean tm = new TreatmentBean();
		tm.setId(tm_id);
		System.out.println("tm_id"+"หน้า TreatmentUpdatePaymentServlet");
		if(TreatmentDao.updateStatusPayment(tm)){
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE HTML>");
			out.println("<html>");
			out.println(" <body>");
			out.println(" <script>window.location='ShowPaymentServlet';</script>");
			out.println(" </body>");
			out.println("</html>");
		}else{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE HTML>");
			out.println("<html>");
			out.println(" <body>");
			out.println(" <script>alert('เกิดข้อผิดพลาดบางประการ กรุณาตรวจสอบรายละเอียดอีกครั้ง');window.location='paymentView.jsp';</script>");
			out.println(" </body>");
			out.println("</html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
