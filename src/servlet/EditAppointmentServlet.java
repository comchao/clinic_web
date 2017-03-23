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
 * Servlet implementation class EditAppointmentServlet
 */
@WebServlet("/EditAppointmentServlet")
public class EditAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAppointmentServlet() {
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
		
		try{
			
			
			
		    request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		
			String id_auto = request.getParameter("id_auto");
			String Title = request.getParameter("title");
			String Date = request.getParameter("date");
			String Note = request.getParameter("note");
			String date_time = request.getParameter("date"); 
			
		
		
			CalendarBean bean = new CalendarBean();
			CalendarDAO dao = new CalendarDAO();

			bean.setId_auto(Integer.parseInt(id_auto)); // id pet
			System.out.println("id_auto" + id_auto);

			
			bean.setTitle(Title);             // เรื่องนัดหมาย
			System.out.println("Title" + Title);
			
			
			bean.setDate(Date);                             // เวลานัดหมาย
			
			System.out.println("date" + Date);

			SimpleDateFormat sourceDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date date1;
			date1 = sourceDateFormat.parse(date_time);

			SimpleDateFormat targetDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			bean.setDate_time(targetDateFormat.format(date1)); // วันนัด
			System.out.println("date_time" + targetDateFormat.format(date1));

	
			
			
			bean.setNote(Note);                              // หมายเหตุอื่นๆๆ
			System.out.println("Note" + Note);

			dao.UpdateAppointment(bean);

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

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}