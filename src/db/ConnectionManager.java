package db;
import java.sql.*;
import java.util.*;

public class ConnectionManager {
	
	static Connection con;
	static String url;
	
	public static Connection getConnection() {
	try {
	String url = "jdbc:mysql://localhost/petshopdb?characterEncoding=utf-8&useUnicode=true";
	Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection(url, "root","");
		
	}
	catch (SQLException ex) {
		ex.printStackTrace();
	}
	
	catch (ClassNotFoundException e) {
		System.out.println(e);
	}
	return con;
	}
	
}
