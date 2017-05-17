package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DepositDAO;
import dao.PetsDAO;
import dao.ProductDAO;
import dao.CageTypeDAO;
import dao.TreatmentDao;
import model.CageBean;
import model.OwnersBean;
import model.DepositBean;
import model.PetsBean;
import model.ShopDetailBean;

/**
 * Servlet implementation class InsertPetDepositServlet
 */
@WebServlet("/InsertPetDepositServlet")
public class InsertPetDepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPetDepositServlet() {
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
		
		int pet_id = Integer.parseInt(request.getParameter("pet_id"));
		int owner_id = Integer.parseInt(request.getParameter("owner_id"));
		int cage_id = Integer.parseInt(request.getParameter("cage_id"));
		String food_status = request.getParameter("deposit_food");
		String deposit_in = request.getParameter("from");
		String deposit_out = request.getParameter("to");
		double deposit_receive =  Double.parseDouble(request.getParameter("cash"));
		int deposit_day = Integer.parseInt(request.getParameter("cal_day"));
		int deposit_status = Integer.parseInt(request.getParameter("deposit_status"));
		int cage_status = Integer.parseInt(request.getParameter("cage_status"));
	      
		int sizeId = Integer.parseInt(request.getParameter("sizeId"));
		
		String prd_date = request.getParameter("prd_date");
		String prd_name = request.getParameter("txtName");
		double prd_price = Double.parseDouble(request.getParameter("txtPrice"));
		int prd_qty = Integer.parseInt(request.getParameter("txtQty"));
		double prd_total = Double.parseDouble(request.getParameter("txtSum"));
		
		
		 
		 String datenow = request.getParameter("datenow");
		 System.out.println("datenow"+datenow);
		 String produc_month = request.getParameter("produc_month");
		 System.out.println("produc_month"+produc_month);
		 String produc_year = request.getParameter("produc_year");
		 System.out.println("produc_year"+produc_year);
		 
		 
		
		
		//เลขบิล ShopDetail_Bil
			
			ProductDAO ShopDetail_Bil_ProductDAO = new ProductDAO();
			List<DepositBean> List = ShopDetail_Bil_ProductDAO.ShopDetail_Bil();
			for (int i = 0; i < List.size(); i++) {
				DepositBean DepositBean = List.get(i);
				DepositBean.getNo_bil();
				
				System.out.println("No_Bil"+DepositBean.getNo_bil());
				
				DepositBean depositBean1 = new DepositBean();
				depositBean1.setNo_bil(DepositBean.getNo_bil());
				ShopDetail_Bil_ProductDAO.insertShopDetail_Bil(depositBean1);
				
				
				
		
		
		String page = "";
		DepositBean depositBean = new DepositBean();
		ShopDetailBean shopDetailBean = new ShopDetailBean();
		PetsBean petsBean = new PetsBean();
		OwnersBean ownerBean = new OwnersBean();
		CageBean cageBean = new CageBean();
		
		petsBean.setId(pet_id);
		depositBean.setRefer_pet_id(petsBean);
		ownerBean.setId(owner_id);
		depositBean.setRefer_owner_id(ownerBean);
		cageBean.setId(cage_id);
		depositBean.setRefer_cage_id(cageBean);
		depositBean.setFood_status(food_status);
		depositBean.setDeposit_in(deposit_in);
		depositBean.setDeposit_out(deposit_out);
		depositBean.setDeposit_day(deposit_day);
		depositBean.setDeposit_receive(deposit_receive);
		depositBean.setDeposit_status(deposit_status);
		
		//เพิ่มซื้อสินค้า
		shopDetailBean.setPrd_date(prd_date);
		shopDetailBean.setPrd_name(prd_name);
		shopDetailBean.setPrd_price(prd_price);
		shopDetailBean.setPrd_qty(prd_qty);
		shopDetailBean.setPrd_total(prd_total);
		
		shopDetailBean.setProduc_year(produc_year);
		shopDetailBean.setProduc_month(produc_month);
		shopDetailBean.setNo_bil(DepositBean.getNo_bil());
		
		
		
		//update กรง
		cageBean.setCage_status(cage_status);
		cageBean.setId(sizeId);
		CageTypeDAO.updateCage(cageBean);
		page = DepositDAO.insertDeposit(depositBean,shopDetailBean)? "calAddPet.jsp":"errorConfrim.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		  if (dispatcher != null) {		
				dispatcher.forward(request, response);
			}
			}}

}
