package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.ConnectDB;
import model.DrugBean;
import model.OtherTreatment;
import model.OwnersBean;
import model.PetsBean;
import model.TreatmentBean;
import model.TreatmentDrugBean;

public class TreatmentDao {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt = null;
	
	//เน€เธ�เธดเน�เธกเธ�เน�เธญเธกเธนเธฅเธชเธฑเธ•เธงเน€เธฅเธตเน�เธขเธ�
	static public boolean insertTreatment(String[] drug_id, String[] drug_qty, TreatmentBean treatmentBean, String[] other_name,String[] otherPriceArray){		
		String sql_insert = "insert into `treatment`" 		
				+ "(refer_pet_id, treatment_date,vet_name,treatment_detail,note)"  
		        + " values ( ?, ?, ?, ? ,?); ";
		String sql_insert_drug = "insert into `treatment_drug`" 		
				+ "(refer_treatment_id,refer_drug_id,drug_qty,drug_sumprice)"  
		        + " values ( ?, ?, ?, ?); ";
		String sql_insert_other = "insert into `treatment_other`" 		
				+ "(refer_treatment_id,other_id,other_price)"  
		        + " values ( ?, ?, ?); ";
		try {     
			preparedStmt = dbc.createDBConnect().prepareStatement(sql_insert ,Statement.RETURN_GENERATED_KEYS);
			preparedStmt.setInt (1, treatmentBean.getRefer_pet_id().getId());
			preparedStmt.setString (2, treatmentBean.getTreatment_date());
			preparedStmt.setString (3, treatmentBean.getVet_name());
			preparedStmt.setString(4, treatmentBean.getTreatment_detail());
			preparedStmt.setString(5, treatmentBean.getNote());
			int affectedRows = preparedStmt.executeUpdate();
			if (affectedRows == 0) {
	            throw new SQLException("Creating user failed, no rows affected.");
	        }
			try (ResultSet generatedKeys = preparedStmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	            	//get and set Last insert id Table: treatment
	                treatmentBean.setId(generatedKeys.getInt(1));
	                //get and set All Data Table: drug
	                DrugBean drugBeanGetall = new DrugBean();
	                OtherTreatment other = new OtherTreatment();
	                ArrayList<DrugBean> arrayListDrug = new ArrayList<DrugBean>();
	                ArrayList<OtherTreatment> arrayListOther = new ArrayList<OtherTreatment>();
	                preparedStmt = null;
	                preparedStmt = dbc.createDBConnect().prepareStatement(" SELECT * FROM `drug`; ");
	                rs = preparedStmt.executeQuery();			
	                while (rs.next()) {
	                	drugBeanGetall = new DrugBean();
	                	drugBeanGetall.setId(rs.getInt("id"));
	                	drugBeanGetall.setDrug_price(rs.getDouble("drug_price"));
	                	arrayListDrug.add(drugBeanGetall);
	                }
	                preparedStmt = null;
	                preparedStmt = dbc.createDBConnect().prepareStatement(" SELECT * FROM `other_treatment`; ");
	                rs = preparedStmt.executeQuery();			
	                while (rs.next()) {
	                	other = new OtherTreatment();
	                	other.setId(rs.getInt("id"));
	                	other.setOtherPrice(rs.getDouble("other_price"));
	                	arrayListOther.add(other);
	                }
	                //######################################
	                preparedStmt = null;
	                DrugBean drugBean = new DrugBean();
	                TreatmentDrugBean treatmentDrugBean = new TreatmentDrugBean();
	                double total_price = 0.00;
	        		for (int i = 0; i < drug_id.length; i++) {
	        			total_price = 0.00;
	        			//set to bean
	        			drugBean.setId(Integer.parseInt(drug_id[i]));
	        			treatmentDrugBean.setDrug_qty(Integer.parseInt(drug_qty[i]));
	        			for (DrugBean dData : arrayListDrug) {
	        				if(dData.getId() == drugBean.getId()){
	        					total_price = dData.getDrug_price() * treatmentDrugBean.getDrug_qty();
	        				}
						}
	        			preparedStmt = dbc.createDBConnect().prepareStatement(sql_insert_drug);
	        			preparedStmt.setInt (1, treatmentBean.getId());
	        			preparedStmt.setInt (2, drugBean.getId());
	        			preparedStmt.setInt (3, treatmentDrugBean.getDrug_qty());
	        			preparedStmt.setDouble(4, total_price);
	        			preparedStmt.executeUpdate();
	        		}
        			//######## ORTHER ###########################
	                preparedStmt = null;
	                OtherTreatment otherBean = new OtherTreatment();
	                total_price = 0.00;
	        		for (int i = 0; i < other_name.length; i++) {
	        			total_price = 0.00;
	        			//set to bean
	        			otherBean.setId(Integer.parseInt(other_name[i]));
	        			otherBean.setOtherPrice(Double.parseDouble(otherPriceArray[i]));
	        			for (OtherTreatment dData : arrayListOther) {
	        				if(dData.getId() == otherBean.getId()){
	        					total_price = dData.getOtherPrice();
	        				}
						}
	        			preparedStmt = dbc.createDBConnect().prepareStatement(sql_insert_other);
	        			preparedStmt.setInt (1, treatmentBean.getId());
	        			preparedStmt.setInt (2, otherBean.getId());
	        			preparedStmt.setDouble (3, otherBean.getOtherPrice());
	        			preparedStmt.executeUpdate();
	        		}
	            }
	            else {
	                throw new SQLException("Creating treatment failed, no ID obtained.");
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
	static public ArrayList<TreatmentBean> getAllPayment(){
		ArrayList<TreatmentBean> list = new ArrayList<TreatmentBean>();
		TreatmentBean treatmentBean = new TreatmentBean();
		OwnersBean ownersBean = new OwnersBean();
		PetsBean petBean = new PetsBean();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT treatment.*, petdata.pet_name, ownerdata.owners_name,ownerdata.owners_lname  ")
			.append(" FROM `treatment`  ")
			.append(" INNER JOIN petdata ON petdata.id = treatment.refer_pet_id ")
			.append(" INNER JOIN ownerdata ON ownerdata.id = petdata.reference_owner_id ")
			.append(" WHERE status_payment = 0 ORDER BY treatment.id DESC;");
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
			rs = preparedStmt.executeQuery();			
			//dbc.closeConnection();
            while (rs.next()) {
            	treatmentBean.setId(rs.getInt("id"));
            	treatmentBean.setTreatment_date(rs.getString("treatment_date"));
            	treatmentBean.setTreatment_detail(rs.getString("treatment_detail"));
            	treatmentBean.setNote(rs.getString("note"));
            	ownersBean.setOwners_name(rs.getString("owners_name"));
            	ownersBean.setOwners_lname(rs.getString("owners_lname"));
            	petBean.setPet_name(rs.getString("pet_name"));
            	petBean.setReference_owner_id(ownersBean);
            	treatmentBean.setRefer_pet_id(petBean);
            	list.add(treatmentBean);
            	treatmentBean = new TreatmentBean();
        		ownersBean = new OwnersBean();
        		petBean = new PetsBean();
            }
            rs.close();	
            return list;
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
	static public boolean updateStatusPayment(TreatmentBean bean){		
		String sql = "update treatment set status_payment = 1 where id = ? limit 1; ";
		try {     
			
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1,bean.getId());
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
