package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import db.ConnectDB;
import model.OwnersBean;
import model.PetsBean;
import model.TypePetBean;
import model.DepositBean;

public class PetsDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	
	//เพิ่มข้อมูลสัตวเลี้ยง
	public boolean insertPet(PetsBean pet){		
		
		String sql = "insert into petdata" 		
				+ "(reference_owner_id,pet_name,pet_category,pet_gene,pet_gender,pet_weight,pet_birthday,pet_age,pet_extra,active_flag)"  
		        + " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?,'N'); ";
		try {     
			
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			
			preparedStmt.setInt (1, pet.getReference_owner_id().getId());
			preparedStmt.setString (2, pet.getPet_name());
			preparedStmt.setString (3, pet.getPet_category());
			preparedStmt.setString (4, pet.getPet_gene());
			preparedStmt.setString (5, pet.getPet_gender());
			preparedStmt.setString (6, pet.getPet_weight());			
			preparedStmt.setString (7, pet.getPet_birthday());
			preparedStmt.setString (8, pet.getPet_age());
			preparedStmt.setString (9, pet.getPet_extra());
			
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
	
	//เพิ่มข้อมูลการฝากเลี้ยง

	
	//ค้นหาข้อมูลสัตว์เลี้ยง
		static public ArrayList<PetsBean> search(PetsBean pb) {
			System.out.println(pb);
			PetsBean petBean = new PetsBean();
			ArrayList<PetsBean> petList = new ArrayList<PetsBean>();
			String sql = "select * from petdata inner join ownerdata on ownerdata.id = petdata.reference_owner_id where pet_name Like ? order by pet_name";
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				preparedStmt.setString(1, "%"+pb.getPet_name()+"%");
				rs = preparedStmt.executeQuery();

				while (rs.next()) {
				petBean = new PetsBean();
				OwnersBean ownersBean = new OwnersBean();
            	ownersBean.setOwners_idcard(rs.getString("owners_idcard"));
            	ownersBean.setPrefix(rs.getString("prefix"));
            	ownersBean.setOwners_name(rs.getString("owners_name"));
            	ownersBean.setOwners_lname(rs.getString("owners_lname"));
            	ownersBean.setOwners_gender(rs.getString("owners_gender"));
            	ownersBean.setAddress(rs.getString("address"));
            	ownersBean.setOwners_birthday(rs.getString("owners_birthday"));
            	ownersBean.setTelephon(rs.getString("telephon"));
            	petBean.setReference_owner_id(ownersBean);
            	
				petBean.setId(rs.getInt("id"));
            	petBean.setPet_name(rs.getString("pet_name"));
            	petBean.setPet_category(rs.getString("pet_category"));
            	petBean.setPet_gene(rs.getString("pet_gene"));
            	petBean.setPet_gender(rs.getString("pet_gender"));
            	petBean.setPet_weight(rs.getString("pet_weight"));
            	petBean.setPet_birthday(rs.getString("pet_birthday"));
            	petBean.setPet_age(rs.getString("pet_age"));
            	petBean.setPet_extra(rs.getString("pet_extra"));
            	petBean.setActive_flag(rs.getString("active_flag"));
            	petBean.setDate_nofi(rs.getString("date_nofi"));
            	petBean.setEmerStatus(rs.getInt("emer_status"));
                
            	 petList.add(petBean);
	            }
	            rs.close();	
	            return petList;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e);
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
		
		static public ArrayList<TypePetBean> querypetAll(){
			
			TypePetBean petBean = new TypePetBean();
			ArrayList<TypePetBean> petList = new ArrayList<TypePetBean>();
			
			String sql = "select * from type_pet order by type_name; ";
			try {
					preparedStmt = dbc.createDBConnect().prepareStatement(sql);
					
					rs = preparedStmt.executeQuery();			
					//dbc.closeConnection();
					
		            while (rs.next()) {
		            	petBean = new TypePetBean();
		            	
		            	petBean.setId(rs.getInt("id"));
		            	petBean.setTypeName(rs.getString("type_name"));
		            	petList.add(petBean);
		            }
		            rs.close();	
	            return petList;
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
		
	
	static public ArrayList<PetsBean> queryPetsByName(int owner_id){
		ArrayList<PetsBean> petsList = new ArrayList<PetsBean>();
		String sql = "";
		
		if(owner_id == 0){
			sql = "select * from petdata inner join ownerdata on ownerdata.id = petdata.reference_owner_id where active_flag = 'Y' ORDER BY date_nofi";
		}else{
			sql = "select * from petdata inner join ownerdata on ownerdata.id = petdata.reference_owner_id where reference_owner_id = ?";
			System.out.println(owner_id);
		}
		
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			
			if(owner_id != 0){
				preparedStmt.setInt (1, owner_id);
			}
			
			rs = preparedStmt.executeQuery();			
			//dbc.closeConnection();
			PetsBean petBean = null;
            while (rs.next()) {
            	petBean = new PetsBean();
            	//petBean.setID(rs.getInt("ID"));
            	OwnersBean ownersBean = new OwnersBean();
            	ownersBean.setOwners_name(rs.getString("owners_name"));
            	ownersBean.setOwners_lname(rs.getString("owners_lname"));
            	petBean.setReference_owner_id(ownersBean);
            	petBean.setId(rs.getInt("id"));
            	petBean.setPet_name(rs.getString("pet_name"));
            	petBean.setPet_category(rs.getString("pet_category"));
            	petBean.setPet_gene(rs.getString("pet_gene"));
            	petBean.setPet_gender(rs.getString("pet_gender"));
            	petBean.setPet_weight(rs.getString("pet_weight"));
            	petBean.setPet_birthday(rs.getString("pet_birthday"));
            	petBean.setPet_age(rs.getString("pet_age"));
            	petBean.setPet_extra(rs.getString("pet_extra"));
            	petBean.setActive_flag(rs.getString("active_flag"));
            	petBean.setEmerStatus(rs.getInt("emer_status"));
                petsList.add(petBean);
            }
            rs.close();	
            return petsList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
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
	static public ArrayList<PetsBean> queryPetByName(String pb){
		ArrayList<PetsBean> petsList = new ArrayList<PetsBean>();
		System.out.println(pb);
		String sql = "";
		if(pb != ""){
			sql = "select * from petdata inner join ownerdata on ownerdata.id = petdata.reference_owner_id where pet_name = ?";
				
		}
		else{
			sql = "select * from petdata inner join ownerdata on ownerdata.id = petdata.reference_owner_id ORDER BY date_nofi";
			
		}
			
		
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			if(pb != ""){
				preparedStmt.setString(1, pb);
			}
				
			rs = preparedStmt.executeQuery();			
			//dbc.closeConnection();
			PetsBean petBean = null;
            while (rs.next()) {
            	petBean = new PetsBean();
            	OwnersBean ownersBean = new OwnersBean();
            	ownersBean.setId(rs.getInt("id"));
            	ownersBean.setOwners_idcard(rs.getString("owners_idcard"));
            	ownersBean.setPrefix(rs.getString("prefix"));
            	ownersBean.setOwners_name(rs.getString("owners_name"));
            	ownersBean.setOwners_lname(rs.getString("owners_lname"));
            	ownersBean.setOwners_gender(rs.getString("owners_gender"));
            	ownersBean.setAddress(rs.getString("address"));
            	ownersBean.setTelephon(rs.getString("telephon"));
            	ownersBean.setOwners_birthday(rs.getString("owners_birthday"));
            	
            	petBean.setReference_owner_id(ownersBean);
            	petBean.setId(rs.getInt("id"));
            	petBean.setPet_name(rs.getString("pet_name"));
            	petBean.setPet_category(rs.getString("pet_category"));
            	petBean.setPet_gene(rs.getString("pet_gene"));
            	petBean.setPet_gender(rs.getString("pet_gender"));
            	petBean.setPet_weight(rs.getString("pet_weight"));
            	petBean.setPet_birthday(rs.getString("pet_birthday"));
            	petBean.setPet_age(rs.getString("pet_age"));
            	petBean.setPet_extra(rs.getString("pet_extra"));
            	petBean.setActive_flag(rs.getString("active_flag"));
            	petBean.setEmerStatus(rs.getInt("emer_status"));
                petsList.add(petBean);
            }
            rs.close();	
            return petsList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
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
	
	
	
	
	static public ArrayList<PetsBean> queryPetAll() {

		PetsBean petBean = new PetsBean();
		ArrayList<PetsBean> petsList = new ArrayList<PetsBean>();

		String sql = "select * from petdata order BY date_nofi DESC; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				petBean = new PetsBean();

				petBean.setId(rs.getInt("id"));
            	petBean.setPet_name(rs.getString("pet_name"));
            	petBean.setPet_category(rs.getString("pet_category"));
            	petBean.setPet_gene(rs.getString("pet_gene"));
            	petBean.setPet_gender(rs.getString("pet_gender"));
            	petBean.setPet_weight(rs.getString("pet_weight"));
            	petBean.setPet_birthday(rs.getString("pet_birthday"));
            	petBean.setPet_age(rs.getString("pet_age"));
            	petBean.setPet_extra(rs.getString("pet_extra"));
            	petBean.setActive_flag(rs.getString("active_flag"));
            	petBean.setEmerStatus(rs.getInt("emer_status"));
                
            	petsList.add(petBean);
			}
			rs.close();
			return petsList;
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
	
	//ค้นหาข้อมูลประเภทสัตว์เลี้ยง
		static public ArrayList<TypePetBean> queryTypePetAll(){
			
			TypePetBean bean = new TypePetBean();
			ArrayList<TypePetBean> list = new ArrayList<TypePetBean>();
			
			String sql = "select * from type_pet order by type_name; ";
			try {
					preparedStmt = dbc.createDBConnect().prepareStatement(sql);
					
					rs = preparedStmt.executeQuery();			
					//dbc.closeConnection();
					
		            while (rs.next()) {
		            	bean = new TypePetBean();
		            	
		            	bean.setId(rs.getInt("id"));
		            	bean.setTypeName(rs.getString("type_name"));
		            	
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
	
	//Update
	
	public boolean updatePet(PetsBean petBean){		
		
		String sql = "update petdata set pet_name = ?,pet_category = ?,pet_gene = ?,pet_gender = ?,pet_weight = ?,pet_birthday = ?,pet_age = ? ,pet_extra = ? where id = ? limit 1; ";
		try {     
			
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			
			preparedStmt.setString (1, petBean.getPet_name());
			preparedStmt.setString (2, petBean.getPet_category());
			preparedStmt.setString (3, petBean.getPet_gene());
			preparedStmt.setString (4, petBean.getPet_gender());
			preparedStmt.setString (5, petBean.getPet_weight());			
			preparedStmt.setString (6, petBean.getPet_birthday());
			preparedStmt.setString (7, petBean.getPet_age());
			preparedStmt.setString (8, petBean.getPet_extra());
			preparedStmt.setInt (9, petBean.getId());
			
			
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
	
	//ส่งสัตว์ตรวจ
	public boolean updateTreatmentPet(PetsBean petBean){		
		
		String sql = "";
		if(petBean.getEmerStatus() == 1){
			
			sql = "update petdata set active_flag = 'Y', date_nofi = now(), emer_status = 1 where id = ? limit 1; ";
		}else{
			
			sql = "update petdata set active_flag = 'Y', date_nofi = now(), emer_status = 0 where id = ? limit 1; ";
		}
		
		
		try {     
			
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt (1, petBean.getId());
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
	
	//ยกเลิการส่งตรวจ
		static public boolean updateNoTreatmentPet(PetsBean petBean){		
			
			String sql = "update petdata set active_flag = 'N' , date_nofi = null , emer_status = 0 where id = ? limit 1; ";
			try {     
				
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				preparedStmt.setInt (1, petBean.getId());
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
	
	//ลบข้อมูลสัตว์เลี้ยง
	public boolean delPet(PetsBean pet){
		String sql = " delete from petdata where id = ? limit 1; ";
		try {     
			
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			
			preparedStmt.setInt (1, pet.getId());
			
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
	
	static public String checkStatusTreatment(int pet_id){

		String sql = "";
		String dataStatus = null;
		
			sql = "select active_flag from `petdata` where `id` = ? ;";
			
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt (1, pet_id);
			rs = preparedStmt.executeQuery();
			rs.next();
			dataStatus = rs.getString("active_flag");
            rs.close();	
            return dataStatus;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
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
