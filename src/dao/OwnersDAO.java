package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.OwnersBean;
import model.ProductBean;


public class OwnersDAO {
	static ConnectDB dbc = new ConnectDB();
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;

	// เพิ่มข้อมูลเจ้าของสัตว์เลี้ยง
	public boolean insertOwner(OwnersBean owner) {

		String sql = "insert into ownerdata"
				+ "(owners_idcard,prefix,owners_name,owners_lname,owners_gender,address,telephon,owners_birthday)"
				+ " values ( ?, ?, ?, ?, ?, ?, ?, ?)";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, owner.getOwners_idcard());
			preparedStmt.setString(2, owner.getPrefix());
			preparedStmt.setString(3, owner.getOwners_name());
			preparedStmt.setString(4, owner.getOwners_lname());
			preparedStmt.setString(5, owner.getOwners_gender());
			preparedStmt.setString(6, owner.getAddress());
			preparedStmt.setString(7, owner.getTelephon());
			preparedStmt.setString(8, owner.getOwners_birthday());

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

	//ลบข้อมูลเจ้าของสัตว์เลี้ยง
	public boolean delOwner(OwnersBean owner) {

		String sql = " delete from ownerdata where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, owner.getId());

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

	// แก้ไขข้อมูลสัตว์เลี้ยง
	public boolean updateOwner(OwnersBean owner) {

		String sql = "update ownerdata set owners_idcard = ?,prefix = ?,owners_name = ?,owners_lname = ?,owners_gender = ?,address = ?,telephon = ?,owners_birthday = ? where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, owner.getOwners_idcard());
			preparedStmt.setString(2, owner.getPrefix());
			preparedStmt.setString(3, owner.getOwners_name());
			preparedStmt.setString(4, owner.getOwners_lname());
			preparedStmt.setString(5, owner.getOwners_gender());
			preparedStmt.setString(6, owner.getAddress());
			preparedStmt.setString(7, owner.getTelephon());
			preparedStmt.setString(8, owner.getOwners_birthday());
			preparedStmt.setInt(9, owner.getId());

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

	//ค้นหาข้อมูลเจ้าของสัตว์เลี้ยง
	static public ArrayList<OwnersBean> search(String owner_key) {
		OwnersBean ownerBean = new OwnersBean();
		ArrayList<OwnersBean> ownerList = new ArrayList<OwnersBean>();
		
		String sql = "select * from ownerdata where owners_name LIKE ? OR owners_idcard LIKE ? OR telephon LIKE ? ORDER BY owners_name";
		
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, "%"+owner_key+"%");
			preparedStmt.setString(2, "%"+owner_key+"%");
			preparedStmt.setString(3, "%"+owner_key+"%");
			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				ownerBean = new OwnersBean();

				ownerBean.setId(rs.getInt("id"));
				ownerBean.setPrefix(rs.getString("prefix"));
				ownerBean.setOwners_idcard(rs.getString("owners_idcard"));
				ownerBean.setOwners_name(rs.getString("owners_name"));
				ownerBean.setOwners_lname(rs.getString("owners_lname"));
				ownerBean.setOwners_gender(rs.getString("owners_gender"));
				ownerBean.setAddress(rs.getString("address"));
				ownerBean.setTelephon(rs.getString("telephon"));
				ownerBean.setOwners_birthday(rs.getString("owners_birthday"));

				ownerList.add(ownerBean);
			}
			rs.close();
			return ownerList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error search ===> " + e);
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
	
	static public ArrayList<OwnersBean> queryOwnerAll() {

		OwnersBean ownerBean = new OwnersBean();
		ArrayList<OwnersBean> ownerList = new ArrayList<OwnersBean>();

		String sql = "select * from ownerdata order by owners_name; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				ownerBean = new OwnersBean();

				ownerBean.setId(rs.getInt("id"));
				ownerBean.setPrefix(rs.getString("prefix"));
				ownerBean.setOwners_idcard(rs.getString("owners_idcard"));
				ownerBean.setOwners_name(rs.getString("owners_name"));
				ownerBean.setOwners_lname(rs.getString("owners_lname"));
				ownerBean.setOwners_gender(rs.getString("owners_gender"));
				ownerBean.setAddress(rs.getString("address"));
				ownerBean.setTelephon(rs.getString("telephon"));
				ownerBean.setOwners_birthday(rs.getString("owners_birthday"));

				ownerList.add(ownerBean);
			}
			rs.close();
			return ownerList;
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
	
	
	

}
