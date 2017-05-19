package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReportDAO;

/**
 * Servlet implementation class Pet_depositServlet
 */
@WebServlet("/Pet_depositServlet")
public class Pet_depositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pet_depositServlet() {
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
		request.setCharacterEncoding("utf-8");  
	    response.setCharacterEncoding("utf-8");
		
		
		String deposit_id = request.getParameter("deposit_id");
		
		
	
		//วันที่ออกรายงาน  ณ
		String datenow = request.getParameter("datenow");  
		
		
		
		String No_bil = request.getParameter("No_bil");  
		
		
			
			
			if (ReportDAO.printDepositBill(deposit_id,datenow,No_bil)) {
				int cage_id = Integer.parseInt(request.getParameter("cg_id"));
				response.sendRedirect("report5Confrim.jsp?deposit_id=" + deposit_id + "&cage_id=" + cage_id);

			} else {
				response.sendRedirect("report5UnConfrim.jsp");
			}
			
			
			
	}}


