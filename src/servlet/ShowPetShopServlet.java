package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AnalysisBean;
import model.ProductBean;
import model.purchaseBean;
import dao.DiseaseDAO;
import dao.ProductDAO;
import dao.purchaseDAO;

/**
 * Servlet implementation class ShowPetShopServlet
 */
@WebServlet("/ShowPetShopServlet")
public class ShowPetShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPetShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			
			//ลบข้อมูลสินค้าในตะกร้าสินค้าทั้งหมด
			purchaseDAO dao = new purchaseDAO();
			List<purchaseBean> List = dao.getpurchaseID();
			for (int i = 0; i < List.size(); i++) {
				purchaseBean bean = List.get(i);

				purchaseDAO DAO = new purchaseDAO();
				purchaseBean Bean = new purchaseBean();
				Bean.setId(bean.getId());
				DAO.deleteall(Bean);
			
			}
			
			
	
			
			ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
			
			// ดึงข้อมูลรายชื่อสินค้า
			productList = ProductDAO.queryProdtuctAll();
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			
			// เก็บข้อมูลรายชื่อสินค้า
			session.setAttribute("allProductSS", productList);

			
			response.sendRedirect("petshop_view.jsp");

		} catch (Exception ex) {
			ex.printStackTrace(System.out);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
