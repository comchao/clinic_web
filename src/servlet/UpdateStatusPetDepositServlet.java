package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CageBean;
import model.DepositBean;
import dao.CageTypeDAO;
import dao.DepositDAO;

/**
 * Servlet implementation class UpdateStatusPetDepositServlet
 */
@WebServlet("/UpdateStatusPetDepositServlet")
public class UpdateStatusPetDepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatusPetDepositServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubrequest.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int deposit_id = Integer.parseInt(request.getParameter("deposit_id"));
		int cage_id = Integer.parseInt(request.getParameter("cage_id"));

		CageBean cage = new CageBean();
		cage.setId(cage_id);
		
		DepositBean deposit = new DepositBean();
		deposit.setId(deposit_id);
		
		if(DepositDAO.updateStatusPayment(deposit)){
			CageTypeDAO.updateStatusPayment(cage);
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE HTML>");
			out.println("<html>");
			out.println(" <body>");
			out.println(" <script>window.location='showDepositHistoryServlet';</script>");
			out.println(" </body>");
			out.println("</html>");
		}else{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE HTML>");
			out.println("<html>");
			out.println(" <body>");
			out.println(" <script>alert('เกิดข้อผิดพลาดบางประการ กรุณาตรวจสอบรายละเอียดอีกครั้ง');window.location='showDepositHistoryServlet';</script>");
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
