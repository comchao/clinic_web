package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DrugDAO;
import model.DrugBean;

/**
 * Servlet implementation class UpdateDrugServlet
 */
@WebServlet("/UpdateDrugServlet")
public class UpdateDrugServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDrugServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String page = "";
		DrugDAO drugDao = new DrugDAO();
		DrugBean drugBean = new DrugBean();		
				      
		drugBean.setDrug_name(request.getParameter("drug_name"));
		drugBean.setDrug_detail(request.getParameter("drug_detail"));
		drugBean.setDrug_price(Double.parseDouble(request.getParameter("drug_price")));
	    drugBean.setDrug_unit(request.getParameter("drug_unit"));
	    drugBean.setId(Integer.parseInt(request.getParameter("drug_id")));
	    page = drugDao.updateDrug(drugBean)? "drugView.jsp":"addDrug";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {		
			dispatcher.forward(request, response);
		}
	}

}
