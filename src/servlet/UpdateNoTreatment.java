package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import dao.PetsDAO;
import model.CalendarBean;
import model.PetsBean;

/**
 * Servlet implementation class UpdateNoTreatment
 */
@WebServlet("/UpdateNoTreatment")
public class UpdateNoTreatment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoTreatment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				response.setContentType("text/html;charset=UTF-8");
				request.setCharacterEncoding("UTF-8");
				
				String page = "";
				PetsDAO petDao = new PetsDAO();
				PetsBean petBean = new PetsBean();		
						      
				petBean.setId(Integer.parseInt(request.getParameter("pet_id")));
				String owner_id = request.getParameter("owner_id");
				String owner_name = request.getParameter("owner_name");
				String owner_lname = request.getParameter("owner_lname");
				String page_ownerView = request.getParameter("page_ownerView");
				
				String Status = request.getParameter("Status");
				
				CalendarDAO Statusdao = new CalendarDAO(); 
				CalendarBean  StatusCalendarBean = new CalendarBean ();
				
				if(Status!=null){
				
				StatusCalendarBean.setId(Integer.parseInt(request.getParameter("pet_id")));
				StatusCalendarBean.setStatus(Status);
				
				Statusdao.updateStatusAppointment(StatusCalendarBean);
				}

				
				
				
			    page = petDao.updateNoTreatmentPet(petBean)? "updateNoConfrim.jsp?owner_id="+owner_id+"&owner_name="+owner_name+"&owner_lname="+owner_lname+"&page_ownerView="+page_ownerView:"";

			    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				if (dispatcher != null) {		
					dispatcher.forward(request, response);
				}
	}

}
