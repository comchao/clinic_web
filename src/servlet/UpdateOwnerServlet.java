package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OwnersDAO;
import model.OwnersBean;

/**
 * Servlet implementation class UpdateOwnerServlet
 */
@WebServlet("/UpdateOwnerServlet")
public class UpdateOwnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOwnerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("owners_name");
		String page = "";
		OwnersDAO ownerDao = new OwnersDAO();
		OwnersBean ownerBean = new OwnersBean();		
				      
	    ownerBean.setOwners_idcard(request.getParameter("owners_idcard"));
	    ownerBean.setPrefix(request.getParameter("prefix"));
	    ownerBean.setOwners_name(request.getParameter("owners_name"));
	    ownerBean.setOwners_lname(request.getParameter("owners_lname"));
	    ownerBean.setOwners_gender(request.getParameter("owners_gender"));
	    ownerBean.setAddress(request.getParameter("address"));
	    ownerBean.setTelephon(request.getParameter("telephon"));
	    ownerBean.setOwners_birthday(request.getParameter("owners_birthday"));
	    ownerBean.setId(Integer.parseInt(request.getParameter("owner_id")));
	    System.out.println(request.getParameter("owner_id"));
	    page = ownerDao.updateOwner(ownerBean)? "editOwner.jsp":"errorConfrim.jsp";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {		
			dispatcher.forward(request, response);
		}
	}

}
