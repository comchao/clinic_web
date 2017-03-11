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

		int pet_id = Integer.parseInt(request.getParameter("pet_id"));
		System.out.println("1.pet_id:=" + pet_id);

		String postdate = request.getParameter("postdate1");
		System.out.println("2.postdate:=" + postdate);

		String veterinary_name = request.getParameter("veterinary_name");
		System.out.println("3.veterinary_name:=" + veterinary_name);

		String cure_de = request.getParameter("cure_de");
		System.out.println("4.cure_de:=" + cure_de);

		String cure_treament = request.getParameter("cure_treament");
		System.out.println("5.cure_treament:=" + cure_treament);

		String[] drugIdArray = request.getParameterValues("drug_id[]"); // *

		String[] drugQtyArray = request.getParameterValues("drug_qty[]"); // *

		String[] otherNameArray = request.getParameterValues("other_name[]"); // *

		String[] otherPriceArray = request.getParameterValues("spanOtherPrice[]"); // *

		if (drugIdArray != null && drugQtyArray != null && otherNameArray != null && otherPriceArray != null) {
			for (int i = 0; i < drugQtyArray.length; i++) {
				System.out.println("6.drugIdArray :=" + drugIdArray[i]);
				System.out.println("7.drugQtyArray =" + drugQtyArray[i]);
				System.out.println("8.otherNameArray:=" + otherNameArray[i]);
				System.out.println("9.otherPriceArray:=" + otherPriceArray[i]);

				TreatmentBean treatmentBean = new TreatmentBean();
				PetsBean petsBean = new PetsBean();

				petsBean.setId(pet_id);
				treatmentBean.setRefer_pet_id(petsBean);
				treatmentBean.setTreatment_date(postdate);
				treatmentBean.setVet_name(veterinary_name);
				treatmentBean.setTreatment_detail(cure_de);
				treatmentBean.setNote(cure_treament);

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
					response.sendRedirect("showPetWaitingServlet");

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