package model;

public class CageBean {
	private int id;
	private int	refer_cage_size;
	private String cage_name;
	private Double cage_price;
	private int cage_status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRefer_cage_size() {
		return refer_cage_size;
	}
	public void setRefer_cage_size(int refer_cage_size) {
		this.refer_cage_size = refer_cage_size;
	}
	public String getCage_name() {
		return cage_name;
	}
	public void setCage_name(String cage_name) {
		this.cage_name = cage_name;
	}
	public Double getCage_price() {
		return cage_price;
	}
	public void setCage_price(Double cage_price) {
		this.cage_price = cage_price;
	}
	public int getCage_status() {
		return cage_status;
	}
	public void setCage_status(int cage_status) {
		this.cage_status = cage_status;
	}
	
	
}
