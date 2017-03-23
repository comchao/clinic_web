package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import model.CalendarBean;

/**
 * Servlet implementation class DeletAppointmentServlet
 */
@WebServlet("/DeletAppointmentServlet")
public class DeletAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletAppointmentServlet() {
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
		
			String id_auto = request.getParameter("id_auto");
			
		
			CalendarBean bean = new CalendarBean();
			CalendarDAO dao = new CalendarDAO();

			bean.setId_auto(Integer.parseInt(id_auto)); // id pet
			System.out.println("id_auto" + id_auto);

			
			dao.deleteAppointment(bean);

			if (id_auto!=null) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE HTML>");
				out.println("<html>");
				out.println(" <body>");
				out.println(" <script>alert('สำเร็จ');window.location='CalendarServlet2';</script>");
				out.println("</body>");
				out.println("</html>");
			} else {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE HTML>");
				out.println("<html>");
				out.println(" <body>");
				out.println(
						" <script>alert('ไม่สำเร็จกรุณาทำรายการใหม่อีกครั้ง');window.location='CalendarServlet2';</script>");
				out.println(" </body>");
				out.println("</html>");
			}

}}