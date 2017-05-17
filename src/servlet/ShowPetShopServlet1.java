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

import dao.ProductDAO;
import dao.ReportDAO;
import dao.purchaseDAO;
import model.DepositBean;
import model.ProductBean;
import model.purchaseBean;

/**
 * Servlet implementation class ShowPetShopServlet1
 */
@WebServlet("/ShowPetShopServlet1")
public class ShowPetShopServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPetShopServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			//เลขบิล ShopDetail_Bil
			
			ProductDAO ShopDetail_Bil_ProductDAO = new ProductDAO();
			List<DepositBean> List = ShopDetail_Bil_ProductDAO.ShopDetail_Bil1();
			for (int i = 0; i < List.size(); i++) {
				DepositBean DepositBean = List.get(i);
				DepositBean.getNo_bil();
				
				System.out.println("No_bil "+DepositBean.getNo_bil());
			
		int id = 1;
			
			// ใบรายงานการวินิจฉัยโรคของสัตร์
		
		    String No_bil = DepositBean.getNo_bil();
			ReportDAO ReportDAO = new ReportDAO();
				if (ReportDAO.BillPurchase(id,No_bil)) {


			ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
			
			// ดึงข้อมูลรายชื่อสินค้า
			productList = ProductDAO.queryProdtuctAll();
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			
			// เก็บข้อมูลรายชื่อสินค้า
			session.setAttribute("allProductSS", productList);

			//ลบข้อมูลสินค้าในตะกร้าสินค้าทั้งหมด
			purchaseDAO dao2 = new purchaseDAO();
			List<purchaseBean> List2 = dao2.getpurchaseID();
			for (int i2 = 0; i2 < List2.size(); i2++) {
				purchaseBean bean = List2.get(i2);

				purchaseDAO DAO = new purchaseDAO();
				purchaseBean Bean = new purchaseBean();
				Bean.setId(bean.getId());
				DAO.deleteall(Bean);
			
			}
			response.sendRedirect("petshop_view.jsp");
			
				} else {
					response.sendRedirect("reportUnConfrim.jsp");
				}
			}} catch (Exception ex) {
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
