package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.TypePetBean;

public class TypeProductDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;

	//ค้นหาข้อมูลยาทั้งหมด
	static public ArrayList<TypePetBean> queryTypeDrugAll(){
		
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

}
