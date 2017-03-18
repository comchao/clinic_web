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
 * Servlet implementation class Analysis_disease_SaveServlet
 */
@WebServlet("/Analysis_disease_ShowServlet")
public class Analysis_disease_ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Analysis_disease_ShowServlet() {
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

					
					response.sendRedirect("Analysis_disease_ShowServlet.jsp");

				} catch (Exception ex) {
					ex.printStackTrace(System.out);
				}
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
