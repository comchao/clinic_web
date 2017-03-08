package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DepositBean;
import model.ProductBean;
import model.ShopDetailBean;
import model.TreatmentBean;
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
		
		ShopDetailBean shopDetailBean = new ShopDetailBean();
		shopDetailBean.setRefer_petdeposit(depositBean);
		shopDetailBean.setPrd_date(datenow);
		System.out.println(datenow);
		ProductDAO.inserPetShop(shopDetailBean , pNameArray, pQtyArray, pPriceArray ,pTotalArray);
			response.sendRedirect("insertPetShopConfrim.jsp");
		
	}

}
