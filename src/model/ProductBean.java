package model;

public class ProductBean {
	private int id;
	private String product_code;
	private String product_name;
	private String product_detail;
	private Double product_price;
	private String product_unit;
	private int refer_type_pet;
	private String product_img_name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public Double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}
	public String getProduct_unit() {
		return product_unit;
	}
	public void setProduct_unit(String product_unit) {
		this.product_unit = product_unit;
	}
	
	public int getRefer_type_pet() {
		return refer_type_pet;
	}
	public void setRefer_type_pet(int refer_type_pet) {
		this.refer_type_pet = refer_type_pet;
	}
	public String getProduct_img_name() {
		return product_img_name;
	}
	public void setProduct_img_name(String product_img_name) {
		this.product_img_name = product_img_name;
	}
	
	

}
