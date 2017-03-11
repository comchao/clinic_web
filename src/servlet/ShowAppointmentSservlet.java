package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OwnersDAO;
import model.OwnersBean;

/**
 * Servlet implementation class ShowAppointmentSservlet
 */
@WebServlet("/ShowAppointmentSservlet")
public class ShowAppointmentSservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAppointmentSservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//เรียกข้อมูลเพื่อเพิ่มข้อมูลการนัดหมาย
		request.setCharacterEncoding("UTF-8");
		try {
			
			ArrayList<OwnersBean>ownerList = new ArrayList<OwnersBean>();
			
			// ดึงข้อมูลรายชื่อสินค้า
			ownerList = OwnersDAO.queryOwnerAll();
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			
			// เก็บข้อมูล
			session.setAttribute("allOwnerSS", ownerList);

			
			response.sendRedirect("ShowAppointment.jsp");

		} catch (Exception ex) {
			ex.printStackTrace(System.out);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
