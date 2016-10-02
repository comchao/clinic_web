package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.ConnectDB;
import model.OwnersBean;
import model.PetsBean;
import dao.PetsDAO;

/**
 * Servlet implementation class InsertPetServlet
 */
@WebServlet("/InsertPetServlet")
public class InsertPetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Connection con;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPetServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String page = "";
		PetsDAO petDao = new PetsDAO();
		PetsBean petBean = new PetsBean();		
		OwnersBean ownersBean = new OwnersBean();
    	ownersBean.setId(Integer.parseInt(request.getParameter("owner_id")));	      
	    petBean.setReference_owner_id(ownersBean);
	    petBean.setPet_name(request.getParameter("pet_name"));
	    petBean.setPet_category(request.getParameter("pet_category"));
	    petBean.setPet_gene(request.getParameter("pet_gene"));
	    petBean.setPet_gender(request.getParameter("pet_gender"));
	    petBean.setPet_weight(request.getParameter("pet_weight"));
	    petBean.setPet_birthday(request.getParameter("pet_birthday"));
	    petBean.setPet_age(request.getParameter("pet_age"));
	    petBean.setPet_extra(request.getParameter("pet_extra"));
	    
	    
	    
	    page = petDao.insertPet(petBean)? "insertPetConfrim.jsp":"errorConfrim.jsp";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {		
			dispatcher.forward(request, response);
		}
			
	}

}
