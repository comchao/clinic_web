package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import dao.TypeDrugDAO;
import model.TypeDrug;

/**
 * Servlet implementation class AjaxGetTypeServlet
 */
@WebServlet("/AjaxGetTypeServlet")
public class AjaxGetTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxGetTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	ArrayList<TypeDrug> list = new ArrayList<TypeDrug>();
    	list = TypeDrugDAO.queryTypeDrugAll();
    	
    	JSONObject json = new JSONObject();
    	response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
    	response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		JSONArray arr = new JSONArray();
		
    	for(int i=0;i<list.size();i++){
    		
    		json = new JSONObject();
    		
    		json.put("type_id", list.get(i).getId());
    		json.put("type_name", list.get(i).getTypeName());
    		 
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
