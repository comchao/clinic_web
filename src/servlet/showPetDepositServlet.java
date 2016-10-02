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
import dao.ProductDAO;
import model.OwnersBean;
import model.ProductBean;

/**
 * Servlet implementation class showPetDepositServlet
 */
@WebServlet("/showPetDepositServlet")
public class showPetDepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showPetDepositServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			
			ArrayList<OwnersBean>ownerList = new ArrayList<OwnersBean>();
			
			// ดึงข้อมูลรายชื่อ
			ownerList = OwnersDAO.queryOwnerAll();
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			
			// เก็บข้อมูลรายชื่อ
			session.setAttribute("allOwnerSS", ownerList);

			
			response.sendRedirect("depositPet.jsp");

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
