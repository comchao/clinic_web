package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.ProductBean;

/**
 * Servlet implementation class showProductServlet
 */
@WebServlet("/showProductServlet")
public class showProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			
		
			ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
			
		
			productList = ProductDAO.queryProdtuctAll();
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			String Id = request.getParameter("id");
			System.out.println("Id:"+Id);
			
			
			session.setAttribute("allProductSS", productList);

			
			response.sendRedirect("productView.jsp");

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
