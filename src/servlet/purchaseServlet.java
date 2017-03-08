package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.purchaseDAO;
import model.purchaseBean;

/**
 * Servlet implementation class purchaseServlet
 */
@WebServlet("/purchaseServlet")
public class purchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public purchaseServlet() {
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
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		String Product_name = request.getParameter("Product_name");
		
		String Product_price = request.getParameter("Product_price"); 
		
		String  number = request.getParameter("number");
		
		purchaseBean bean = new purchaseBean();
		bean.setProduct_name(Product_name);
		bean.setProduct_price(Double.parseDouble(Product_price));
		bean.setNumber(Integer.parseInt(number));
		purchaseDAO  dao = new purchaseDAO(); 
		
		dao.purchase(bean);
		
		
		response.sendRedirect("cart.jsp");
	} catch (Exception ex) {
		ex.printStackTrace(System.out);
	}}
}