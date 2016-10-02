package net.calendar.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import db.ConnectionManager;


public class CalDAO {
	private Connection getConnection() throws Exception{
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/petshopdb");
		con=ds.getConnection();
		return con;
		
		
	}
	
	static Connection dbconConnection = null; 
	ResultSet rs = null;					
	static PreparedStatement preparedStmt;  
	public int insertCal(CalBean calbean){
		PreparedStatement pstmt=null;
		String sql="";
		Connection con=null;
		int check=0;
		
		try{
			con=getConnection();
			sql="insert into plan(id,title,url,date) values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, calbean.getId());
			pstmt.setString(2, calbean.getTitle());
			pstmt.setString(3, calbean.getUrl());
			pstmt.setString(4, calbean.getDate());
			pstmt.executeUpdate();
			check=1;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return check;
	}
	
	public List<CalBean> getCal(){
		List<CalBean> calList = new ArrayList<CalBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			con=getConnection();
			sql="select * from plan  ";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				CalBean calbean = new CalBean();
			
				calbean.setId(rs.getString("id"));
				calbean.setTitle(rs.getString("title"));
				calbean.setUrl(rs.getString("url"));
				calbean.setDate(rs.getString("date"));
				
				calList.add(calbean);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (rs != null)	try {rs.close();} catch (SQLException ex) {	}
			if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)try {con.close();} catch (SQLException ex) {}
		}
		
		return calList;
	}
	
	public ArrayList<CalBean> selectId(int id){
		ArrayList<CalBean> List = new ArrayList <CalBean>();
		String  selectSQL = "select*from calendar where id = ?";
		try{
			dbconConnection = ConnectionManager.getConnection();
			preparedStmt = dbconConnection.prepareStatement(selectSQL);
			preparedStmt.setInt(1,id);
			rs = preparedStmt.executeQuery();
			CalBean  calbean;
			while(rs.next()){
				calbean = new CalBean();
			
				calbean.setId(rs.getString("id"));
				calbean.setTitle(rs.getString("title"));
				calbean.setUrl(rs.getString("url"));
				calbean.setDate(rs.getString("date"));
				List.add(calbean);
				
			}
			preparedStmt.close();
			rs.close(); 
			dbconConnection.close(); 
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return List	;	
		}	
	
	
	
	
	
	
	
	
	

	public int deleteCal(String date) {
		int check=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		System.out.println(date);
		try{
			con=getConnection();
			sql="select * from plan where date=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, date);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sql="delete from plan where date=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, date);
				pstmt.executeUpdate();
				
				check=1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (rs != null)	try {rs.close();} catch (SQLException ex) {	}
			if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)try {con.close();} catch (SQLException ex) {}
		}
		
		return check;
	}

	public ArrayList<CalBean> getAllProduct() {
		ArrayList<CalBean> list = new ArrayList<CalBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			con=getConnection();
			sql="select * from plan";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				CalBean calbean = new CalBean();
				calbean.setId(rs.getString("id"));
				calbean.setTitle(rs.getString("title"));
				calbean.setUrl(rs.getString("url"));
				calbean.setDate(rs.getString("date"));
				
				list.add(calbean);
				
				System.out.println();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (rs != null)	try {rs.close();} catch (SQLException ex) {	}
			if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)try {con.close();} catch (SQLException ex) {}
		}
		
		return list;
	}}