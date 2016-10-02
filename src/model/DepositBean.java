package model;

public class DepositBean {
	private int id;
	private PetsBean refer_pet_id;
	private OwnersBean refer_owner_id;
	private CageBean refer_cage_id;
	private String deposit_in;
	private String deposit_out;
	private String food_status;
	private double deposit_receive;
	private int deposit_day;
	private int deposit_status;
	private String deposit_date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public PetsBean getRefer_pet_id() {
		return refer_pet_id;
	}
	public void setRefer_pet_id(PetsBean refer_pet_id) {
		this.refer_pet_id = refer_pet_id;
	}
	public OwnersBean getRefer_owner_id() {
		return refer_owner_id;
	}
	public void setRefer_owner_id(OwnersBean refer_owner_id) {
		this.refer_owner_id = refer_owner_id;
	}
	public CageBean getRefer_cage_id() {
		return refer_cage_id;
	}
	public void setRefer_cage_id(CageBean refer_cage_id) {
		this.refer_cage_id = refer_cage_id;
	}
	public String getDeposit_in() {
		return deposit_in;
	}
	public void setDeposit_in(String deposit_in) {
		this.deposit_in = deposit_in;
	}
	public String getDeposit_out() {
		return deposit_out;
	}
	public void setDeposit_out(String deposit_out) {
		this.deposit_out = deposit_out;
	}
	
	public String getFood_status() {
		return food_status;
	}
	public void setFood_status(String food_status) {
		this.food_status = food_status;
	}
	
	public double getDeposit_receive() {
		return deposit_receive;
	}
	public void setDeposit_receive(double deposit_receive) {
		this.deposit_receive = deposit_receive;
	}
	public int getDeposit_day() {
		return deposit_day;
	}
	public void setDeposit_day(int deposit_day) {
		this.deposit_day = deposit_day;
	}
	public int getDeposit_status() {
		return deposit_status;
	}
	public void setDeposit_status(int deposit_status) {
		this.deposit_status = deposit_status;
	}
	public String getDeposit_date() {
		return deposit_date;
	}
	public void setDeposit_date(String deposit_date) {
		this.deposit_date = deposit_date;
	}
}
