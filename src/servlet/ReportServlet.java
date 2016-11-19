package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReportDAO;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int report_id = Integer.parseInt(request.getParameter("report_id"));

		String date_start = request.getParameter("date_start");
		String date_end = request.getParameter("date_end");
		String id = request.getParameter("id");
		String deposit_id = request.getParameter("deposit_id");


		if (report_id == 1) {
			if ((ReportDAO.printPetShop(date_start, date_end)) != false) {
				response.sendRedirect("reportConfrim.jsp");

			} else {
				response.sendRedirect("reportUnConfrim.jsp");
			}
		} else if (report_id == 2) {
			if (ReportDAO.printDrug(date_start, date_end)) {
				response.sendRedirect("reportConfrim.jsp");

			} else {
				response.sendRedirect("reportUnConfrim.jsp");
			}
		} else if (report_id == 3) {
			if (ReportDAO.printTreatment(date_start, date_end)) {
				response.sendRedirect("reportConfrim.jsp");

			} else {
				response.sendRedirect("reportUnConfrim.jsp");
			}

		}
		
		// ใบรายรายการนัดหมาย
		else if (report_id == 6) { 
			    
			if (ReportDAO.Calendar(id, date_start, date_end)) {
				System.out.println("Servlet:"+id+date_start+date_end);

				response.sendRedirect(
						"reportConfrim.jsp?id="+id+"&date_start=" + date_start+ "date_end=" + date_end);

			} else {
				response.sendRedirect("reportUnConfrim.jsp");
			}

		}
		// สิ้นสุดใบรายรายการนัดหมาย
		

		

		// ใบรายงานการวินิจฉัยโรคของสัตร์
		else if (report_id == 7) { 
			    
			if (ReportDAO.Disease(id)) {
				System.out.println("Servlet:"+id);

				response.sendRedirect(
						"AnalysisDisease.jsp?id="+id);

			} else {
				response.sendRedirect("reportUnConfrim.jsp");
			}

		}
		// สิ้นสุดใบรายงานวินิจฉัยโรคของสัตร์
		
		
		
		
		
		
		
		else if (report_id == 4) {// ใบเสร็จค่ารักษาและยา
			String date_now = request.getParameter("date_now");
			String name = new String(request.getParameter("name").getBytes("ISO8859_1"), "UTF8");
			if (ReportDAO.printDrugTreatment(id, name, date_now)) {
				response.sendRedirect("report4Confrim.jsp?tm_id=" + id + "&name=" + name + "&date_now=" + date_now);

			} else {
				response.sendRedirect("report4UnConfrim.jsp");
			}

		} else if (report_id == 5) {// ใบเสร็จค่าฝากเลี้ยง
			if (ReportDAO.printDepositBill(deposit_id)) {
				int cage_id = Integer.parseInt(request.getParameter("cg_id"));
				response.sendRedirect("report5Confrim.jsp?deposit_id=" + deposit_id + "&cage_id=" + cage_id);

			} else {
				response.sendRedirect("report5UnConfrim.jsp");
			}

		}
		try {
			// Do something
		} catch (Exception e) {
			// No rethrowing or logging, just suppressing
		}

	}

}
