package net.calendar.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;

import net.calendar.db.CalBean;
import net.calendar.db.CalDAO;
import net.calendar.action.CalJson;

/**
 * Servlet implementation class CalServlet
 */
@WebServlet("/CalServlet")
public class CalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final JsonElement JSONROOT = null;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	try{                 
		String id_member =request.getParameter("id_member");	
		CalDAO dao = new CalDAO();
		ArrayList<CalBean> list = new ArrayList <CalBean>();   
		list = dao.selectId(Integer.parseInt(id_member));
		
		 for (int i=0; i<list.size(); i++){
		 	CalBean calbean = list.get(i); 

		     JSONArray ja = new JSONArray();	
		     System.out.println(calbean.getId());
		 	ja.add(new CalJson(calbean.getId(),calbean.getTitle(),calbean.getDate(),calbean.getUrl()));
		     System.out.println(ja);
		     
		     
		 
		request.setAttribute("show",list);
		String page = "fullcalendar.jsp"; 
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			if(dispatcher !=null){
				dispatcher.forward(request,response);
			}}}catch(Throwable theException)
			{System.out.println(theException);
		}
		}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
