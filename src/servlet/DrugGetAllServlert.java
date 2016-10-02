package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.DrugDAO;
import model.DrugBean;

/**
 * Servlet implementation class DrugGetAllServlert
 */
@WebServlet("/DrugGetAllServlert")
public class DrugGetAllServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrugGetAllServlert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
    	int id_type = Integer.parseInt(request.getParameter("id_type"));
		
    	response.setContentType("application/json");
    	response.setCharacterEncoding("utf-8");
    	
    	ArrayList<DrugBean> list = new ArrayList<DrugBean>();
    	list = DrugDAO.queryDrugAllWhereTID(id_type);
    	
    	JSONObject json = new JSONObject();
    	response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
    	response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		JSONArray arr = new JSONArray();
		
    	for(int i=0;i<list.size();i++){
    		
    		json = new JSONObject();
    		
    		json.put("drug_id", list.get(i).getId());
    		json.put("drug_name", list.get(i).getDrug_name());
    		json.put("drug_detail", list.get(i).getDrug_detail());
    		json.put("drug_price", list.get(i).getDrug_price());
    		json.put("drug_unit", list.get(i).getDrug_unit());
    		 
    		arr.add(json);
    	}
        out.print(arr.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
