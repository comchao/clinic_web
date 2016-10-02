package model;

public class ShopDetailBean {
	private int id;
	private DepositBean refer_petdeposit;
	private String prd_date;
	private String 	prd_name;
	private double prd_price;
	private int prd_qty;
	private double prd_total;
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
