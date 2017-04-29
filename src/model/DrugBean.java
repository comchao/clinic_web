package model;

public class DrugBean {
	private int id;
	private String drug_code;
	private String drug_type;
	private String 	drug_name;
	private String 	drug_detail;
	private double drug_price;
	private String 	drug_unit;
	private double drug_sumprice;
	private String litres  ;
	private String country ;
	
	private String  visits;
	
	public String getVisits() {
		return visits;
	}
	public void setVisits(String visits) {
		this.visits = visits;
	}
	public String getLitres() {
		return litres;
	}
	public void setLitres(String litres) {
		this.litres = litres;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public double getDrug_sumprice() {
		return drug_sumprice;
	}
	public void setDrug_sumprice(double drug_sumprice) {
		this.drug_sumprice = drug_sumprice;
	}
	private String 	detail;
	private String note;
	
	
	public String getDrug_type() {
		return drug_type;
	}
	public void setDrug_type(String drug_type) {
		this.drug_type = drug_type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDrug_code() {
		return drug_code;
	}
	public void setDrug_code(String drug_code) {
		this.drug_code = drug_code;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public String getDrug_detail() {
		return drug_detail;
	}
	public void setDrug_detail(String drug_detail) {
		this.drug_detail = drug_detail;
	}
	public double getDrug_price() {
		return drug_price;
	}
	public void setDrug_price(double drug_price) {
		this.drug_price = drug_price;
	}
	public String getDrug_unit() {
		return drug_unit;
	}
	public void setDrug_unit(String drug_unit) {
		this.drug_unit = drug_unit;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
}
