package dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.ConnectDB;

import model.DepositBean;
import model.DrugBean;
import model.OwnersBean;
import model.PetShopBean;
import model.ProductBean;
import model.ShopDetailBean;
import model.TreatmentDrugBean;

public class ProductDAO {

	static ConnectDB dbc = new ConnectDB();
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;

	
	public boolean insertProduct(ProductBean drug) {

		String sql = "insert into products" + "(product_code,product_name,product_detail,product_price,product_unit,refer_type_pet,product_img_name)"
				+ " values ( ? , ?, ?, ?, ?, ?, ?)";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			
			preparedStmt.setString(1, drug.getProduct_code());
			preparedStmt.setString(2, drug.getProduct_name());
			preparedStmt.setString(3, drug.getProduct_detail());
			preparedStmt.setDouble(4, drug.getProduct_price());
			preparedStmt.setString(5, drug.getProduct_unit());
			preparedStmt.setInt(6, drug.getRefer_type_pet());
			preparedStmt.setString(7, drug.getProduct_img_name());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
	}
	
	
	
	static public boolean inserPetShop(ShopDetailBean shopDetailBean,String[] prd_name, String[] prd_qty, String[] prd_price, String[] prd_total){		
		String sql_insert = "insert into `shop_detail`" 		
//				+ "(product_name,product_qty,product_price,product_total)"  
//		        + " values ( ?, ?, ?, ?); ";
				+ "(refer_petdeposit,prd_date,prd_name,prd_price,prd_qty,prd_total,produc_month,produc_year)"  
		        + " values ( ?, ?, ?, ?, ?, ?,?,?); ";
		try { 
		preparedStmt = null;
        PetShopBean petshopBean = new PetShopBean();
		for (int i = 0; i < prd_name.length; i++) {
			//set to bean
			
			shopDetailBean.setPrd_name(prd_name[i]);
			shopDetailBean.setPrd_qty(Integer.parseInt(prd_qty[i]));
			shopDetailBean.setPrd_price(Double.parseDouble(prd_price[i]));
			shopDetailBean.setPrd_total(Double.parseDouble(prd_total[i]));

			preparedStmt = dbc.createDBConnect().prepareStatement(sql_insert);
			
			preparedStmt.setInt (1, shopDetailBean.getId());
			preparedStmt.setString (2, shopDetailBean.getPrd_date());
			preparedStmt.setString (3, shopDetailBean.getPrd_name());
			preparedStmt.setDouble (4, shopDetailBean.getPrd_price());
			preparedStmt.setInt (5, shopDetailBean.getPrd_qty());
			preparedStmt.setDouble (6, shopDetailBean.getPrd_total());
			preparedStmt.setString (7, shopDetailBean.getProduc_month());
			preparedStmt.setString (8, shopDetailBean.getProduc_year());
			
			preparedStmt.executeUpdate();
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return false;				
	}
	
	
	
	
	static public boolean insertDeposit(DepositBean depositBean,ShopDetailBean shopDetailBean ){		
		String sql_insert = "insert into `shop_detail`" 		
				+ "(refer_petdeposit,prd_date,prd_name,prd_price,prd_qty,prd_total)"  
		        + " values ( ?, ?, ?, ?, ?, ?); ";
		
		
		try  {
            	
			preparedStmt = null;
                preparedStmt = dbc.createDBConnect().prepareStatement(sql_insert);
                preparedStmt.setInt (1, depositBean.getId());
                preparedStmt.setString(2, shopDetailBean.getPrd_date());
                preparedStmt.setString(3, shopDetailBean.getPrd_name());
                preparedStmt.setDouble(4, shopDetailBean.getPrd_price());
                preparedStmt.setInt (5, shopDetailBean.getPrd_qty());
                preparedStmt.setDouble(6, shopDetailBean.getPrd_total());
    			preparedStmt.executeUpdate();
			
			dbc.closeConnection();
			return true;	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
			}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}	
	}
	
	
	
	static public ArrayList<ProductBean> queryProdtuctAll() {

		ProductBean productBean = new ProductBean();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();

		String sql = "select * from products order by product_name; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				productBean = new ProductBean();

				productBean.setId(rs.getInt("id"));
				productBean.setProduct_code(rs.getString("product_code"));
				productBean.setProduct_name(rs.getString("product_name"));
				productBean.setProduct_detail(rs.getString("product_detail"));
				productBean.setProduct_price(rs.getDouble("product_price"));
				productBean.setProduct_unit(rs.getString("product_unit"));
				productBean.setProduct_img_name(rs.getString("product_img_name"));
				
				productList.add(productBean);
			}
			rs.close();
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	
	
	

	static public ArrayList<ShopDetailBean> queryShopDetail(int deposit_id) {

		ShopDetailBean prdShopBean = new ShopDetailBean();
		DepositBean depositBean = new DepositBean();
		ArrayList<ShopDetailBean> prdShopList = new ArrayList<ShopDetailBean>();

		String sql = "select * from shop_detail where refer_petdeposit = ?; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1, deposit_id);
			
			rs = preparedStmt.executeQuery();	
			// dbc.closeConnection();

			while (rs.next()) {
				prdShopBean = new ShopDetailBean();
				prdShopBean.setId(rs.getInt("id"));
				prdShopBean.setRefer_petdeposit(depositBean);
				prdShopBean.setPrd_date(rs.getString("prd_date"));
				prdShopBean.setPrd_name(rs.getString("prd_name"));
				prdShopBean.setPrd_price(rs.getDouble("prd_price"));
				prdShopBean.setPrd_qty(rs.getInt("prd_qty"));
				prdShopBean.setPrd_total(rs.getDouble("prd_total"));

				prdShopList.add(prdShopBean);
			}
			rs.close();
			return prdShopList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	
	///กราฟpie
	static public ArrayList<ShopDetailBean>ShopDetail(String produc_month  , String produc_year , String  ON ) {

		int limit = 0;
	
	 
		ShopDetailBean prdShopBean = new ShopDetailBean();
	
		ArrayList<ShopDetailBean> prdShopList = new ArrayList<ShopDetailBean>();

		String sql = "SELECT shop_detail.`prd_date` AS shop_detail_prd_date, shop_detail.`prd_name` AS shop_detail_prd_name,"
				+ " shop_detail.`prd_price` AS shop_detail_prd_price, SUM(`prd_qty`) AS shop_detail_prd_qty, "
				+ "SUM(`prd_total`) AS shop_detail_prd_total "
				+ "FROM  shop_detail "
				+ " WHERE  produc_month = ?  and produc_year = ?  GROUP BY `shop_detail_prd_name`  ORDER BY shop_detail_prd_qty  DESC , shop_detail_prd_total DESC  LIMIT  "+limit+ ","+ON+" ; ";
		try {
			
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			int i = 1;
			
			preparedStmt.setString(i++, produc_month);      System.out.println(produc_month);
			preparedStmt.setString(i++, produc_year);       System.out.println(produc_year);
			                                                System.out.println(ON);
			
			rs = preparedStmt.executeQuery();		
		

			while (rs.next()) {
				prdShopBean = new ShopDetailBean();
			
				prdShopBean.setLitres(rs.getString("shop_detail_prd_qty"));
				prdShopBean.setCountry(rs.getString("shop_detail_prd_name"));
				prdShopBean.setPrd_qty(rs.getInt("shop_detail_prd_qty"));
                
				prdShopList.add(prdShopBean);
			}
			rs.close();
			/*dbc.closeConnection();*/
			return prdShopList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	
	
	///กราฟแท่ง
	static public ArrayList<ShopDetailBean>ShopDetailchar(String produc_month  , String produc_year,String  ON) {

		ShopDetailBean prdShopBean = new ShopDetailBean();
		int limit = 0;
	
		ArrayList<ShopDetailBean> prdShopList = new ArrayList<ShopDetailBean>();

		String sql = "SELECT shop_detail.`prd_date` AS shop_detail_prd_date, shop_detail.`prd_name` AS shop_detail_prd_name,"
				+ " shop_detail.`prd_price` AS shop_detail_prd_price, SUM(`prd_qty`) AS shop_detail_prd_qty, "
				+ "SUM(`prd_total`) AS shop_detail_prd_total "
				+ "FROM  shop_detail "
				+ " WHERE  produc_month = ?  and produc_year = ?  GROUP BY `shop_detail_prd_name`  ORDER BY shop_detail_prd_qty  DESC , shop_detail_prd_total DESC   LIMIT  "+limit+ ","+ON+" ; ";
		try {
			
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			int i = 1;
			preparedStmt.setString(i++, produc_month);   System.out.println(produc_month);
			preparedStmt.setString(i++, produc_year);     System.out.println(produc_year);
			
			rs = preparedStmt.executeQuery();		
		

			while (rs.next()) {
				prdShopBean = new ShopDetailBean();
			
				prdShopBean.setVisits(rs.getString("shop_detail_prd_total"));  // ราคารวม 
				prdShopBean.setCountry(rs.getString("shop_detail_prd_name"));  // ชื่อ
				prdShopBean.setPrd_qty(rs.getInt("shop_detail_prd_qty"));     // หน่วย
                
				prdShopList.add(prdShopBean);
			}
			rs.close();
			/*dbc.closeConnection();*/
			return prdShopList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}

	
	
static public ArrayList<ProductBean> queryProductAllWhereTID(int type_id){
		
	ProductBean productBean = new ProductBean();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		
		String sql = "select * from products where refer_type_pet=? order by product_name ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1, type_id);
			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				productBean = new ProductBean();

				productBean.setId(rs.getInt("id"));
				productBean.setProduct_name(rs.getString("product_name"));
				productBean.setProduct_detail(rs.getString("product_detail"));
				productBean.setProduct_price(rs.getDouble("product_price"));
				productBean.setProduct_unit(rs.getString("product_unit"));
				productBean.setProduct_img_name(rs.getString("product_img_name"));
				productBean.setRefer_type_pet(rs.getInt("refer_type_pet"));
				
				productList.add(productBean);
			}
			rs.close();
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> "+e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
static public ArrayList<ProductBean> queryProductWhereTID(int type_id){
	
	ProductBean productBean = new ProductBean();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		
		String sql = "select * from products where id=? order by product_name ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1, type_id);
			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				productBean = new ProductBean();

				productBean.setId(rs.getInt("id"));
				productBean.setProduct_name(rs.getString("product_name"));
				productBean.setProduct_detail(rs.getString("product_detail"));
				productBean.setProduct_price(rs.getDouble("product_price"));
				productBean.setProduct_unit(rs.getString("product_unit"));
				productBean.setProduct_img_name(rs.getString("product_img_name"));
				productBean.setRefer_type_pet(rs.getInt("refer_type_pet"));
				
				productList.add(productBean);
			}
			rs.close();
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> "+e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	
	static public ArrayList<ProductBean> search(String product_key) {

		ProductBean productBean = new ProductBean();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();

		String sql = "select * from products where product_name LIKE ? OR product_code LIKE ? order by product_name ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, "%"+product_key+"%");
			preparedStmt.setString(2, "%"+product_key+"%");
			rs = preparedStmt.executeQuery();
			
			// dbc.closeConnection();

			while (rs.next()) {
				productBean = new ProductBean();

				productBean.setId(rs.getInt("id"));
				productBean.setProduct_code(rs.getString("product_code"));
				productBean.setProduct_name(rs.getString("product_name"));
				productBean.setProduct_detail(rs.getString("product_detail"));
				productBean.setProduct_price(rs.getDouble("product_price"));
				productBean.setProduct_unit(rs.getString("product_unit"));
				productBean.setProduct_img_name(rs.getString("product_img_name"));
				
				productList.add(productBean);
			}
			rs.close();
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	
	static public ArrayList<ProductBean> searchID(ProductBean pb) {

		ProductBean productBean = new ProductBean();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();

		String sql = "select * from products where refer_type_pet = ?; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1, pb.getRefer_type_pet());
			rs = preparedStmt.executeQuery();
			
			// dbc.closeConnection();

			while (rs.next()) {
				productBean = new ProductBean();

				productBean.setId(rs.getInt("id"));
				productBean.setProduct_name(rs.getString("product_name"));
				productBean.setProduct_detail(rs.getString("product_detail"));
				productBean.setProduct_price(rs.getDouble("product_price"));
				productBean.setProduct_unit(rs.getString("product_unit"));
				productBean.setProduct_img_name(rs.getString("product_img_name"));
				productBean.setRefer_type_pet(rs.getInt("refer_type_pet"));	
				
				productList.add(productBean);
			}
			rs.close();
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}

	
	
	public ArrayList<ProductBean> searchProduct(String productName) {

		ProductBean productBean = new ProductBean();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();

		String sql = "select * from products where product_name like ? or product_price like ?  order by id desc; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, productList + "%");
			preparedStmt.setString(2, productList + "%");

			rs = preparedStmt.executeQuery();

			while (rs.next()) {
				productBean = new ProductBean();

				productBean.setId(rs.getInt("id"));
				productBean.setProduct_name(rs.getString("drug_name"));
				productBean.setProduct_detail(rs.getString("drug_detail"));
				productBean.setProduct_price(rs.getDouble("drug_price"));
				productBean.setProduct_unit(rs.getString("drug_unit"));

				productList.add(productBean);
			}
			rs.close();
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	
	
	
	
	public boolean delProduct(ProductBean product) {

		String sql = " delete from products where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, product.getId());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
	}

	
	public boolean updateProduct(ProductBean product) {

		String sql = "update products set product_name = ?,product_detail = ?,product_price = ?,product_unit = ?,product_img_name = ?  where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, product.getProduct_name());
			preparedStmt.setString(2, product.getProduct_detail());
			preparedStmt.setDouble(3, product.getProduct_price());
			preparedStmt.setString(4, product.getProduct_unit());
			preparedStmt.setString(5, product.getProduct_img_name());
			preparedStmt.setInt(6, product.getId());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
	}
	
	static public ArrayList<ProductBean> queryProdtuctWHEREID(int id) {

		ProductBean productBean = new ProductBean();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();

		String sql = "select * from products where refer_type_pet = ? order by product_name; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1, id);
			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				productBean = new ProductBean();

				productBean.setId(rs.getInt("id"));
				productBean.setProduct_name(rs.getString("product_name"));
				productBean.setProduct_detail(rs.getString("product_detail"));
				productBean.setProduct_price(rs.getDouble("product_price"));
				productBean.setProduct_unit(rs.getString("product_unit"));
				productBean.setProduct_img_name(rs.getString("product_img_name"));
				
				productList.add(productBean);
			}
			rs.close();
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}

}
