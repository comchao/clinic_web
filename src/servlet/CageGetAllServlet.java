package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CageBean;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.CageTypeDAO;

/**
 * Servlet implementation class CageGetAllServlet
 */
@WebServlet("/CageGetAllServlet")
public class CageGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CageGetAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_type = Integer.parseInt(request.getParameter("id_type"));
		
    	response.setContentType("application/json");
    	response.setCharacterEncoding("utf-8");
    	
    	ArrayList<CageBean> list = new ArrayList<CageBean>();
    	list = CageTypeDAO.queryCageAllWhereID(id_type);
    	
    	JSONObject json = new JSONObject();
    	response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
    	response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		JSONArray arr = new JSONArray();
		
    	for(int i=0;i<list.size();i++){
    		
    		json = new JSONObject();
    		
    		json.put("cage_id", list.get(i).getId());
    		json.put("refer_cage_size", list.get(i).getRefer_cage_size());
    		json.put("cage_name", list.get(i).getCage_name());
    		json.put("cage_price", list.get(i).getCage_price());
    		json.put("cage_status", list.get(i).getCage_status());
    		arr.add(json);
    	}
        out.print(arr.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
