package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectDB;
import model.VeterinaryBean;

public class VerterinaryDAO {
	
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	
	static public boolean checkLogin(VeterinaryBean login){
		
		String sql = "select * from veterinary where username = ? and password = ?;";
		
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString (1, login.getUsername());
			preparedStmt.setString (2, login.getPassword());
			
			rs = preparedStmt.executeQuery();			
			//dbc.closeConnection();
            if(rs.next() != false){
            	
            	login.setId(rs.getInt("id"));
            	login.setUsername(rs.getString("username"));
            	login.setPrefix(rs.getString("prefix"));
            	login.setVetName(rs.getString("vet_name"));
            	login.setVetLname(rs.getString("vet_lname"));
            	login.setVetAdress(rs.getString("vet_address"));
            	login.setVetTelephone(rs.getString("vet_telephone"));
            	login.setVetCertificate(rs.getString("vet_certificate"));
            	login.setVetBirthday(rs.getString("vet_birthday"));
            	login.setVetGender(rs.getString("vet_gender"));
            	login.setVetAge(rs.getString("vet_age"));
            	login.setVetPosition(rs.getString("vet_position"));
            	login.setVetImage(rs.getString("vet_image"));
            	login.setTypeCode(rs.getInt("type_code"));
            	
            	return true;
            }else{
            	
            	return false;
            	
            }
            
//            rs.close();	
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
		return false;
	}

}
