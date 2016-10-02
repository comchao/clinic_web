package model;

public class DepositShopBean {
	private int id;
	private String deposit_fooddate;
	private ProductBean product_id;
	private int deposit_foodqty;
	private double deposit_foodtotal;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeposit_fooddate() {
		return deposit_fooddate;
	}
	public void setDeposit_fooddate(String deposit_fooddate) {
		this.deposit_fooddate = deposit_fooddate;
	}
	public ProductBean getProduct_id() {
		return product_id;
	}
	public void setProduct_id(ProductBean product_id) {
		this.product_id = product_id;
	}
	public int getDeposit_foodqty() {
		return deposit_foodqty;
	}
	public void setDeposit_foodqty(int deposit_foodqty) {
		this.deposit_foodqty = deposit_foodqty;
	}
	public double getDeposit_foodtotal() {
		return deposit_foodtotal;
	}
	public void setDeposit_foodtotal(double deposit_foodtotal) {
		this.deposit_foodtotal = deposit_foodtotal;
	}
	
	

}
