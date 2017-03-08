package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import dao.purchaseDAO;
import model.CalendarBean;
import model.purchaseBean;

/**
 * Servlet implementation class deletepurchase
 */
@WebServlet("/deletepurchase")
public class deletepurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletepurchase() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String page = "";
		purchaseBean bean = new purchaseBean();
		purchaseDAO  dao = new purchaseDAO(); 
	
		
		bean.setProduct_name(request.getParameter("Product_name"));
		page = dao.deletepurchase(bean)?"cart.jsp":"cart.jsp";

		    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			if (dispatcher != null) {		
				dispatcher.forward(request, response);
			}
		}

}
