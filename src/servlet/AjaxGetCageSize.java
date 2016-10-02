package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map.Entry;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.CageTypeDAO;
import model.CageTypeBean;

/**
 * Servlet implementation class AjaxGetPetType
 */
@WebServlet("/AjaxGetCageSize")
public class AjaxGetCageSize extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxGetCageSize() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	ArrayList<CageTypeBean> list = new ArrayList<CageTypeBean>();
    	list = CageTypeDAO.queryCageTypeAll();
    	
    	JSONObject json = new JSONObject();
    	response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
    	response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		JSONArray arr = new JSONArray();
		
    	for(int i=0;i<list.size();i++){
    		
    		json = new JSONObject();
    		
    		json.put("cagesize_id", list.get(i).getId());
    		json.put("cage_size", list.get(i).getCage_size());
    		 
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
