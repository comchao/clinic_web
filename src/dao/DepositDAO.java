package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.ConnectDB;
import model.CageBean;
import model.CageTypeBean;
import model.DepositBean;
import model.DrugBean;
import model.MembersBean;
import model.OtherTreatment;
import model.OwnersBean;
import model.PetsBean;
import model.ShopDetailBean;
import model.TreatmentBean;
import model.TreatmentDrugBean;

public class DepositDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	
	static public boolean insertDeposit(DepositBean depositBean,ShopDetailBean shopDetailBean ){		
		String sql_insert = "insert into `pet_deposit`" 		
				+ "(refer_pet_id,refer_owner_id,refer_cage_id,food_status,deposit_in,deposit_out,deposit_receive,deposit_day,deposit_status,deposit_date)"  
		        + " values ( ?, ?, ?, ? ,? , ? ,? , ? , ? ,?=now()); ";
		String sql_insert_product = "insert into `shop_detail`" 		
				+ "(refer_petdeposit,prd_date,prd_name,prd_price,prd_qty,prd_total,produc_month,produc_year,No_bil)"  
		        + " values ( ?, ?, ?, ?, ?, ?,?,?,?); ";
		
		try {     
			preparedStmt = dbc.createDBConnect().prepareStatement(sql_insert ,Statement.RETURN_GENERATED_KEYS);
			preparedStmt.setInt (1, depositBean.getRefer_pet_id().getId());
			preparedStmt.setInt (2, depositBean.getRefer_owner_id().getId());
			preparedStmt.setInt (3, depositBean.getRefer_cage_id().getId());
			preparedStmt.setString(4, depositBean.getFood_status());
			preparedStmt.setString(5, depositBean.getDeposit_in());
			preparedStmt.setString(6, depositBean.getDeposit_out());
			preparedStmt.setDouble(7, depositBean.getDeposit_receive());
			preparedStmt.setInt   (8, depositBean.getDeposit_day());
			preparedStmt.setInt   (9, depositBean.getDeposit_status());
			preparedStmt.setString   (10, depositBean.getDeposit_date());
			
			int affectedRows = preparedStmt.executeUpdate();
			if (affectedRows == 0) {
	            throw new SQLException("Creating user failed, no rows affected.");
	        }
			try (ResultSet generatedKeys = preparedStmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	            	//เซ็ตค่า id ของ pet_deposit get and set All Data Table: shop_detail
	            	preparedStmt = null;
	            	depositBean.setId(generatedKeys.getInt(1));
	                preparedStmt = dbc.createDBConnect().prepareStatement(sql_insert_product);
	                preparedStmt.setInt (1, depositBean.getId());
	                preparedStmt.setString(2, shopDetailBean.getPrd_date());
	                preparedStmt.setString(3, shopDetailBean.getPrd_name());
	                preparedStmt.setDouble(4, shopDetailBean.getPrd_price());
	                preparedStmt.setInt (5, shopDetailBean.getPrd_qty());
	                preparedStmt.setDouble(6, shopDetailBean.getPrd_total());
	                preparedStmt.setString (7, shopDetailBean.getProduc_month());
	    			preparedStmt.setString (8, shopDetailBean.getProduc_year());
	    			preparedStmt.setString (9, shopDetailBean.getNo_bil());
        			preparedStmt.executeUpdate();
	            }
			}
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
	
	static public ArrayList<ShopDetailBean> queryForPrint(int deposit_id){
		ArrayList<ShopDetailBean> prdShopList = new ArrayList<ShopDetailBean>();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT shop_detail.*")
		.append(" FROM `shop_detail`  ")
		.append(" WHERE shop_detail.refer_petdeposit = ? ");
		
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
			preparedStmt.setInt(1, deposit_id);
			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();
			ShopDetailBean prdShopBean = new ShopDetailBean();
			DepositBean depositBean = new DepositBean();
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
				
            	depositBean = new DepositBean();
            	prdShopBean = new ShopDetailBean();
			}
			rs.close();
			return prdShopList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	
	//ค้นหาข้อมูลเจ้าของสัตว์เลี้ยง
		static public ArrayList<DepositBean> search(String owner_key) {
			ArrayList<DepositBean> depositList = new ArrayList<DepositBean>();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT pet_deposit.*, petdata.*,ownerdata.*,cage.* ")
				.append(" FROM `pet_deposit`  ")
				.append(" INNER JOIN petdata ON petdata.id = pet_deposit.refer_pet_id ")
				.append(" INNER JOIN ownerdata ON ownerdata.id = pet_deposit.refer_owner_id ")
				.append(" INNER JOIN cage ON cage.id = pet_deposit.refer_cage_id ")
				.append(" WHERE deposit_status = 1 AND ownerdata.owners_name LIKE ? OR ownerdata.owners_idcard LIKE ? OR ownerdata.telephon LIKE ?  ORDER BY pet_deposit.deposit_date DESC;");
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
				preparedStmt.setString(1, "%"+owner_key+"%");
				preparedStmt.setString(2, "%"+owner_key+"%");
				preparedStmt.setString(3, "%"+owner_key+"%");
				rs = preparedStmt.executeQuery();
				// dbc.closeConnection();
				DepositBean depositBean = new DepositBean();
				OwnersBean ownersBean = new OwnersBean();
				PetsBean petBean = new PetsBean();
				CageBean cageBean = new CageBean();
				while (rs.next()) {
					depositBean = new DepositBean();
					depositBean.setId(rs.getInt("id"));
					depositBean.setRefer_pet_id(petBean);
					depositBean.setRefer_owner_id(ownersBean);
					depositBean.setRefer_cage_id(cageBean);
					depositBean.setFood_status(rs.getString("food_status"));
	            	depositBean.setDeposit_in(rs.getString("deposit_in"));
	            	depositBean.setDeposit_out(rs.getString("deposit_out"));
	            	depositBean.setDeposit_receive(rs.getDouble("deposit_receive"));
	            	depositBean.setDeposit_day(rs.getInt("deposit_day"));
	            	depositBean.setDeposit_status(rs.getInt("deposit_status"));
	            	depositList.add(depositBean);
	            	
	            	petBean.setPet_name(rs.getString("pet_name"));
	            	petBean.setPet_category(rs.getString("pet_category"));
	            	petBean.setPet_gene(rs.getString("pet_gene"));
	            	petBean.setPet_gender(rs.getString("pet_gender"));
	            	petBean.setPet_extra(rs.getString("pet_extra"));
	            	
	            	ownersBean.setOwners_idcard(rs.getString("owners_idcard"));
	            	ownersBean.setOwners_name(rs.getString("owners_name"));
	            	ownersBean.setOwners_lname(rs.getString("owners_lname"));
	            	ownersBean.setTelephon(rs.getString("telephon"));
	            	
	            	cageBean.setId(rs.getInt("cage.id"));
	            	cageBean.setCage_name(rs.getString("cage_name"));
	            	cageBean.setCage_price(rs.getDouble("cage_price"));
	            	cageBean.setRefer_cage_size(rs.getInt("refer_cage_size"));
	            	
	            	depositBean = new DepositBean();
	            	ownersBean = new OwnersBean();
	        		petBean = new PetsBean();
	        		cageBean = new CageBean();
	            	
				}
				rs.close();
				return depositList;
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
		
		static public ArrayList<DepositBean> searchByPet(String owner_key) {
			ArrayList<DepositBean> depositList = new ArrayList<DepositBean>();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT pet_deposit.*, petdata.*,ownerdata.*,cage.* ")
				.append(" FROM `pet_deposit`  ")
				.append(" INNER JOIN petdata ON petdata.id = pet_deposit.refer_pet_id ")
				.append(" INNER JOIN ownerdata ON ownerdata.id = pet_deposit.refer_owner_id ")
				.append(" INNER JOIN cage ON cage.id = pet_deposit.refer_cage_id ")
				.append(" WHERE deposit_status = 1 AND petdata.pet_name LIKE ? ORDER BY pet_deposit.deposit_date DESC;");
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
				preparedStmt.setString(1, "%"+owner_key+"%");
				rs = preparedStmt.executeQuery();
				// dbc.closeConnection();
				DepositBean depositBean = new DepositBean();
				OwnersBean ownersBean = new OwnersBean();
				PetsBean petBean = new PetsBean();
				CageBean cageBean = new CageBean();
				while (rs.next()) {
					depositBean = new DepositBean();
					depositBean.setId(rs.getInt("id"));
					depositBean.setRefer_pet_id(petBean);
					depositBean.setRefer_owner_id(ownersBean);
					depositBean.setRefer_cage_id(cageBean);
					depositBean.setFood_status(rs.getString("food_status"));
	            	depositBean.setDeposit_in(rs.getString("deposit_in"));
	            	depositBean.setDeposit_out(rs.getString("deposit_out"));
	            	depositBean.setDeposit_receive(rs.getDouble("deposit_receive"));
	            	depositBean.setDeposit_day(rs.getInt("deposit_day"));
	            	depositBean.setDeposit_status(rs.getInt("deposit_status"));
	            	depositList.add(depositBean);
	            	
	            	petBean.setPet_name(rs.getString("pet_name"));
	            	petBean.setPet_category(rs.getString("pet_category"));
	            	petBean.setPet_gene(rs.getString("pet_gene"));
	            	petBean.setPet_gender(rs.getString("pet_gender"));
	            	petBean.setPet_extra(rs.getString("pet_extra"));
	            	
	            	ownersBean.setOwners_idcard(rs.getString("owners_idcard"));
	            	ownersBean.setOwners_name(rs.getString("owners_name"));
	            	ownersBean.setOwners_lname(rs.getString("owners_lname"));
	            	ownersBean.setTelephon(rs.getString("telephon"));
	            	
	            	cageBean.setId(rs.getInt("cage.id"));
	            	cageBean.setCage_name(rs.getString("cage_name"));
	            	cageBean.setCage_price(rs.getDouble("cage_price"));
	            	cageBean.setRefer_cage_size(rs.getInt("refer_cage_size"));
	            	
	            	depositBean = new DepositBean();
	            	ownersBean = new OwnersBean();
	        		petBean = new PetsBean();
	        		cageBean = new CageBean();
	            	
				}
				rs.close();
				return depositList;
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
	
static public ArrayList<DepositBean> queryDepositAll() {
		ArrayList<DepositBean> depositList = new ArrayList<DepositBean>();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT pet_deposit.*, petdata.*,ownerdata.*,cage.* ")
			.append(" FROM `pet_deposit`  ")
			.append(" INNER JOIN petdata ON petdata.id = pet_deposit.refer_pet_id ")
			.append(" INNER JOIN ownerdata ON ownerdata.id = pet_deposit.refer_owner_id ")
			.append(" INNER JOIN cage ON cage.id = pet_deposit.refer_cage_id ")
			.append(" WHERE deposit_status = 1 ORDER BY pet_deposit.deposit_date DESC;");
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();
			DepositBean depositBean = new DepositBean();
			OwnersBean ownersBean = new OwnersBean();
			PetsBean petBean = new PetsBean();
			CageBean cageBean = new CageBean();
			while (rs.next()) {
				depositBean = new DepositBean();
				depositBean.setId(rs.getInt("id"));
				depositBean.setRefer_pet_id(petBean);
				depositBean.setRefer_owner_id(ownersBean);
				depositBean.setRefer_cage_id(cageBean);
				depositBean.setFood_status(rs.getString("food_status"));
            	depositBean.setDeposit_in(rs.getString("deposit_in"));
            	depositBean.setDeposit_out(rs.getString("deposit_out"));
            	depositBean.setDeposit_receive(rs.getDouble("deposit_receive"));
            	depositBean.setDeposit_day(rs.getInt("deposit_day"));
            	depositBean.setDeposit_status(rs.getInt("deposit_status"));
            	depositList.add(depositBean);
            	
            	petBean.setPet_name(rs.getString("pet_name"));
            	petBean.setPet_category(rs.getString("pet_category"));
            	petBean.setPet_gene(rs.getString("pet_gene"));
            	petBean.setPet_gender(rs.getString("pet_gender"));
            	petBean.setPet_extra(rs.getString("pet_extra"));
            	
            	ownersBean.setOwners_idcard(rs.getString("owners_idcard"));
            	ownersBean.setOwners_name(rs.getString("owners_name"));
            	ownersBean.setOwners_lname(rs.getString("owners_lname"));
            	ownersBean.setTelephon(rs.getString("telephon"));
            	
            	cageBean.setId(rs.getInt("cage.id"));
            	cageBean.setCage_name(rs.getString("cage_name"));
            	cageBean.setCage_price(rs.getDouble("cage_price"));
            	cageBean.setRefer_cage_size(rs.getInt("refer_cage_size"));
            	
            	depositBean = new DepositBean();
            	ownersBean = new OwnersBean();
        		petBean = new PetsBean();
        		cageBean = new CageBean();
            	
			}
			rs.close();
			return depositList;
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
static public ArrayList<DepositBean> queryDepositId(int deposit_id) {
	ArrayList<DepositBean> depositList = new ArrayList<DepositBean>();
	StringBuilder sql = new StringBuilder();
	sql.append(" SELECT pet_deposit.*, petdata.*,ownerdata.*,cage.* ")
		.append(" FROM `pet_deposit`  ")
		.append(" INNER JOIN petdata ON petdata.id = pet_deposit.refer_pet_id ")
		.append(" INNER JOIN ownerdata ON ownerdata.id = pet_deposit.refer_owner_id ")
		.append(" INNER JOIN cage ON cage.id = pet_deposit.refer_cage_id ")
		.append(" WHERE pet_deposit.id = ?;");
	try {
		preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
		preparedStmt.setInt(1, deposit_id);
		rs = preparedStmt.executeQuery();
		// dbc.closeConnection();
		DepositBean depositBean = new DepositBean();
		OwnersBean ownersBean = new OwnersBean();
		PetsBean petBean = new PetsBean();
		CageBean cageBean = new CageBean();
		while (rs.next()) {
			depositBean = new DepositBean();
			depositBean.setId(rs.getInt("id"));
			depositBean.setRefer_pet_id(petBean);
			depositBean.setRefer_owner_id(ownersBean);
			depositBean.setRefer_cage_id(cageBean);
			depositBean.setFood_status(rs.getString("food_status"));
        	depositBean.setDeposit_in(rs.getString("deposit_in"));
        	depositBean.setDeposit_out(rs.getString("deposit_out"));
        	depositBean.setDeposit_receive(rs.getDouble("deposit_receive"));
        	depositBean.setDeposit_day(rs.getInt("deposit_day"));
        	depositBean.setDeposit_status(rs.getInt("deposit_status"));
        	depositList.add(depositBean);
        	
        	petBean.setPet_name(rs.getString("pet_name"));
        	petBean.setPet_category(rs.getString("pet_category"));
        	petBean.setPet_gene(rs.getString("pet_gene"));
        	petBean.setPet_gender(rs.getString("pet_gender"));
        	petBean.setPet_extra(rs.getString("pet_extra"));
        	
        	ownersBean.setOwners_name(rs.getString("owners_name"));
        	ownersBean.setOwners_lname(rs.getString("owners_lname"));
        	
        	cageBean.setCage_name(rs.getString("cage_name"));
        	cageBean.setCage_price(rs.getDouble("cage_price"));
        	cageBean.setRefer_cage_size(rs.getInt("refer_cage_size"));
        	
        	depositBean = new DepositBean();
        	ownersBean = new OwnersBean();
    		petBean = new PetsBean();
    		cageBean = new CageBean();
        	
		}
		rs.close();
		return depositList;
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

static public ArrayList<DepositBean> queryDepositID(){
	
	DepositBean depositBean = new DepositBean();
	ArrayList<DepositBean> depositList = new ArrayList<DepositBean>();
	
	String sql = "select * from pet_deposit where id = ?; ";
	try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			
			rs = preparedStmt.executeQuery();			
			//dbc.closeConnection();
			depositBean = new DepositBean();
			OwnersBean ownersBean = new OwnersBean();
			PetsBean petBean = new PetsBean();
			CageBean cageBean = new CageBean();
            while (rs.next()) {
            	depositBean.setId(rs.getInt("id"));
				depositBean.setRefer_pet_id(petBean);
				depositBean.setRefer_owner_id(ownersBean);
				depositBean.setRefer_cage_id(cageBean);
				depositBean.setFood_status(rs.getString("food_status"));
            	depositBean.setDeposit_in(rs.getString("deposit_in"));
            	depositBean.setDeposit_out(rs.getString("deposit_out"));
            	depositBean.setDeposit_receive(rs.getDouble("deposit_receive"));
            	depositBean.setDeposit_day(rs.getInt("deposit_day"));
            	depositBean.setDeposit_status(rs.getInt("deposit_status"));
            	depositList.add(depositBean);
            }
            rs.close();	
        return depositList;
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

static public boolean updateStatusPayment(DepositBean deposit){		
	String sql = "update pet_deposit set deposit_status = 0 where id = ? limit 1; ";
	try {     
		
		preparedStmt = dbc.createDBConnect().prepareStatement(sql);
		preparedStmt.setInt(1,deposit.getId());
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
