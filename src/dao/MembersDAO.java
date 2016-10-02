package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.DrugBean;
import model.MembersBean;
import model.OwnersBean;
import model.PetsBean;
import model.ProductBean;

public class MembersDAO {
	static ConnectDB dbc = new ConnectDB();
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;

	// Check Login
	static public boolean checkLogin(MembersBean login) {

		String sql = "select * from members where username = ? and password = ?;";

		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, login.getUsername());
			preparedStmt.setString(2, login.getPassword());

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();
			if (rs.next() != false) {

				login.setId(rs.getInt("id"));
				login.setUsername(rs.getString("username"));
				login.setPrefix(rs.getString("prefix"));
				login.setMemName(rs.getString("mem_name"));
				login.setMemLname(rs.getString("mem_lname"));
				login.setMemAdress(rs.getString("mem_address"));
				login.setMemTelephone(rs.getString("mem_tel"));
				login.setMemCertificate(rs.getString("mem_certificate"));
				login.setMemBirthday(rs.getString("mem_birthday"));
				login.setMemGender(rs.getString("mem_gender"));
				login.setMemAge(rs.getString("mem_age"));
				login.setMemPosition(rs.getString("mem_position"));
				login.setMemImage(rs.getString("mem_img"));
				login.setTypeCode(rs.getInt("type_code"));

				return true;
			} else {

				return false;

			}

			// rs.close();
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

	
	public boolean insertMember(MembersBean member) {

		String sql = "insert into members"
				+ "(username,password,prefix,mem_name,mem_lname,mem_address,mem_tel,mem_certificate,mem_birthday,mem_gender,mem_age,mem_position,mem_img,type_code)"
				+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, member.getUsername());
			preparedStmt.setString(2, member.getPassword());
			preparedStmt.setString(3, member.getPrefix());
			preparedStmt.setString(4, member.getMemName());
			preparedStmt.setString(5, member.getMemLname());
			preparedStmt.setString(6, member.getMemAdress());
			preparedStmt.setString(7, member.getMemTelephone());
			preparedStmt.setString(8, member.getMemCertificate());
			preparedStmt.setString(9, member.getMemBirthday());
			preparedStmt.setString(10, member.getMemGender());
			preparedStmt.setString(11, member.getMemAge());
			preparedStmt.setString(12, member.getMemPosition());
			preparedStmt.setString(13, member.getMemImage());
			preparedStmt.setInt(14, member.getTypeCode());

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
	
		public static ArrayList<MembersBean> queryMembers(String memName) {

			MembersBean memBean = new MembersBean();
			ArrayList<MembersBean> memList = new ArrayList<MembersBean>();

			String sql = "select * from members where username like ? or mem_name like ? or mem_tel like ? order by id desc; ";
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				preparedStmt.setString(1, memName + "%");
				preparedStmt.setString(2, memName + "%");
				preparedStmt.setString(3, memName + "%");

				rs = preparedStmt.executeQuery();
				// dbc.closeConnection();

				while (rs.next()) {
					memBean = new MembersBean();
					// petBean.setID(rs.getInt("ID"));
					memBean.setId(rs.getInt("id"));
					memBean.setUsername(rs.getString("username"));
					memBean.setPassword(rs.getString("password"));
					memBean.setPrefix(rs.getString("prefix"));
					memBean.setMemName(rs.getString("mem_name"));
					memBean.setMemLname(rs.getString("mem_lname"));
					memBean.setMemAdress(rs.getString("mem_address"));
					memBean.setMemTelephone(rs.getString("mem_tel"));
					memBean.setMemCertificate(rs.getString("mem_certificate"));
					memBean.setMemBirthday(rs.getString("mem_birthday"));
					memBean.setMemGender(rs.getString("mem_gender"));
					memBean.setMemAge(rs.getString("mem_age"));
					memBean.setMemPosition(rs.getString("mem_position"));
					memBean.setMemImage(rs.getString("mem_img"));
					memBean.setTypeCode(rs.getInt("type_code"));

					memList.add(memBean);
				}
				rs.close();
				return memList;
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
		
		
		
		static public ArrayList<MembersBean> queryMembersAll() {

			MembersBean memBean = new MembersBean();
			ArrayList<MembersBean> memList = new ArrayList<MembersBean>();

			String sql = "select * from members order by id desc; ";
			
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);

				rs = preparedStmt.executeQuery();
				// dbc.closeConnection();

				while (rs.next()) {
					memBean = new MembersBean();
					// petBean.setID(rs.getInt("ID"));
					memBean.setId(rs.getInt("id"));
					memBean.setUsername(rs.getString("username"));
					memBean.setPassword(rs.getString("password"));
					memBean.setPrefix(rs.getString("prefix"));
					memBean.setMemName(rs.getString("mem_name"));
					memBean.setMemLname(rs.getString("mem_lname"));
					memBean.setMemAdress(rs.getString("mem_address"));
					memBean.setMemTelephone(rs.getString("mem_tel"));
					memBean.setMemCertificate(rs.getString("mem_certificate"));
					memBean.setMemBirthday(rs.getString("mem_birthday"));
					memBean.setMemGender(rs.getString("mem_gender"));
					memBean.setMemAge(rs.getString("mem_age"));
					memBean.setMemPosition(rs.getString("mem_position"));
					memBean.setMemImage(rs.getString("mem_img"));
					memBean.setTypeCode(rs.getInt("type_code"));

					memList.add(memBean);
				}
				rs.close();
				return memList;
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
		
		
		
		public boolean updateMember(MembersBean mem) {

			String sql = "update members set username = ?,password = ?,prefix = ?,mem_name = ?,mem_lname = ?,mem_address = ?"
					+ ",mem_tel = ?,mem_certificate = ?,mem_birthday = ?,mem_gender = ?,mem_age = ?"
					+ ",mem_position = ?,mem_img = ?,type_code = ? where id = ?; ";
			try {

				preparedStmt = dbc.createDBConnect().prepareStatement(sql);

				preparedStmt.setString(1, mem.getUsername());
				preparedStmt.setString(2, mem.getPassword());
				preparedStmt.setString(3, mem.getPrefix());
				preparedStmt.setString(4, mem.getMemName());
				preparedStmt.setString(5, mem.getMemLname());
				preparedStmt.setString(6, mem.getMemAdress());
				preparedStmt.setString(7, mem.getMemTelephone());
				preparedStmt.setString(8, mem.getMemCertificate());
				preparedStmt.setString(9, mem.getMemBirthday());
				preparedStmt.setString(10, mem.getMemGender());
				preparedStmt.setString(11, mem.getMemAge());
				preparedStmt.setString(12, mem.getMemPosition());
				preparedStmt.setString(13, mem.getMemImage());
				preparedStmt.setInt(14, mem.getTypeCode());
				preparedStmt.setInt(15, mem.getId());

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
