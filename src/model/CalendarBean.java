package model;

public class CalendarBean {
	private int id;

	private String owners_name ;
	private String owners_lname ;
	private String pet_name   ;
	private String mem_position  ;
	private String mem_name  ;
	private String  pet_category ;
	private String pet_gene;
	private String mem_lname;

	public String getMem_lname() {
		return mem_lname;
	}
	public void setMem_lname(String mem_lname) {
		this.mem_lname = mem_lname;
	}
	private String date_time;
	

	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public String getPet_category() {
		return pet_category;
	}
	public void setPet_category(String pet_category) {
		this.pet_category = pet_category;
	}
	public String getPet_gene() {
		return pet_gene;
	}
	public void setPet_gene(String pet_gene) {
		this.pet_gene = pet_gene;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getOwners_name() {
		return owners_name;
	}
	public void setOwners_name(String owners_name) {
		this.owners_name = owners_name;
	}
	public String getOwners_lname() {
		return owners_lname;
	}
	public void setOwners_lname(String owners_lname) {
		this.owners_lname = owners_lname;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getMem_position() {
		return mem_position;
	}
	public void setMem_position(String mem_position) {
		this.mem_position = mem_position;
	}
	public int getId_ownerdata() {
		return id_ownerdata;
	}
	public void setId_ownerdata(int id_ownerdata) {
		this.id_ownerdata = id_ownerdata;
	}
	private int id_ownerdata ;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private int id_calendar;
	private String title;
	private String url;
	private String date;
	private String Status;
	private int id_auto ;
	public int getId_auto() {
		return id_auto;
	}
	public void setId_auto(int id_auto) {
		this.id_auto = id_auto;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	

}
