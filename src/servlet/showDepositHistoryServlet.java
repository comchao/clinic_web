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
import model.PetsBean;
import dao.DepositDAO;

/**
 * Servlet implementation class showDepositHistoryServlet
 */
@WebServlet("/showDepositHistoryServlet")
public class showDepositHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showDepositHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
ArrayList<DepositBean>depositList = new ArrayList<DepositBean>();
		
		depositList = DepositDAO.queryDepositAll();
		
		HttpSession session = request.getSession(true);
		
		String p = "1";
		session.setAttribute("pageN", p);
		
		session.setAttribute("allDepositSS", depositList);

		
		response.sendRedirect("depositHistory.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
