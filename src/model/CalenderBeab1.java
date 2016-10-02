package model;
public class CalenderBeab1 {
	private int id;
	private int id_calendar;
	private String title;
	private String date;
	boolean valid;
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_calendar() {
		return id_calendar;
	}
	public void setId_calendar(int id_calendar) {
		this.id_calendar = id_calendar;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
