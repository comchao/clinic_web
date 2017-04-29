package model;

public class ShopDetailBean {
	private int id;
	private DepositBean refer_petdeposit;
	private String prd_date;
	private String 	prd_name;
	private double prd_price;
	private int prd_qty;
	private double prd_total;
	private String total;
	private String produc_year; 
	private String produc_month;
	public String getProduc_month() {
		return produc_month;
	}
	public void setProduc_month(String produc_month) {
		this.produc_month = produc_month;
	}
	private String country;
	private String y;
	public String getVisits() {
		return visits;
	}
	public void setVisits(String visits) {
		this.visits = visits;
	}
	private String indexLabel;
	private String  label;
	private String  visits;
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getIndexLabel() {
		return indexLabel;
	}
	public void setIndexLabel(String indexLabel) {
		this.indexLabel = indexLabel;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getLitres() {
		return litres;
	}
	public void setLitres(String litres) {
		this.litres = litres;
	}
	private String litres;
	
	
	
	public String getProduc_year() {
		return produc_year;
	}
	public void setProduc_year(String produc_year) {
		this.produc_year = produc_year;
	}
	//กราฟ
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String value;
	private String name;
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public DepositBean getRefer_petdeposit() {
		return refer_petdeposit;
	}
	public void setRefer_petdeposit(DepositBean refer_petdeposit) {
		this.refer_petdeposit = refer_petdeposit;
	}
	public String getPrd_date() {
		return prd_date;
	}
	public void setPrd_date(String prd_date) {
		this.prd_date = prd_date;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public double getPrd_price() {
		return prd_price;
	}
	public void setPrd_price(double prd_price) {
		this.prd_price = prd_price;
	}
	public int getPrd_qty() {
		return prd_qty;
	}
	public void setPrd_qty(int prd_qty) {
		this.prd_qty = prd_qty;
	}
	public double getPrd_total() {
		return prd_total;
	}
	public void setPrd_total(double prd_total) {
		this.prd_total = prd_total;
	}
	
	

}
