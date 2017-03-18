package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.ConnectDB;
import db.ConnectionManager;
import model.AnalysisBean;
import model.DiseaseBean;
import model.DrugBean;
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

	// เรียกข้อมูลอาการโรค
	static public ArrayList<SymptomsBean> getdisease() {

		SymptomsBean disease = new SymptomsBean();
		ArrayList<SymptomsBean> diseaseList = new ArrayList<SymptomsBean>();

		String sql = "select  DISTINCT symptom from symptoms_disease order by symptom; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new SymptomsBean();

				/*
				 * disease.setId_symptom(rs.getInt("id_symptom")); //ID อาการโรค
				 */ disease.setSymptom(rs.getString("symptom")); // อาการโรค
				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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

	// เรียกข้อมูลอาการโรคsymptom
	static public ArrayList<SymptomsBean> symptom() {

		SymptomsBean disease = new SymptomsBean();
		ArrayList<SymptomsBean> diseaseList = new ArrayList<SymptomsBean>();

		String sql = "select  * from symptoms_disease order by symptom; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new SymptomsBean();

				disease.setId_symptom(rs.getInt("id_symptom")); // ID อาการโรค
				disease.setSymptom(rs.getString("symptom")); // อาการโรค
				disease.setDisease(rs.getString("disease")); // อาการโรค

				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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

	public static boolean insertDisease(AnalysisBean disease) {
		String insertSQL = "insert into analysis_disease(symptom,disease,value)" + " values(?,?,?); ";
		System.out.println("Query: " + insertSQL);
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);

			preparedStmt.setString(1, disease.getSymptom());
			preparedStmt.setString(2, disease.getDisease());
			preparedStmt.setFloat(3, disease.getValue());

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

	public ArrayList<AnalysisBean> symptom(String symptom) {
		ArrayList<AnalysisBean> List = new ArrayList<AnalysisBean>();
		String SELECT = "SELECT * FROM symptoms_disease,disease WHERE symptoms_disease.disease  = disease.disease  and symptoms_disease.symptom=? order by symptom";

		try {
			dbconConnection = ConnectionManager.getConnection();
			preparedStmt = dbconConnection.prepareStatement(SELECT);
			preparedStmt.setString(1, symptom);
			rs = preparedStmt.executeQuery();
			AnalysisBean diseaseList;
			while (rs.next()) {
				diseaseList = new AnalysisBean();
				/*
				 * diseaseList.setId_symptom(rs.getInt("id_symptom")); // *1
				 */ /*
					 * System.out.println("id_symptom1:=" +
					 * diseaseList.getId_symptom());
					 */
				diseaseList.setSymptom(rs.getString("symptom")); // *2
				System.out.println(rs.getString("symptom"));
				/*
				 * System.out.println("symptom2:=" + diseaseList.getSymptom());
				 */
				diseaseList.setDisease(rs.getString("disease")); // *3
				System.out.println(rs.getString("disease"));
				/*
				 * System.out.println("disease:=" + diseaseList.getDisease());
				 */

				List.add(diseaseList);
			}
			preparedStmt.close();
			rs.close(); // ปิดการทำงาน rs
			dbconConnection.close(); // ปิดการทำงาน dbconConnection

		} catch (Exception e) {
			e.printStackTrace(); // เเสดงค่าภาษา SQL ที่เกิดของผิดพลาด
		}
		return List;
	}

	public ArrayList<AnalysisBean> search(String symptom) {
		ArrayList<AnalysisBean> List = new ArrayList<AnalysisBean>();
		String SELECT = "SELECT * FROM symptoms_disease WHERE disease = ? order by symptom;";

		try {
			dbconConnection = ConnectionManager.getConnection();
			preparedStmt = dbconConnection.prepareStatement(SELECT);
			preparedStmt.setString(1, symptom);
			rs = preparedStmt.executeQuery();
			AnalysisBean diseaseList;
			while (rs.next()) {
				diseaseList = new AnalysisBean();

				diseaseList.setSymptom(rs.getString("symptom")); // *1
				System.out.println(rs.getString("symptom"));
				diseaseList.setDisease(rs.getString("disease")); // *2
				System.out.println(rs.getString("disease"));
				diseaseList.setId_symptom(rs.getInt("id_symptom")); // *2

				List.add(diseaseList);
			}
			preparedStmt.close();
			rs.close(); // ปิดการทำงาน rs
			dbconConnection.close(); // ปิดการทำงาน dbconConnection

		} catch (Exception e) {
			e.printStackTrace(); // เเสดงค่าภาษา SQL ที่เกิดของผิดพลาด
		}
		return List;
	}

	// Clear Data analysis_disease
	public boolean ClearData(AnalysisBean id) {

		String sql = " delete from analysis_disease where id = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, id.getId());

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
	
	

	// GET DATA Analysis

	static public ArrayList<AnalysisBean> Analysis() {

		AnalysisBean Analysis = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList = new ArrayList<AnalysisBean>();

		String sql = "SELECT * FROM analysis_disease ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				Analysis = new AnalysisBean();

				Analysis.setId(rs.getInt("id")); // id
				Analysis.setSymptom(rs.getString("symptom")); // อาการโรค
				Analysis.setDisease(rs.getString("disease")); // โรค
				Analysis.setValue(rs.getFloat("value")); // value
				Analysis.setSum(rs.getFloat("sum")); // sum

				diseaseList.add(Analysis);
			}
			rs.close();
			return diseaseList;
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

	static public ArrayList<AnalysisBean> getAnalysisBean() {

		AnalysisBean disease = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList = new ArrayList<AnalysisBean>();

		String sql = "SELECT symptom,value, SUM(value) AS Total FROM analysis_disease GROUP BY symptom; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new AnalysisBean();

				disease.setSymptom(rs.getString("symptom")); // อาการโรค
				disease.setValue(rs.getFloat("value")); // อาการโรค
				disease.setTotal(rs.getFloat("Total")); // อาการโรค

				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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

	static public ArrayList<AnalysisBean> getvaluecolum() {

		AnalysisBean disease = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList = new ArrayList<AnalysisBean>();

		String sql = "SELECT symptom, SUM(`value`) AS Totalvalue ,SUM(`valuecolum`) AS  Totalcolum FROM analysis_disease GROUP BY symptom; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new AnalysisBean();

				disease.setSymptom(rs.getString("symptom")); // อาการโรค
				disease.setTotalcolum(rs.getFloat("Totalcolum"));
				disease.setTotalvalue(rs.getFloat("Totalvalue"));

				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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

	static public ArrayList<AnalysisBean> disease() {

		AnalysisBean disease = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList = new ArrayList<AnalysisBean>();

		String sql = "SELECT * FROM disease order by disease; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new AnalysisBean();

				disease.setDisease(rs.getString("disease")); // โรค

				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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

	public static boolean insertDisease1(DiseaseBean disease) {
		String insertSQL = "insert into disease(disease)" + " values(?); ";
		System.out.println("Query: " + insertSQL);
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);
			preparedStmt.setString(1, disease.getDisease());
			System.out.println("diseaseDAO" + disease.getDisease());

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

	public static boolean insertSymptomsBean(SymptomsBean disease) {
		String insertSQL = "insert into symptoms_disease(symptom,disease)" + " values(?,?); ";
		System.out.println("Query: " + insertSQL);
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);
			preparedStmt.setString(1, disease.getSymptom());
			preparedStmt.setString(2, disease.getDisease());
			System.out.println("DiseaseDAO2" + disease.getSymptom());
			System.out.println("SymptomDAO2" + disease.getDisease());
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
	// ผลโรค

	static public ArrayList<AnalysisBean> getAnalysis() {

		AnalysisBean disease = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList = new ArrayList<AnalysisBean>();

		String sql = "SELECT e.disease,SUM(e.sum) AS total ,e1.maxDisease FROM analysis_disease e JOIN (SELECT disease, SUM(sum) AS maxDisease "
				+ "FROM analysis_disease GROUP BY disease ORDER BY maxDisease DESC LIMIT 1) e1 GROUP BY e.disease HAVING total= e1.maxDisease; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new AnalysisBean();

				disease.setDisease(rs.getString("disease"));
				disease.setTotal(rs.getFloat("maxDisease"));
				

				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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

	// percentage disease 100%

	static public ArrayList<AnalysisBean> getpercentage() {

		AnalysisBean disease = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList = new ArrayList<AnalysisBean>();

		String sql = "SELECT disease , SUM(sum) AS percentage  FROM `analysis_disease` GROUP BY disease ORDER BY percentage DESC ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new AnalysisBean();

				disease.setDisease(rs.getString("disease"));
				disease.setPercentage(rs.getString("percentage"));

				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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
	
	static public ArrayList<AnalysisBean> getsumpercentage() {

		AnalysisBean disease = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList = new ArrayList<AnalysisBean>();

		String sql = "SELECT disease , SUM(sum) AS percentage FROM `analysis_disease` GROUP BY disease; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new AnalysisBean();

				disease.setDisease(rs.getString("disease"));
				disease.setPercentage(rs.getString("percentage"));
				System.out.println("maxDisease" + rs.getFloat("maxDisease"));
				

				diseaseList.add(disease);
			}
			rs.close();
			return diseaseList;
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
	
	
	static public ArrayList<AnalysisBean> getpercentagetotal() {

		AnalysisBean disease = new AnalysisBean();
		ArrayList<AnalysisBean> diseaseList5 = new ArrayList<AnalysisBean>();

		String sql = "SELECT SUM(sum)as total FROM `analysis_disease` ; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			rs = preparedStmt.executeQuery();
			// dbc.closeConnection();

			while (rs.next()) {
				disease = new AnalysisBean();

				disease.setTotal(rs.getFloat("total"));
				

				diseaseList5.add(disease);
			}
			rs.close();
			return diseaseList5;
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
	
	
	
	
	
	
	
	
	

	// insertdisease_percentage
	
	public static boolean insertdisease_percentage(AnalysisBean disease) {
		String insertSQL = "insert into disease_percentage(id , disease,SumPercentage ,sum)" + " values(?,? ,? ,?); ";

		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);
			preparedStmt.setInt(1, disease.getId());
			preparedStmt.setString(2, disease.getDisease());
			preparedStmt.setFloat(3, disease.getSumPercentage());
			preparedStmt.setString(4, disease.getPercentage());
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
	// สิ้นสุด insertdisease_percentage
	
	public static boolean insertanalysisdisease(AnalysisBean disease) {
		String insertSQL = "insert into analysisdisease(disease,SumPercentage ,sum,id_pet,id_member)" + " values(?,? ,? ,?,?); ";

		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);
			preparedStmt.setString(1, disease.getDisease());
			preparedStmt.setFloat(2, disease.getSumPercentage());
			preparedStmt.setString(3, disease.getPercentage());
			preparedStmt.setInt(4, disease.getId_pet());
			preparedStmt.setInt(5, disease.getId_member());
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
	// สิ้นสุด insertdisease_percentage
	
	public static boolean insertanalysisdisease_report(AnalysisBean disease) {
		String insertSQL = "insert into analysisdisease_report(id,disease,SumPercentage ,sum,id_pet,id_member)" + " values(?,?,? ,? ,?,?); ";

		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(insertSQL);
			preparedStmt.setInt(1, disease.getId());
			preparedStmt.setString(2, disease.getDisease());
			preparedStmt.setFloat(3, disease.getSumPercentage());
			preparedStmt.setString(4, disease.getPercentage());
			preparedStmt.setInt(5, disease.getId_pet());
			preparedStmt.setInt(6, disease.getId_member());
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
	// สิ้นสุด insertdisease_percentage
	
	
	public boolean updateSum(AnalysisBean disease) {

		String sql = "update analysis_disease set sum = ? where symptom = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setFloat(1, disease.getSum());
			preparedStmt.setString(2, disease.getSymptom());

			System.out.println("SumDAO" + disease.getSum());
			System.out.println("SymptomDAO" + disease.getSymptom());

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

	// แก้ไขข้อมุลโรคและอาการโรค
	public boolean updateanalysis_disease(AnalysisBean disease) {

		String sql = "update symptoms_disease set symptom = ? , disease = ? where id_symptom = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, disease.getSymptom());
			preparedStmt.setString(2, disease.getDisease());
			preparedStmt.setInt(3, disease.getId_symptom());

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

	public boolean Deletesymptoms_disease(AnalysisBean id) {

		String sql = " delete from symptoms_disease where id_symptom = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, id.getId_symptom());

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
	
	// delete Data disease_percentage
		public boolean ClearDataDisease_percentage (AnalysisBean id) {

			String sql = " delete from disease_percentage where id = ?; ";
			try {

				preparedStmt = dbc.createDBConnect().prepareStatement(sql);

				preparedStmt.setInt(1, id.getId());

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
		// delete Data disease_percentage
		
		
		// delete Data disease_percentage
		public boolean ClearDataAnalysisdisease_report(AnalysisBean id) {

			String sql = " delete from analysisdisease_report where id = ?; ";
			try {

				preparedStmt = dbc.createDBConnect().prepareStatement(sql);

				preparedStmt.setInt(1, id.getId());

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
		// delete Data disease_percentage
		
		
		
		
		
		
		
		
	
		//SELECT  delete  disease_percentage data sql  
		static public ArrayList<AnalysisBean> getdisease_percentage() {
			AnalysisBean disease = new AnalysisBean();
			ArrayList<AnalysisBean> disease_percentageList = new ArrayList<AnalysisBean>();

			String sql = "SELECT * FROM disease_percentage ; ";
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				rs = preparedStmt.executeQuery();
				// dbc.closeConnection();
				while (rs.next()) {
					disease = new AnalysisBean();
					disease.setId(rs.getInt("id"));
					System.out.println(rs.getInt("id"));
					
					disease.setDisease(rs.getString("disease"));
					System.out.println(rs.getString("disease"));
					
					disease.setSumPercentage(rs.getInt("SumPercentage"));
					System.out.println(rs.getInt("SumPercentage"));
					
					disease.setSum(rs.getFloat("sum"));
					System.out.println(rs.getFloat("sum"));
					disease_percentageList.add(disease);
				}
				rs.close();
				return disease_percentageList;
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
            //SELECT  delete  disease_percentage data sql  
		
		static public ArrayList<AnalysisBean> getdisease_percentage_report() {
			AnalysisBean disease = new AnalysisBean();
			ArrayList<AnalysisBean> disease_percentageList = new ArrayList<AnalysisBean>();

			String sql = "SELECT * FROM analysisdisease_report ; ";
			try {
				preparedStmt = dbc.createDBConnect().prepareStatement(sql);
				rs = preparedStmt.executeQuery();
				// dbc.closeConnection();
				while (rs.next()) {
					disease = new AnalysisBean();
					disease.setId(rs.getInt("id"));
					System.out.println(rs.getInt("id"));
					disease_percentageList.add(disease);
				}
				rs.close();
				return disease_percentageList;
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
            //SELECT  delete  disease_percentage data sql  
		
		
	
	
	
	
	
	

}
