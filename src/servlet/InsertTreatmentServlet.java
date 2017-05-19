package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import dao.TreatmentDao;
import model.CalendarBean;
import model.DrugBean;
import model.PetsBean;
import model.TreatmentBean;

/**
 * Servlet implementation class InsertTreatmentServlet
 */
@WebServlet("/InsertTreatmentServlet")
public class InsertTreatmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertTreatmentServlet() {
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		 
		 String Treatment_month = request.getParameter("Treatment_month");
		 String Treatment__year = request.getParameter("Treatment__year");
		 
		 String No_Bil = request.getParameter("No_Bil");
		 
	
		int pet_id = Integer.parseInt(request.getParameter("pet_id"));
		

		String postdate = request.getParameter("postdate1");
		

		String veterinary_name = request.getParameter("veterinary_name");
		

		String cure_de = request.getParameter("cure_de");
		
		String cure_treament = request.getParameter("cure_treament");
	

		String[] drugIdArray = request.getParameterValues("drug_id[]"); // *

		String[] drugQtyArray = request.getParameterValues("drug_qty[]"); // *

		String[] otherNameArray = request.getParameterValues("other_name[]"); // *

		String[] otherPriceArray = request.getParameterValues("spanOtherPrice[]"); // *

		if (drugIdArray != null && drugQtyArray != null && otherNameArray != null && otherPriceArray != null) {
			for (int i = 0; i < otherNameArray.length; i++) {
			

				TreatmentBean treatmentBean = new TreatmentBean();
				PetsBean petsBean = new PetsBean();

				petsBean.setId(pet_id);
				treatmentBean.setRefer_pet_id(petsBean);
				treatmentBean.setTreatment_date(postdate);
				treatmentBean.setVet_name(veterinary_name);
				treatmentBean.setTreatment_detail(cure_de);
				treatmentBean.setNote(cure_treament);
				treatmentBean.setTreatment_month(Treatment_month);
				treatmentBean.setTreatment_year(Treatment__year);
				treatmentBean.setNo_Bil(No_Bil);

			

				String Status = request.getParameter("Status");

				CalendarDAO Statusdao = new CalendarDAO();
				CalendarBean StatusCalendarBean = new CalendarBean();

				if (Status != null) {

					StatusCalendarBean.setId(Integer.parseInt(request.getParameter("pet_id")));
					StatusCalendarBean.setStatus(Status);

					Statusdao.updateStatusAppointment(StatusCalendarBean);
				}

				if (TreatmentDao.insertTreatment(drugIdArray, drugQtyArray, treatmentBean, otherNameArray,
						otherPriceArray)) {
					System.out.println("insert successful.");
					response.sendRedirect("index-veterinary.jsp");

				} else {
					if (drugIdArray == null && drugQtyArray == null && otherNameArray == null
							&& otherPriceArray == null) {
						System.out.println("not insert.");

						response.sendRedirect("pet_waiting_treatment.jsp");
					}
				}

			}
		}
	}
}