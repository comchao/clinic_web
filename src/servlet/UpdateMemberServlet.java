package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.MembersDAO;
import model.MembersBean;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/UpdateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String page = "";
		MembersDAO memDao = new MembersDAO();
		MembersBean memBean = new MembersBean();		
				      
		memBean.setUsername(request.getParameter("username"));
		memBean.setPassword(request.getParameter("password"));
		memBean.setPrefix(request.getParameter("prefix"));
		memBean.setMemName(request.getParameter("mem_name"));
		memBean.setMemLname(request.getParameter("mem_lname"));
		memBean.setMemAdress(request.getParameter("mem_address"));
		memBean.setMemTelephone(request.getParameter("mem_tel"));
		memBean.setMemCertificate(request.getParameter("mem_certificate"));
		memBean.setMemBirthday(request.getParameter("mem_birthday"));
		memBean.setMemGender(request.getParameter("mem_gender"));
		memBean.setMemAge(request.getParameter("mem_age"));
		memBean.setMemPosition(request.getParameter("mem_position"));
		memBean.setMemImage(request.getParameter("mem_img"));
		memBean.setTypeCode(Integer.parseInt(request.getParameter("type_code")));
		memBean.setId(Integer.parseInt(request.getParameter("id")));
		
	    page = memDao.updateMember(memBean)? "memberView.jsp":"addMember.jsp";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {		
			dispatcher.forward(request, response);
		}
	}

}
