package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PetsDAO;
import model.PetsBean;

/**
 * Servlet implementation class showPetWaitingServlet
 */
@WebServlet("/showPetWaitingServlet")
public class showPetWaitingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showPetWaitingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			
			ArrayList<PetsBean> petList = new ArrayList<PetsBean>();
			
			// ดึงข้อมูล
			
			petList = PetsDAO.queryPetsByName(0);
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			
			// เก็บข้อมูลรายชื่อสินค้า
			session.setAttribute("allPetWaitingSS", petList);

			
			response.sendRedirect("pet_waiting_treatment.jsp");

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
