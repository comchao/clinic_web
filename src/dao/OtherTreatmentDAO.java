package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.OtherTreatment;

public class OtherTreatmentDAO {
	static ConnectDB dbc = new ConnectDB();	
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	
	//ค้นหาข้อมูลยาทั้งหมด
	static public ArrayList<OtherTreatment> queryOtherTreatment(){
		
		OtherTreatment bean = new OtherTreatment();
		ArrayList<OtherTreatment> list = new ArrayList<OtherTreatment>();
		
		String sql = "select * from other_treatment order by other_name; ";
		try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				
				rs = preparedStmt.executeQuery();			
				//dbc.closeConnection();
				
	            while (rs.next()) {
	            	bean = new OtherTreatment();
	            	
	            	bean.setId(rs.getInt("id"));
	            	bean.setOtherName(rs.getString("other_name"));
	            	bean.setOtherPrice(rs.getDouble("other_price"));
	            	bean.setOtherUnit(rs.getString("other_unit"));
	            	
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
