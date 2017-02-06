package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.ConnectDB;
import db.ConnectionManager;
import model.CalendarBean;
import model.CalenderBeab1;
import model.CalBean;

public class CalendarDAO {
	static ConnectDB dbc = new ConnectDB();
	static ResultSet rs = null;
	static PreparedStatement preparedStmt;
	Connection con = null;
	
	PreparedStatement pstm = null;
	static Connection dbconConnection = null;
	static PreparedStatement pre = null;

	static PreparedStatement pstmtt = null;

	
	
	public ArrayList<CalendarBean> selectId(int id) {

		ArrayList<CalendarBean> list = new ArrayList<CalendarBean>();

		String sql = "SELECT * FROM calendar WHERE id= ? order by date DESC ";

		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setInt(1, id);
			
			rs = preparedStmt.executeQuery();
			CalendarBean selectId;
			while (rs.next()) {
				
				selectId = new CalendarBean();
				selectId.setId(rs.getInt("id"));
				selectId.setId_auto(rs.getInt("id_auto"));
				selectId.setId_calendar(rs.getString("id_calendar"));
				selectId.setTitle(rs.getString("title"));
				selectId.setDate(rs.getString("date"));
				selectId.setStatus(rs.getString("Status"));
				selectId.setUrl(rs.getString("url"));
				
				
			
				list.add(selectId);

			}
			rs.close();
			preparedStmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public ArrayList<CalBean> selectIdCalendar(int id){
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
	
	public static CalenderBeab1 insert(CalenderBeab1 bean) {

		String insertSQL = "insert into calendar (id,id_calendar,title,date)" + "values(?,?,?,?);";
		try {
			dbconConnection = ConnectionManager.getConnection();
			pre = dbconConnection.prepareStatement(insertSQL);

			pre.setInt(1, bean.getId());
			pre.setInt(2, bean.getId_calendar());
			pre.setString(3, bean.getTitle());
			pre.setString(4, bean.getDate());

			int check = pre.executeUpdate();
			if (check == 1) {
				bean.setValid(true);
			} else {
				bean.setValid(false);
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			bean.setValid(false);
		} finally {
			try {
			} catch (Exception e) {

				System.out.println("finally => " + e.getMessage());
			}
		}
		return bean;
	}
	public ArrayList<CalendarBean> searchdate(String date) {

		ArrayList<CalendarBean> list = new ArrayList<CalendarBean>();

		String sql = "SELECT * FROM calendar WHERE date = ? ";

		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, date);
			
			rs = preparedStmt.executeQuery();
			CalendarBean searchdatelist;
			while (rs.next()) {
				
				searchdatelist = new CalendarBean();
				searchdatelist.setId(rs.getInt("id"));
				searchdatelist.setId_calendar(rs.getString("id_calendar"));
				searchdatelist.setTitle(rs.getString("title"));
				
				searchdatelist.setDate(rs.getString("date"));
				searchdatelist.setStatus(rs.getString("Status"));
				
				
			
				list.add(searchdatelist);

			}
			rs.close();
			preparedStmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	
                       //UpdateCalendar 
	public boolean updateCalendar(CalendarBean Calendar) {

		String sql = "update calendar set title = ? , date = ? where id_auto = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setString(1, Calendar.getTitle());
			preparedStmt.setString(2, Calendar.getDate());
			preparedStmt.setInt(3, Calendar.getId_auto());
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
	                   //สิ้นสุดการUpdateCalendar
	   
	
	
	
	                  //deleteCalendar
	public boolean deleteCalendar(CalendarBean id) {

		String sql = " delete  FROM  calendar  WHERE id_auto = ?; ";
		try {

			preparedStmt = dbc.createDBConnect().prepareStatement(sql);

			preparedStmt.setInt(1, id.getId_auto());

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
	}               //สิ้นสุดการ DeleteCalendar

	
	
	                 //ส่วนของค้นหาข้อมูลการนัดหมาย
		public ArrayList<CalendarBean>  searchCalender(String dateCalender) {

		CalendarBean calendarBean = new CalendarBean();
		ArrayList<CalendarBean> CalendarList = new ArrayList<CalendarBean>();

		String sql = "select * from calendar where date LIKE ?; ";
		try {
			preparedStmt = dbc.createDBConnect().prepareStatement(sql);
			preparedStmt.setString(1, "%"+dateCalender+"%");
		
			rs = preparedStmt.executeQuery();
			
			// dbc.closeConnection();

			while (rs.next()) {
				calendarBean = new CalendarBean();

				calendarBean.setId(rs.getInt("id"));
				calendarBean.setId_calendar(rs.getString("id_calendar"));
				calendarBean.setTitle(rs.getString("title"));
				calendarBean.setDate(rs.getString("date"));
				calendarBean.setStatus(rs.getString("Status"));
				
				CalendarList.add(calendarBean);
			}
			rs.close();
			return CalendarList;
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
		            //สิ้นสุดส่วนของค้นหาข้อมูลการนัดหมาย
}

