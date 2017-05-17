package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AnalysisBean;
import model.DepositBean;
import model.ProductBean;
import model.ShopDetailBean;
import model.TreatmentBean;
import dao.DiseaseDAO;
import dao.ProductDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class InsertProductHisServlet
 */
@WebServlet("/InsertProductHisServlet")
public class InsertProductHisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductHisServlet() {
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
		
		
		
		
		 String datenow = request.getParameter("datenow");
		 String produc_year = request.getParameter("produc_year");
		 String produc_month = request.getParameter("produc_month"); 

		System.out.println("datenow"+datenow);
		String[] pNameArray = request.getParameterValues("Product_name[]");
		System.out.println("Product_name"+pNameArray);
		String[] pQtyArray = request.getParameterValues("Totalnumber[]");
		System.out.println("Totalnumber"+pQtyArray);
		String[] pPriceArray = request.getParameterValues("Product_price[]");
		System.out.println("Product_price"+pPriceArray);
		String[] pTotalArray = request.getParameterValues("Totalprice[]");
		System.out.println("Totalprice"+pTotalArray);
		DepositBean depositBean = new DepositBean();
		depositBean.setId(0);
		
	
		
		//เลขบิล ShopDetail_Bil
		
		ProductDAO ShopDetail_Bil_ProductDAO = new ProductDAO();
		List<DepositBean> List = ShopDetail_Bil_ProductDAO.ShopDetail_Bil();
		for (int i = 0; i < List.size(); i++) {
			DepositBean DepositBean = List.get(i);
			DepositBean.getNo_bil();
			
			System.out.println("No_Bil"+DepositBean.getNo_bil());
		
			
			
			DepositBean Bean = new DepositBean();
			Bean.setNo_bil(DepositBean.getNo_bil());
			ShopDetail_Bil_ProductDAO.insertShopDetail_Bil(Bean);
			
			
			//insert shopDetail DB 
			ShopDetailBean shopDetailBean = new ShopDetailBean();
			shopDetailBean.setRefer_petdeposit(depositBean);
			shopDetailBean.setPrd_date(datenow);
			shopDetailBean.setProduc_year(produc_year);
			shopDetailBean.setProduc_month(produc_month);
			//เลขบิล ShopDetail_Bil
			shopDetailBean.setNo_bil(DepositBean.getNo_bil());
			
			

		System.out.println(datenow);
		ProductDAO.inserPetShop(shopDetailBean , pNameArray, pQtyArray, pPriceArray ,pTotalArray);
			response.sendRedirect("insertPetShopConfrim.jsp");
		
	}}

}
