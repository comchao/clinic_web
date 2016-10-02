package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PetsDAO;
import model.PetsBean;

/**
 * Servlet implementation class UpdatePetServlet
 */
@WebServlet("/UpdatePetServlet")
public class UpdatePetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String page = "";
		PetsDAO petDao = new PetsDAO();
		PetsBean petBean = new PetsBean();		
				      
		petBean.setPet_name(request.getParameter("pet_name"));
		petBean.setPet_category(request.getParameter("pet_category"));
		petBean.setPet_gene(request.getParameter("pet_gene"));
		petBean.setPet_gender(request.getParameter("pet_gender"));
		petBean.setPet_weight(request.getParameter("pet_weight"));
		petBean.setPet_birthday(request.getParameter("pet_birthday"));
		petBean.setPet_age(request.getParameter("pet_age"));
		petBean.setPet_extra(request.getParameter("pet_extra"));
		petBean.setId(Integer.parseInt(request.getParameter("edit_id")));
	   
	    page = petDao.updatePet(petBean)? "editConfrim.jsp":"";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {		
			dispatcher.forward(request, response);
		}
	}

}
