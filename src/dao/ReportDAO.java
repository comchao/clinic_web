package dao;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

public class ReportDAO {
	public static boolean printPetShop(String date_start, String date_end) {
		
		Connection connect = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
					"?user=root&password=");
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String report = null;
		try {
			File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\ShopReport.jrxml");
			report = dir.getAbsolutePath();
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			
			HashMap<String, Object> parameter = new HashMap<String, Object>();
			
			parameter.put("BeginDate",date_start); 
			parameter.put("EndDate",date_end); 
			
			// Report Viewer
			JasperReport ir = JasperCompileManager.compileReport(report);
			JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
			if(ip.getPages().isEmpty()){
				return false;
			}
			JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\ireport\\ShopReport.pdf");
			JasperViewer.viewReport(ip, false);
			return true;
			
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
public static boolean printDrug(String date_start, String date_end) {
		
		Connection connect = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
					"?user=root&password=");
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String report = null;
		try {
			File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\DrugReport.jrxml");
			report = dir.getAbsolutePath();
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			
			HashMap<String, Object> parameter = new HashMap<String, Object>();
			
			parameter.put("BeginDate",date_start); 
			parameter.put("EndDate",date_end); 
			
			// Report Viewer
			JasperReport ir = JasperCompileManager.compileReport(report);
			JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
			if(ip.getPages().isEmpty()){
				return false;
			}
			JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\ireport\\DrugReport.pdf");
			JasperViewer.viewReport(ip, false);
			return true;
			
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

public static boolean printTreatment(String date_start, String date_end) {
	
	
	System.out.println("มาเเล้วdate_start"+date_start);
	System.out.println("date_start"+date_end);
	Connection connect = null;
	
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
				"?user=root&password=");
		
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String report = null;
	try {
		File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\OrtheReport.jrxml");
		report = dir.getAbsolutePath();
		
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		parameter.put("BeginDate",date_start); 
		parameter.put("EndDate",date_end); 
		
		// Report Viewer
		JasperReport ir = JasperCompileManager.compileReport(report);
		JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
		if(ip.getPages().isEmpty()){
			return false;
		}
		JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\ireport\\OrtheReport.pdf");
		JasperViewer.viewReport(ip, false);
		return true;
		
	} catch (JRException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		connect.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return false;
}




public static boolean printDrugTreatment(String id,String name,String date_now) {
	
	Connection connect = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
				"?user=root&password=");
		
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String report = null;
	try {
		File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\BillTretment.jrxml");
		report = dir.getAbsolutePath();
		
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		parameter.put("id",id); 
		parameter.put("name",name); 
		parameter.put("date_now",date_now); 
		// Report Viewer
		JasperReport ir = JasperCompileManager.compileReport(report);
		JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
		if(ip.getPages().isEmpty()){
			return false;
		}
		JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\ireport\\BillTretment.pdf");
		JasperViewer.viewReport(ip, false);
		return true;
		
	} catch (JRException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		connect.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return false;
}
public static boolean printDepositBill(String deposit_id) {
	
	Connection connect = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
				"?user=root&password=");
		
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String report = null;
	try {
		File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\BillDeposit.jrxml");
		report = dir.getAbsolutePath();
		
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		parameter.put("id",deposit_id); 
		
		
		// Report Viewer
		JasperReport ir = JasperCompileManager.compileReport(report);
		JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
		if(ip.getPages().isEmpty()){
			return false;
		}
		JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\ireport\\BillDeposit.pdf");
		JasperViewer.viewReport(ip, false);
		return true;
		
	} catch (JRException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		connect.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return false;
}




//ใบรายงานการนัดหมาย
public static boolean Calendar( String id ,String date_start,String date_end) {
	
	Connection connect = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
				"?user=root&password=");
		
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String report = null;
	try {
		File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\CalendarReport.jrxml");
		report = dir.getAbsolutePath();
		
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		parameter.put("id",id); 
		parameter.put("date_start",date_start); 
		parameter.put("date_end",date_end); 
		
		
		// Report Viewer
		JasperReport ir = JasperCompileManager.compileReport(report);
		JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
		if(ip.getPages().isEmpty()){
			return false;
		}
		JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\ireport\\CalendarReport.pdf");
		JasperViewer.viewReport(ip, false);
		return true;
		
	} catch (JRException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		connect.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return false;
}

//สิ้นสุดใบรายงานการนัดหมาย




// ใบรายงานการวินิจฉัยโรคของสัตร์
public static boolean Disease (String id) {
	
	Connection connect = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
				"?user=root&password=");
		
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String report = null;
	try {
		File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\disease_percentage.jrxml");
		report = dir.getAbsolutePath();
		
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		/*parameter.put("id",id); */
		
		// Report Viewer
		JasperReport ir = JasperCompileManager.compileReport(report);
		JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
		if(ip.getPages().isEmpty()){
			return false;
		}
		JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\disease_percentage.pdf");
		JasperViewer.viewReport(ip, false);
		return true;
		
	} catch (JRException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		connect.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return false;
}

//สิ้นสุดใบรายงานการวินิจฉัยโรคของสัตร์




//ใบเสร็จรับเงิน
public static boolean BillPurchase (int id) {
	
	Connection connect = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/petshopdb" +
				"?user=root&password=");
		
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String report = null;
	try {
		File dir = new File("F:java_web\\clinic_web\\WebContent\\ireport\\BillPurchase _shop.jrxml");
		report = dir.getAbsolutePath();
		
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		/*parameter.put("id",id); */
		
		// Report Viewer
		JasperReport ir = JasperCompileManager.compileReport(report);
		JasperPrint ip = JasperFillManager.fillReport(ir, parameter,connect);
		if(ip.getPages().isEmpty()){
			return false;
		}
		JasperExportManager.exportReportToPdfFile(ip,"F:java_web\\clinic_web\\WebContent\\BillPurchase _shop.jrxml.pdf");
		JasperViewer.viewReport(ip, false);
		return true;
		
	} catch (JRException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		connect.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return false;
}

//สิ้นสุดใบเสร็จรับเงิน
































}
