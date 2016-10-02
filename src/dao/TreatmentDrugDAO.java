package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.DrugBean;
import model.TreatmentDrugBean;

public class TreatmentDrugDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static ResultSet rsf = null;
	static PreparedStatement preparedStmtf;
	static PreparedStatement preparedStmt;
	
	static public ArrayList<TreatmentDrugBean> queryForPrint(int tm_id){
		ArrayList<TreatmentDrugBean> list = new ArrayList<TreatmentDrugBean>();
		TreatmentDrugBean tmDrugBean = new TreatmentDrugBean();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT drug.drug_name, this_.drug_qty, this_.drug_sumprice ")
		.append(" FROM `treatment_drug` this_ ")
		.append(" INNER JOIN drug ON drug.id = this_.refer_drug_id ")
		.append(" WHERE this_.refer_treatment_id = ? ")
		.append("  ")
		.append(" UNION ")
		.append("  ")
		.append(" SELECT other_treatment.other_name drug_name,  1 drug_qty, treatment_other.other_price ")
		.append(" FROM `treatment_other`  ")
		.append(" INNER JOIN other_treatment ON other_treatment.id = treatment_other.other_id ")
		.append(" WHERE treatment_other.refer_treatment_id = ? ");
		
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
			preparedStmt.setInt(1, tm_id);
			preparedStmt.setInt(2, tm_id);
			rs = preparedStmt.executeQuery();			
            while (rs.next()) {
            	DrugBean drugBean = new DrugBean();
            	
            	drugBean.setDrug_name(rs.getString("drug_name"));
            	tmDrugBean.setRefer_drug_id(drugBean);
            	tmDrugBean.setDrug_qty(rs.getInt("drug_qty"));
            	tmDrugBean.setDrug_sumprice(rs.getDouble("drug_sumprice"));
            	
            	
            	list.add(tmDrugBean);
            	
            	tmDrugBean = new TreatmentDrugBean();
            }
            rs.close();
           // rsf.close();	
            return list;
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
	
	static public ArrayList<TreatmentDrugBean> queryForHistory(int pet_id){
		
		ArrayList<TreatmentDrugBean> list = new ArrayList<TreatmentDrugBean>();
		TreatmentDrugBean tmDrugBean = new TreatmentDrugBean();
		StringBuilder sql = new StringBuilder();
		
		try {
			
			sql.append(" SELECT id,treatment_detail,note ")
				.append(" FROM  treatment ")
				.append(" WHERE refer_pet_id = ? ORDER BY id DESC")
				.append("  ");
			
			preparedStmtf = dbc.createDBConnect().prepareStatement(sql.toString());
			preparedStmtf.setInt(1, pet_id);
	
			rsf = preparedStmtf.executeQuery();
			
			if(rsf.next()){
				
				do{
					
					sql = new StringBuilder();
					
					sql.append(" SELECT drug.drug_name, this_.drug_qty,`treatment`.treatment_date  ")
					.append(" FROM `treatment_drug` this_ ")
					.append(" INNER JOIN `treatment` on `treatment`.`id` = this_.refer_treatment_id ")
					.append(" INNER JOIN drug ON drug.id = this_.refer_drug_id ")
					.append(" WHERE this_.refer_treatment_id = ?  ")
					.append("  ")
					.append(" UNION ")
					.append("  ")
					.append(" SELECT other_treatment.other_name drug_name,  1 drug_qty ,`treatment`.treatment_date ")
					.append(" FROM `treatment_other`  ")
					.append(" INNER JOIN `treatment` on `treatment`.`id` = `treatment_other`.refer_treatment_id ")
					.append(" INNER JOIN other_treatment ON other_treatment.id = treatment_other.other_id ")
					.append(" WHERE treatment_other.refer_treatment_id = ? ");
				
					preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
					preparedStmt.setInt(1, rsf.getInt("id"));
					preparedStmt.setInt(2, rsf.getInt("id"));
					rs = preparedStmt.executeQuery();
					DrugBean drugBean = new DrugBean();
					drugBean.setDetail(rsf.getString("treatment_detail"));
	            	drugBean.setNote(rsf.getString("note"));
		            while (rs.next()) {
		            	
		            	
		            	drugBean.setDrug_name(rs.getString("drug_name"));
		            	tmDrugBean.setRefer_drug_id(drugBean);
		            	tmDrugBean.setDrug_qty(rs.getInt("drug_qty"));
		            	tmDrugBean.setTreatment_date(rs.getString("treatment_date"));
		            	list.add(tmDrugBean);
		            	
		            	tmDrugBean = new TreatmentDrugBean();
		            	drugBean = new DrugBean();
		            }
					
				}while(rsf.next());
				
			}else{
				
				System.out.println("dddd");
				return null;
			}
			
            return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
				preparedStmtf.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}	
		return null;
	}
	
	
	static public ArrayList<TreatmentDrugBean> queryForHistoryOther(int pet_id){
		
		ArrayList<TreatmentDrugBean> list = new ArrayList<TreatmentDrugBean>();
		TreatmentDrugBean tmDrugBean = new TreatmentDrugBean();
		StringBuilder sql = new StringBuilder();
		
		try {
			
			sql.append(" SELECT id ")
				.append(" FROM  treatment ")
				.append(" WHERE refer_pet_id = ? ORDER BY id DESC")
				.append("  ");
			
			preparedStmtf = dbc.createDBConnect().prepareStatement(sql.toString());
			preparedStmtf.setInt(1, pet_id);
	
			rsf = preparedStmtf.executeQuery();
			
			if(rsf.next()){
				
				do{
					sql = new StringBuilder();
					
					sql.append(" SELECT other_treatment.other_name drug_name,  1 drug_qty ,`treatment`.treatment_date ")
					.append(" FROM `treatment_other`  ")
					.append(" INNER JOIN `treatment` on `treatment`.`id` = `treatment_other`.refer_treatment_id ")
					.append(" INNER JOIN other_treatment ON other_treatment.id = treatment_other.other_id ")
					.append(" WHERE treatment_other.refer_treatment_id = ? ");
				
					preparedStmt = dbc.createDBConnect().prepareStatement(sql.toString());
					preparedStmt.setInt(1, rsf.getInt("id"));
					rs = preparedStmt.executeQuery();

					while (rs.next()){
						
		            	DrugBean drugBean = new DrugBean();
		            	
		            	drugBean.setDrug_name(rs.getString("drug_name"));
		            	tmDrugBean.setRefer_drug_id(drugBean);
		            	tmDrugBean.setDrug_qty(rs.getInt("drug_qty"));
		            	tmDrugBean.setTreatment_date(rs.getString("treatment_date"));
		            	list.add(tmDrugBean);
		            	
		            	tmDrugBean = new TreatmentDrugBean();
		            }
				}while(rsf.next());
				
			}else{
				
				System.out.println("ooooo ");
				return null;
			}
			
            return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
				preparedStmtf.close();
			} catch (Exception e) {
				System.out.println("finally x=> "+e.getMessage());
			}
		}
		return null;
	}
	

}
