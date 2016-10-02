package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProductDAO;
import model.ProductBean;

/**
 * Servlet implementation class InsertProductServlet
 */
@WebServlet("/InsertProductServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductServlet() {
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
		ProductDAO productDao = new ProductDAO();
		ProductBean productBean = new ProductBean();		
		productBean.setProduct_code(request.getParameter("product_code"));
		productBean.setProduct_name(request.getParameter("product_name"));
		productBean.setProduct_detail(request.getParameter("product_detail"));
		productBean.setProduct_price(Double.parseDouble(request.getParameter("product_price")));
		productBean.setProduct_unit(request.getParameter("product_unit"));
		productBean.setRefer_type_pet(Integer.parseInt(request.getParameter("refer_type_pet")));
		//upload img
		
		String savePath = "D:\\JavaProject\\clinic_web\\WebContent\\images";
        File fileSaveDir=new File(savePath);
        if(!fileSaveDir.exists()){
            fileSaveDir.mkdir();
        }
        Part part=request.getPart("pic_product");
        String fileName = extractFileName(part);
        int pos = fileName.lastIndexOf('.');
        String typeImg = fileName.substring(pos, fileName.length()).toLowerCase();
        long newFileImg = System.currentTimeMillis();
        part.write(savePath + File.separator + newFileImg + typeImg);
		
        productBean.setProduct_img_name(newFileImg + typeImg);
		//end upload
		
	    page = productDao.insertProduct(productBean)? "showProductServlet":"errorConfrim.jsp";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {		
			dispatcher.forward(request, response);
		}
	}
	
	private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
            	return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }

}
