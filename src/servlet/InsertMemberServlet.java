package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MembersDAO;
import model.MembersBean;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/InsertMemberServlet")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
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
		
		String date = request.getParameter("mem_birthday"); // เธฃเธฑเธ�เธ�เน�เธฒ bday เธกเธฒเน€เธ�เน�เธ�เน�เธ� date
		String year = date.substring(6, 10); // เธ•เธฑเธ”เน€เธ�เธ�เธฒเธฐเธ�เธตเธญเธญเธ�เธกเธฒเธ�เธฒเธ� date

		String ynow = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()); //เธฃเธฑเธ�เธ�เน�เธฒเธ�เธตเธ�เธฑเธ�เธ�เธธเธ�เธฑเธ�
		int year_birth = Integer.parseInt(ynow); //เน�เธ�เธฅเธ�เธ�เธฒเธ� String เน€เธ�เน�เธ� int เน€เธ�เธทเน�เธญเธ�เธณเธ�เธงเธ“  
		int foo = Integer.parseInt(year); // เน�เธ�เธฅเธ�เธ�เธตเธ—เธตเน�เน€เธ�เธดเธ”
		int age = (year_birth - foo); // เธ�เธตเธ�เธฑเธ�เธ�เธธเธ�เธฑเธ� - เธ�เธตเธ—เธตเน�เน€เธ�เธดเธ” เน€เธ�เธทเน�เธญเธ�เธณเธ�เธงเธ“เธญเธฒเธขเธธ
		String age_now = Integer.toString(age);
				  
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
		memBean.setMemAge(age_now);
		memBean.setMemPosition(request.getParameter("mem_position"));
		memBean.setMemImage(request.getParameter("mem_img"));
		memBean.setTypeCode(Integer.parseInt(request.getParameter("type_code")));
		
		
	   
	    page = memDao.insertMember(memBean)? "SearchMemberServlet":"addMember.jsp";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {		
			dispatcher.forward(request, response);
		}
	}

}
