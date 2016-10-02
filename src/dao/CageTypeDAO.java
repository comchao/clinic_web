package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CageTypeBean;
import model.CageBean;
import model.DepositBean;
import model.DrugBean;
import db.ConnectDB;

public class CageTypeDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	//ค้นหาข้อมูลยาทั้งหมด
		static public ArrayList<CageTypeBean> queryCageTypeAll(){
			
			CageTypeBean bean = new CageTypeBean();
			ArrayList<CageTypeBean> list = new ArrayList<CageTypeBean>();
			
			String sql = "select * from cage_size order by id; ";
			try {
					preparedStmt = dbc.createDBConnect().prepareStatement(sql);
					
					rs = preparedStmt.executeQuery();			
					//dbc.closeConnection();
					
		            while (rs.next()) {
		            	bean = new CageTypeBean();
		            	
		            	bean.setId(rs.getInt("id"));
		            	bean.setCage_size(rs.getString("cage_size"));
		            	list.add(bean);
		            }
		            rs.close();	
	            return list;
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
static public ArrayList<CageTypeBean> queryCageName(int id_type){
			
			CageTypeBean bean = new CageTypeBean();
			ArrayList<CageTypeBean> list = new ArrayList<CageTypeBean>();
			
			String sql = "select * from cage_size where id = ?; ";
			try {
					preparedStmt = dbc.createDBConnect().prepareStatement(sql);
					
					rs = preparedStmt.executeQuery();			
					//dbc.closeConnection();
					
		            while (rs.next()) {
		            	bean = new CageTypeBean();
		            	
		            	bean.setId(rs.getInt("cagesize_id"));
		            	bean.setCage_size(rs.getString("cage_size"));
		            	list.add(bean);
		            }
		            rs.close();	
	            return list;
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
		
		static public ArrayList<CageBean> queryCageAllWhereID(int type_id){
			
			CageBean cageBean = new CageBean();
				ArrayList<CageBean> cageList = new ArrayList<CageBean>();
				
				String sql = "select * from cage where refer_cage_size = ? AND cage_status = 0; ";
				try {
					preparedStmt = dbc.createDBConnect().prepareStatement(sql);
					preparedStmt.setInt(1, type_id);
					rs = preparedStmt.executeQuery();
					// dbc.closeConnection();

					while (rs.next()) {
						cageBean = new CageBean();

						cageBean.setId(rs.getInt("id"));
						cageBean.setRefer_cage_size(rs.getInt("refer_cage_size"));
						cageBean.setCage_name(rs.getString("cage_name"));
						cageBean.setCage_price(rs.getDouble("cage_price"));
						cageBean.setCage_status(rs.getInt("cage_status"));
						cageList.add(cageBean);
					}
					rs.close();
					return cageList;
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
			static public ArrayList<CageBean> queryCagePriceWhereID(int type_id){
			
			CageBean cageBean = new CageBean();
				ArrayList<CageBean> cageList = new ArrayList<CageBean>();
				
				String sql = "select * from cage where id = ? AND cage_status = 0; ";
				try {
					preparedStmt = dbc.createDBConnect().prepareStatement(sql);
					preparedStmt.setInt(1, type_id);
					rs = preparedStmt.executeQuery();
					// dbc.closeConnection();

					while (rs.next()) {
						cageBean = new CageBean();

						cageBean.setId(rs.getInt("id"));
						cageBean.setRefer_cage_size(rs.getInt("refer_cage_size"));
						cageBean.setCage_name(rs.getString("cage_name"));
						cageBean.setCage_price(rs.getDouble("cage_price"));
						cageBean.setCage_status(rs.getInt("cage_status"));
						cageList.add(cageBean);
					}
					rs.close();
					return cageList;
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
		
//เปลี่ยนสถานะกรง
static public boolean updateStatusPayment(CageBean cage){		
				String sql = "update cage set cage_status = 0 where id = ? limit 1; ";
				try {     
					
					preparedStmt = dbc.createDBConnect().prepareStatement(sql);
					preparedStmt.setInt(1,cage.getId());
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
		
		public static boolean updateCage(CageBean cage) {

			String sql = "update cage set cage_status = ? where id = ?; ";
			try {

				preparedStmt = dbc.createDBConnect().prepareStatement(sql);

				preparedStmt.setInt(1, cage.getCage_status());
				preparedStmt.setInt(2, cage.getId());

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
