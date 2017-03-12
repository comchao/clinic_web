package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import model.CalendarBean;

/**
 * Servlet implementation class insertAppointmentServlet
 */
@WebServlet("/insertAppointmentServlet")
public class insertAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public insertAppointmentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");

			String Id = request.getParameter("id");
			String Id_calendar = request.getParameter("idmenber");
			String Title = request.getParameter("title");
			String date = request.getParameter("date");
			String date_time = request.getParameter("date");
			String Id_ownerdata = request.getParameter("id_ownerdata");
			String Note = request.getParameter("note");

			CalendarBean bean = new CalendarBean();
			CalendarDAO dao = new CalendarDAO();

			bean.setId(Integer.parseInt(Id)); // id pet
			System.out.println("Id" + Id);

			bean.setId_calendar(Integer.parseInt(Id_calendar)); // id pet
			System.out.println("Id_calendar" + Id_calendar);

			bean.setTitle(Title); // เรื่องนัดหมาย
			System.out.println("Title" + Title);

			SimpleDateFormat sourceDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date date1;
			date1 = sourceDateFormat.parse(date_time);

			SimpleDateFormat targetDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			System.out.println(targetDateFormat.format(date1));

			bean.setDate_time(targetDateFormat.format(date1)); // วันนัด
			System.out.println("date_time" + targetDateFormat.format(date1));

	
			bean.setDate(date); // เวลานัดหมาย
															// เเละเวลา
			System.out.println("date" + date);
			

			bean.setId_ownerdata(Integer.parseInt(Id_ownerdata));// เจ้าของสัตว์เลี้ยง
			System.out.println("Id_ownerdata" + Id_ownerdata);

			bean.setNot(Note); // หมายเหตุอื่นๆๆ
			System.out.println("Note" + Note);

			dao.insertAppointment(bean);

			if (bean.isValid()) {
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
