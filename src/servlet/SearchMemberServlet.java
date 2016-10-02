package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MembersDAO;
import dao.OwnersDAO;
import model.MembersBean;
import model.OwnersBean;

/**
 * Servlet implementation class SearchMemberServlet
 */
@WebServlet("/SearchMemberServlet")
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMemberServlet() {
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
		
		MembersBean mb = new MembersBean();
		String mem_name = request.getParameter("mem_name");
		
		ArrayList<MembersBean> memList = MembersDAO.queryMembers(mem_name);
		HttpSession session = request.getSession(true);
		String p = "1";
		session.setAttribute("pageN", p);
		session.setAttribute("allMemSS", memList);
		response.sendRedirect("memberView.jsp");
		
	}

}
