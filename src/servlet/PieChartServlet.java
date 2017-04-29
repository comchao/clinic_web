package servlet;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseDAO;
import dao.ReportDAO;
import model.AnalysisBean;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class ChartServlet
 */
@WebServlet("/ChartServlet")
public class PieChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PieChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*ตัวแปรที่รับเข้ามา*/
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
	                        /*	รับค่าจากฟอร์ม*/
		String chart_id = request.getParameter("chart_id");
		
		
		System.out.println(chart_id);
		
		String produc_month = request.getParameter("produc_month"); //จากวันที่ 
		System.out.println(produc_month);                         //จากวันที่ 
	
		
		String produc_year = request.getParameter("produc_year");    // ถึงวันที่ 
		System.out.println(produc_year);                          // ถึงวันที่ 
		String ON = request.getParameter("ON");                   //ลำดับ
		
		
	                          //คืนค่า
		request.setAttribute("chart_id", chart_id);
		request.setAttribute("produc_month", produc_month);
		request.setAttribute("produc_year",produc_year);
		request.setAttribute("ON",ON);
		
		
		
		
		if(chart_id.equals("1")){
			//คืนหน้าสถิติการขายสินค้า
			RequestDispatcher dispatcher = request.getRequestDispatcher("PiechartProduc.jsp");
			
		if(dispatcher != null){
			dispatcher.forward(request, response);
		}}
		
		
		if(chart_id.equals("2")){
			//คืนหน้า สถิติค่ายา
			RequestDispatcher dispatcher = request.getRequestDispatcher("treatmentCharPie.jsp");
			
		
		
		if(dispatcher != null){
			dispatcher.forward(request, response);
		}}
		
		if(chart_id.equals("3")){
			//คืนหน้า สถิติค่ารักษา
			RequestDispatcher dispatcher = request.getRequestDispatcher("OtherTreatmentCharPie.jsp");
			
		
		
		if(dispatcher != null){
			dispatcher.forward(request, response);
		}}
		
		
		
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

}}
