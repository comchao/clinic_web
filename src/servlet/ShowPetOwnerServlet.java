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
 * Servlet implementation class ShowPetOwnerServlet
 */
@WebServlet("/ShowPetOwnerServlet")
public class ShowPetOwnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPetOwnerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			
			ArrayList<PetsBean> petOwnerList = new ArrayList<PetsBean>();
			int owner_id = Integer.parseInt(request.getParameter("owner_id"));
			String name = request.getParameter("owner_name");
			String lname = request.getParameter("owner_lname");
			// ดึงข้อมูล
			petOwnerList = PetsDAO.queryPetsByName(owner_id);
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			
			// เก็บข้อมูล
			session.setAttribute("allPetSS", petOwnerList);
		
			
			response.sendRedirect("pet_view.jsp");

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
