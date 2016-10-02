package db;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectDB {

	private Connection conn = null;

	public Connection createDBConnect() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/petshopdb"
					+ "?characterEncoding=utf-8&useUnicode=true","root", "");
			return conn;	
		} catch (ClassNotFoundException e) {
			return conn;
		}
	}

	public void closeConnection() {
		try {
			conn.close();
		} catch (SQLException e) {
			Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null,e);
		}
	}


	
}
