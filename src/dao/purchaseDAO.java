package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.AnalysisBean;
import model.SymptomsBean;
import model.purchaseBean;
public class purchaseDAO {
	static ConnectDB dbc = new ConnectDB();
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	Connection con = null;

	PreparedStatement pstm = null;
	static Connection dbconConnection = null;
	static PreparedStatement pre = null;

	static PreparedStatement pstmtt = null;

// จับสินค้าใส่ตะกร้า
	public static boolean purchase(purchaseBean bean) {
		String insertSQL = "insert into purchase(Product_name,Product_price,number)" + " values(?,?,?); ";
		System.out.println(insertSQL);
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);

			preparedStmt.setString(1, bean.getProduct_name());
			preparedStmt.setDouble(2, bean.getProduct_price());
			preparedStmt.setInt(3, bean.getNumber());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
	}
	
	//รายการขายสินค้า
	static public ArrayList<purchaseBean> getpurchaseBean() {

		purchaseBean purchase = new purchaseBean();
		ArrayList<purchaseBean> List = new ArrayList<purchaseBean>();

		String sql = "select `id`,`Product_name`,`Product_price` ,SUM(`number`) totalnumber , SUM(Product_price*number) AS totalprice from purchase GROUP BY Product_name  ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				purchase = new purchaseBean();


				purchase.setId(rs.getInt("id"));
				purchase.setProduct_name(rs.getString("Product_name"));
				purchase.setProduct_price(rs.getDouble("Product_price"));
				
				purchase.setTotalnumber(rs.getInt("totalnumber"));
				purchase.setTotalprice(rs.getInt("totalprice"));
				
				List.add(purchase);
			}
			rs.close();
			return List;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}
	//ราคารวมชำระ
	static public ArrayList<purchaseBean> getTotal() {

		purchaseBean purchase = new purchaseBean();
		ArrayList<purchaseBean> List = new ArrayList<purchaseBean>();

		String sql = "select SUM(`Product_price`*`number`)  AS total FROM purchase  ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				purchase = new purchaseBean();

				
	
				purchase.setTotal(rs.getInt("total"));
				
				
				List.add(purchase);
			}
			rs.close();
			return List;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}
	
	//ลบสินค้าในตะกร้า
	public boolean deletepurchase (purchaseBean Product_name) {

		String sql = " delete from purchase where Product_name = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, Product_name.getProduct_name());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
	}
	
	//ลบข้อมูลสินค้าทั้งหมด
	public boolean deleteall (purchaseBean Product_name) {

		String sql = " delete from purchase where id= ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, Product_name.getId());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
	}
	// select id ลบสินค้าทั้งหมด
	
		static public ArrayList<purchaseBean> getpurchaseID() {

			purchaseBean purchase = new purchaseBean();
			ArrayList<purchaseBean> List = new ArrayList<purchaseBean>();

			String sql = "select * FROM purchase  ; ";
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);

				rs = preparedStmt.executeQuery();
				// dbc.closeConnection();

				while (rs.next()) {
					purchase = new purchaseBean();

					
		
					purchase.setId(rs.getInt("id"));
					
					
					List.add(purchase);
				}
				rs.close();
				return List;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("error ===> " + e);
			} finally {
				try {
					dbc.closeConnection();
					preparedStmt.close();
				} catch (Exception e) {
					System.out.println("finally x=> " + e.getMessage());
				}
			}
			return null;
		}
	
	

}
