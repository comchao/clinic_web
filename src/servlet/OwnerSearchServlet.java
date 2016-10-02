package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OwnersDAO;
import model.OwnersBean;

/**
 * Servlet implementation class OwnerSearchServlet
 */
@WebServlet("/OwnerSearchServlet")
public class OwnerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerSearchServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("");

		String searchType = request.getParameter("searchType");
		String owner_name = request.getParameter("owner_name");
		String owner_history = request.getParameter("owner_history");
		String owner_deposit = request.getParameter("owner_deposit");
		String sql = "", page = "";
		ArrayList<OwnersBean> petsList = null;
		OwnersDAO ownerDAO = new OwnersDAO();

		
//			if(request.getParameter("ss") == null){
//
//				
//				if((owner_name == null) && (owner_deposit != null)){
//					petsList = ownerDAO.queryOwners(owner_deposit);
//					page = "depositPet.jsp";
//					
//				}else if((owner_deposit == null) && (owner_name != null)){
//					petsList = ownerDAO.queryOwners(owner_name);
//					page = "owner_view.jsp";
//				}
//			}else{
//				
//				petsList = ownerDAO.queryOwners(owner_history);
//				page = "owner_view_history.jsp";
//				
//			}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) { 
			request.setAttribute("ownerList", petsList);
			dispatcher.forward(request, response);
		}
	}

}
