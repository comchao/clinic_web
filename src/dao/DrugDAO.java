package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.DrugBean;


public class DrugDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	
	
	public boolean insertDrug(DrugBean drug) {

		String sql = "insert into drug"
				+ "(drug_type,drug_code,drug_name,drug_detail,drug_price,drug_unit)"
				+ " values ( ?,?,?,?,?,?)";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, drug.getDrug_type());
			preparedStmt.setString(2, drug.getDrug_code());
			preparedStmt.setString(3, drug.getDrug_name());
			preparedStmt.setString(4, drug.getDrug_detail());
			preparedStmt.setDouble(5, drug.getDrug_price());
			preparedStmt.setString(6, drug.getDrug_unit());
			
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
	
	
	static public ArrayList<DrugBean> queryDrugAll(){
		
		DrugBean drugBean = new DrugBean();
		ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();
		
		String sql = "select * from drug order by drug_name; ";
		try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				
				rs = preparedStmt.executeQuery();			
				//dbc.closeConnection();
				
	            while (rs.next()) {
	            	drugBean = new DrugBean();
	            	
	            	drugBean.setId(rs.getInt("id"));
	            	drugBean.setDrug_type(rs.getString("drug_type"));
	            	drugBean.setDrug_name(rs.getString("drug_name"));
	            	drugBean.setDrug_detail(rs.getString("drug_detail"));
	            	drugBean.setDrug_price(rs.getDouble("drug_price"));
	            	drugBean.setDrug_unit(rs.getString("drug_unit"));
	            	
	            	
	            	drugList.add(drugBean);
	            }
	            rs.close();	
            return drugList;
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
	
	
	static public ArrayList<DrugBean> queryDrugAllWhereTID(int type_id){
		
		DrugBean drugBean = new DrugBean();
		ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();
		
		String sql = "select * from drug where drug_type=? order by drug_name ; ";
		try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				preparedStmt.setInt(1, type_id);
				
				rs = preparedStmt.executeQuery();		
				
				//dbc.closeConnection();
				
	            while (rs.next()) {
	            	drugBean = new DrugBean();
	            	
	            	drugBean.setId(rs.getInt("id"));
	            	drugBean.setDrug_type(rs.getString("drug_type"));
	            	drugBean.setDrug_name(rs.getString("drug_name"));
	            	drugBean.setDrug_detail(rs.getString("drug_detail"));
	            	drugBean.setDrug_price(rs.getDouble("drug_price"));
	            	drugBean.setDrug_unit(rs.getString("drug_unit"));
	            	
	            	
	            	drugList.add(drugBean);
	            }
	            rs.close();	
            return drugList;
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
	

		public ArrayList<DrugBean> searchDrug(String drugName) {

			DrugBean drugBean = new DrugBean();
			ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();

			String sql = "select * from drug where drug_name like ? or drug_type like ?  order by id desc; ";
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				preparedStmt.setString(1, drugList + "%");
				preparedStmt.setString(2, drugList + "%");
				

				rs = preparedStmt.executeQuery();
				

				while (rs.next()) {
					drugBean = new DrugBean();

					drugBean.setId(rs.getInt("id"));
					drugBean.setDrug_type(rs.getString("drug_type"));
					drugBean.setDrug_name(rs.getString("drug_name"));
					drugBean.setDrug_detail(rs.getString("drug_detail"));
					drugBean.setDrug_price(rs.getDouble("drug_price"));
					drugBean.setDrug_unit(rs.getString("drug_unit"));

					drugList.add(drugBean);
				}
				rs.close();
				return drugList;
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
	
		static public ArrayList<DrugBean> search(String drug_key) {

			DrugBean drugBean = new DrugBean();
			ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();

			String sql = "select * from drug where drug_name LIKE ? OR drug_code LIKE ? order by drug_name; ";
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				preparedStmt.setString(1, "%"+drug_key+"%");
				preparedStmt.setString(2, "%"+drug_key+"%");
				rs = preparedStmt.executeQuery();
				
				// dbc.closeConnection();

				while (rs.next()) {
					drugBean = new DrugBean();

					drugBean.setId(rs.getInt("id"));
					drugBean.setDrug_type(rs.getString("drug_type"));
					drugBean.setDrug_code(rs.getString("drug_code"));
					drugBean.setDrug_name(rs.getString("drug_name"));
					drugBean.setDrug_detail(rs.getString("drug_detail"));
					drugBean.setDrug_price(rs.getDouble("drug_price"));
					drugBean.setDrug_unit(rs.getString("drug_unit"));
					
					
					drugList.add(drugBean);
				}
				rs.close();
				return drugList;
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
		
	//à¹€à¸˜à¸…à¹€à¸˜ï¿½à¹€à¸˜ï¿½à¹€à¸™ï¿½à¹€à¸˜à¸�à¹€à¸˜à¸�à¹€à¸˜à¸™à¹€à¸˜à¸…à¹€à¸˜à¸‚à¹€à¸˜à¸’
	
	public boolean delDrug(DrugBean drug) {

		String sql = " delete from drug where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, drug.getId());

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
	
	//à¹€à¸™ï¿½à¹€à¸˜ï¿½à¹€à¸™ï¿½à¹€à¸™ï¿½à¹€à¸˜ï¿½ à¹€à¸˜à¸ƒà¹€à¸˜à¸’à¹€à¸˜à¸‚à¹€à¸˜à¸…à¹€à¸˜à¸�à¹€à¸™â‚¬à¹€à¸˜à¸�à¹€à¸˜à¸•à¹€à¸˜à¸‚à¹€à¸˜â€�à¹€à¸˜à¸‚à¹€à¸˜à¸’
	
	public boolean updateDrug(DrugBean drug) {

		String sql = "update drug set drug_name = ?,drug_detail = ?,drug_price = ?,drug_unit = ? where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, drug.getDrug_name());
			preparedStmt.setString(2, drug.getDrug_detail());
			preparedStmt.setDouble(3, drug.getDrug_price());
			preparedStmt.setString(4, drug.getDrug_unit());
			preparedStmt.setInt(5, drug.getId());

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
}
