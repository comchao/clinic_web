package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.ProductDAO;

/**
 * Servlet implementation class ProductGetAllServlet
 */
@WebServlet("/ProductGetServlet")
public class ProductGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductGetServlet() {
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
    	
    	ArrayList<ProductBean> list = new ArrayList<ProductBean>();
    	list = ProductDAO.queryProductWhereTID(id_type);
    	
    	JSONObject json = new JSONObject();
    	response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
    	response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		JSONArray arr = new JSONArray();
		
    	for(int i=0;i<list.size();i++){
    		
    		json = new JSONObject();
    		
    		json.put("product_id", list.get(i).getId());
    		json.put("product_name", list.get(i).getProduct_name());
    		json.put("product_detail", list.get(i).getProduct_detail());
    		json.put("product_price", list.get(i).getProduct_price());
    		json.put("product_unit", list.get(i).getProduct_unit());
    		json.put("product_img_name", list.get(i).getProduct_img_name());
    		json.put("refer_type_pet", list.get(i).getRefer_type_pet());
    		 
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
