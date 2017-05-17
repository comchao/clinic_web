package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CageBean;
import model.DepositBean;
import model.OwnersBean;
import model.PetsBean;
import model.ShopDetailBean;
import dao.CageTypeDAO;
import dao.DepositDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class UpdatePrdDepositServlet
 */
@WebServlet("/UpdatePrdDepositServlet")
public class UpdatePrdDepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePrdDepositServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		int refer_petdeposit = Integer.parseInt(request.getParameter("refer_petdeposit"));
		String prd_date = request.getParameter("prd_date");
		String prd_name = request.getParameter("pro_name");
		double prd_price = Double.parseDouble(request.getParameter("product_price"));
		int prd_qty = Integer.parseInt(request.getParameter("product_qty"));
		int cage_id =  Integer.parseInt(request.getParameter("cage_id"));
		double prd_total = prd_price*prd_qty;
		
		 String datenow = request.getParameter("datenow");
		 System.out.println("datenow"+datenow);
		 String produc_month = request.getParameter("produc_month");
		 System.out.println("produc_month"+produc_month);
		 String produc_year = request.getParameter("produc_year");
		 System.out.println("produc_year"+produc_year);
		 String No_bil = request.getParameter("No_bil");
		 
		 
		String page = "";
		DepositBean depositBean = new DepositBean();
		depositBean.setId(refer_petdeposit);
		ShopDetailBean shopDetailBean = new ShopDetailBean();
		
		//เพิ่มซื้อสินค้า
		shopDetailBean.setRefer_petdeposit(depositBean);
		shopDetailBean.setPrd_date(prd_date);
		shopDetailBean.setPrd_name(prd_name);
		shopDetailBean.setPrd_price(prd_price);
		shopDetailBean.setPrd_qty(prd_qty);
		shopDetailBean.setPrd_total(prd_total);
		
		shopDetailBean.setProduc_month(produc_month);
		shopDetailBean.setProduc_year(produc_year);
		shopDetailBean.setNo_bil(No_bil);
		
		/*ProductDAO ShopDetail_Bil_ProductDAO = new ProductDAO();
		List<DepositBean> List = ShopDetail_Bil_ProductDAO.ShopDetail_Bil();
		for (int i = 0; i < List.size(); i++) {
			DepositBean DepositBean = List.get(i);
			DepositBean.getNo_bil();
			
			System.out.println("No_Bil"+DepositBean.getNo_bil());
		
			
			
			DepositBean depositBean1 = new DepositBean();
			depositBean1.setNo_bil(DepositBean.getNo_bil());
			ShopDetail_Bil_ProductDAO.insertShopDetail_Bil(depositBean1);*/
		
		page = ProductDAO.insertDeposit(depositBean,shopDetailBean)? "inPrdDeConfrim.jsp?refer_petdeposit="+refer_petdeposit+"&cage_id="+cage_id:"errorConfrim.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		  if (dispatcher != null) {		
				dispatcher.forward(request, response);
			}
	/*}*/}

}
