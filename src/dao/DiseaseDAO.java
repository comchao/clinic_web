package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.ConnectDB;
import db.ConnectionManager;
import model.AnalysisBean;
import model.SymptomsBean;


public class DiseaseDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
Connection con = null;
	
	PreparedStatement pstm = null;
	static Connection dbconConnection = null;
	static PreparedStatement pre = null;

	static PreparedStatement pstmtt = null;

	//เรียกข้อมูลอาการโรค
static public ArrayList<SymptomsBean> getdisease(){
		
	   SymptomsBean disease = new SymptomsBean();
		ArrayList<SymptomsBean> diseaseList = new ArrayList<SymptomsBean>();
		
		String sql = "select * from symptoms_disease order by symptom; ";
		try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				
				rs = preparedStmt.executeQuery();			
				//dbc.closeConnection();
				
	            while (rs.next()) {
	            	disease = new SymptomsBean();
	            	
	            	disease.setId_symptom(rs.getInt("id_symptom")); //ID อาการโรค
	            	disease.setSymptom(rs.getString("symptom"));    //อาการโรค
	            	diseaseList.add(disease);
	            }
	            rs.close();	
            return diseaseList;
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




//public boolean deletemanyProduct (String[] c){
//	for(String s:c) {
//	
//}
//



public static boolean  insertDisease(AnalysisBean disease) {
	String insertSQL = " insert into analysis_disease(id_symptom ,value)"
			+ " values(? ,?); ";
	System.out.println("Query: " +  insertSQL);
	try {
		
		preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);
		preparedStmt.setInt(1, disease.getId_symptom());
		System.out.println("Id_symptom"+disease.getId_symptom());
		preparedStmt.setFloat(2, disease.getValue());
		System.out.println("Value"+disease.getValue());
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
}}