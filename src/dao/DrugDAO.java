package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectDB;
import model.DrugBean;
import model.ShopDetailBean;

public class DrugDAO {
	static ConnectDB dbc = new ConnectDB();
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;

	public boolean insertDrug(DrugBean drug) {

		String sql = "insert into drug" + "(drug_type,drug_code,drug_name,drug_detail,drug_price,drug_unit)"
				+ " values ( ?,?,?,?,?,?)";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, drug.getDrug_type());
			preparedStmt.setString(2, drug.getDrug_code());
			preparedStmt.setString(3, drug.getDrug_name());
			preparedStmt.setString(4, drug.getDrug_detail());
			preparedStmt.setDouble(5, drug.getDrug_price());
			preparedStmt.setString(6, drug.getDrug_unit());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
	}

	static public ArrayList<DrugBean> queryDrugAll() {

		DrugBean drugBean = new DrugBean();
		ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();

		String sql = "select * from drug order by drug_name; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				drugBean = new DrugBean();

				drugBean.setId(rs.getInt("id"));
				drugBean.setDrug_type(rs.getString("drug_type"));
				drugBean.setDrug_name(rs.getString("drug_name"));
				drugBean.setDrug_detail(rs.getString("drug_detail"));
				drugBean.setDrug_price(rs.getDouble("drug_price"));
				drugBean.setDrug_unit(rs.getString("drug_unit"));

				drugList.add(drugBean);
			}
			rs.close();
			return drugList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}

	static public ArrayList<DrugBean> queryDrugAllWhereTID(int type_id) {

		DrugBean drugBean = new DrugBean();
		ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();

		String sql = "select * from drug where drug_type=? order by drug_name ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1, type_id);

			rs = preparedStmt.executeQuery();

			// dbc.closeConnection();

			while (rs.next()) {
				drugBean = new DrugBean();

				drugBean.setId(rs.getInt("id"));
				drugBean.setDrug_type(rs.getString("drug_type"));
				drugBean.setDrug_name(rs.getString("drug_name"));
				drugBean.setDrug_detail(rs.getString("drug_detail"));
				drugBean.setDrug_price(rs.getDouble("drug_price"));
				drugBean.setDrug_unit(rs.getString("drug_unit"));

				drugList.add(drugBean);
			}
			rs.close();
			return drugList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}

	public ArrayList<DrugBean> searchDrug(String drugName) {

		DrugBean drugBean = new DrugBean();
		ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();

		String sql = "select * from drug where drug_name like ? or drug_type like ?  order by id desc; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, drugList + "%");
			preparedStmt.setString(2, drugList + "%");

			rs = preparedStmt.executeQuery();

			while (rs.next()) {
				drugBean = new DrugBean();

				drugBean.setId(rs.getInt("id"));
				drugBean.setDrug_type(rs.getString("drug_type"));
				drugBean.setDrug_name(rs.getString("drug_name"));
				drugBean.setDrug_detail(rs.getString("drug_detail"));
				drugBean.setDrug_price(rs.getDouble("drug_price"));
				drugBean.setDrug_unit(rs.getString("drug_unit"));

				drugList.add(drugBean);
			}
			rs.close();
			return drugList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}

	static public ArrayList<DrugBean> search(String drug_key) {

		DrugBean drugBean = new DrugBean();
		ArrayList<DrugBean> drugList = new ArrayList<DrugBean>();

		String sql = "select * from drug where drug_name LIKE ? OR drug_code LIKE ? order by drug_name; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, "%" + drug_key + "%");
			preparedStmt.setString(2, "%" + drug_key + "%");
			rs = preparedStmt.executeQuery();

			// dbc.closeConnection();

			while (rs.next()) {
				drugBean = new DrugBean();

				drugBean.setId(rs.getInt("id"));
				drugBean.setDrug_type(rs.getString("drug_type"));
				drugBean.setDrug_code(rs.getString("drug_code"));
				drugBean.setDrug_name(rs.getString("drug_name"));
				drugBean.setDrug_detail(rs.getString("drug_detail"));
				drugBean.setDrug_price(rs.getDouble("drug_price"));
				drugBean.setDrug_unit(rs.getString("drug_unit"));

				drugList.add(drugBean);
			}
			rs.close();
			return drugList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}

	public boolean delDrug(DrugBean drug) {

		String sql = " delete from drug where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, drug.getId());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
	}

	public boolean updateDrug(DrugBean drug) {

		String sql = "update drug set drug_name = ?,drug_detail = ?,drug_price = ?,drug_unit = ? where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, drug.getDrug_name());
			preparedStmt.setString(2, drug.getDrug_detail());
			preparedStmt.setDouble(3, drug.getDrug_price());
			preparedStmt.setString(4, drug.getDrug_unit());
			preparedStmt.setInt(5, drug.getId());

			preparedStmt.executeUpdate();
			dbc.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
	}

	/// กราฟpie ค่ายา
	static public ArrayList<DrugBean> treatmentCharPie(String produc_month, String produc_year , String  ON ) {

		DrugBean drugBean = new DrugBean();
		int limit = 0;

		ArrayList<DrugBean> drughopList = new ArrayList<DrugBean>();

		String sql = "SELECT treatment.`treatment_date` AS treatment_treatment_date,drug.`drug_name` AS drug_drug_name, drug.`drug_price`AS drug_drug_price, SUM(`drug_qty`)AS treatment_drug_drug_qty, SUM(`drug_sumprice`) AS drug_sumprice FROM `treatment` treatment INNER JOIN `treatment_drug` treatment_drug ON treatment.`id` = treatment_drug.`refer_treatment_id` INNER JOIN `drug` drug ON treatment_drug.`refer_drug_id` = drug.`id` WHERE treatment_month = ? AND treatment_year = ? GROUP BY `drug_drug_name` ORDER BY treatment_drug_drug_qty DESC ,drug_sumprice DESC LIMIT  "+limit+ ","+ON+"; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			int i = 1;
			preparedStmt.setString(i++, produc_month);
			System.out.println(produc_month);
			preparedStmt.setString(i++, produc_year);
			System.out.println(produc_year);

			rs = preparedStmt.executeQuery();

			while (rs.next()) {
				drugBean = new DrugBean();

				drugBean.setCountry(rs.getString("drug_drug_name")); // ชื่อ
				drugBean.setDrug_price(rs.getDouble("drug_drug_price")); // ราคา
				drugBean.setDrug_unit(rs.getString("treatment_drug_drug_qty")); // หน่วย
				drugBean.setLitres(rs.getString("treatment_drug_drug_qty")); // ค่าผลรวม

				drughopList.add(drugBean);
			}
			rs.close();
			/* dbc.closeConnection(); */
			return drughopList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}

	/// สิ้นสุด กราฟ pie ค่ายา

	/// กราฟแท่ง ค่ายา
	static public ArrayList<DrugBean> treatmentChar(String produc_month, String produc_year, String  ON) {

		DrugBean drugBean = new DrugBean();
		int limit = 0;
		ArrayList<DrugBean> drughopList = new ArrayList<DrugBean>();

		String sql = "SELECT treatment.`treatment_date` AS treatment_treatment_date,drug.`drug_name` AS drug_drug_name, drug.`drug_price`AS drug_drug_price, SUM(`drug_qty`)AS treatment_drug_drug_qty, SUM(`drug_sumprice`) AS drug_sumprice FROM `treatment` treatment INNER JOIN `treatment_drug` treatment_drug ON treatment.`id` = treatment_drug.`refer_treatment_id` INNER JOIN `drug` drug ON treatment_drug.`refer_drug_id` = drug.`id` WHERE treatment_month = ? AND treatment_year = ? GROUP BY `drug_drug_name` ORDER BY treatment_drug_drug_qty DESC ,drug_sumprice DESC LIMIT  "+limit+ ","+ON+";";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			int i = 1;
			preparedStmt.setString(i++, produc_month);
			System.out.println(produc_month);
			preparedStmt.setString(i++, produc_year);
			System.out.println(produc_year);

			rs = preparedStmt.executeQuery();

			while (rs.next()) {
				drugBean = new DrugBean();

				drugBean.setCountry(rs.getString("drug_drug_name")); // ชื่อ
				drugBean.setVisits(rs.getString("drug_sumprice")); // ราคารวม
				drugBean.setDrug_price(rs.getDouble("drug_drug_price")); // หน่วย
				drugBean.setDrug_unit(rs.getString("treatment_drug_drug_qty")); // ราคารวม
				drughopList.add(drugBean);
			}
			rs.close();
			/* dbc.closeConnection(); */
			return drughopList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error ===> " + e);
		} finally {
			try {
				dbc.closeConnection();
				preparedStmt.close();
			} catch (Exception e) {
				System.out.println("finally x=> " + e.getMessage());
			}
		}
		return null;
	}

	/// สิ้นสุด กราฟแท่ง ค่ายา

}
