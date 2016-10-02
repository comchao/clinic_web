package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DepositBean;
import model.DepositShopBean;
import model.OwnersBean;
import model.ShopDetailBean;
import dao.DepositDAO;
import dao.OwnersDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class ShowShopDetailServlet
 */
@WebServlet("/ShowShopDetailServlet")
public class ShowShopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowShopDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			ArrayList<DepositBean>depositList = new ArrayList<DepositBean>();
			ArrayList<ShopDetailBean>prdShopList = new ArrayList<ShopDetailBean>();
			int deposit_id =  Integer.parseInt(request.getParameter("deposit_id"));
			int cage_id =  Integer.parseInt(request.getParameter("cage_id"));
			// ดึงข้อมูลรายชื่อ
			prdShopList = ProductDAO.queryShopDetail(deposit_id);
			depositList = DepositDAO.queryDepositId(deposit_id);
			
			HttpSession session = request.getSession(true);
			
			String p = "1";
			session.setAttribute("pageN", p);
			
			// เก็บข้อมูลรายชื่อ
			session.setAttribute("allDepositSS", depositList);
			session.setAttribute("allShopSS", prdShopList);
			response.sendRedirect("showDepositDetail.jsp?deposit_id="+deposit_id+"&cage_id="+cage_id);

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
