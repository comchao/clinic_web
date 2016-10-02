package model;

public class PetsBean {
	private int id;
	private OwnersBean reference_owner_id;
	private String pet_name;
	private String pet_category;
	private String pet_gene;
	private String pet_gender;
	private String pet_weight;
	private String pet_birthday;
	private String pet_age;
	private String pet_extra;
	private String active_flag;
	private String date_nofi;
	private int emerStatus;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
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
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public String getPet_weight() {
		return pet_weight;
	}
	public void setPet_weight(String pet_weight) {
		this.pet_weight = pet_weight;
	}
	public String getPet_birthday() {
		return pet_birthday;
	}
	public void setPet_birthday(String pet_birthday) {
		this.pet_birthday = pet_birthday;
	}
	public String getPet_age() {
		return pet_age;
	}
	public void setPet_age(String pet_age) {
		this.pet_age = pet_age;
	}
	public String getPet_extra() {
		return pet_extra;
	}
	public void setPet_extra(String pet_extra) {
		this.pet_extra = pet_extra;
	}
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	public OwnersBean getReference_owner_id() {
		return reference_owner_id;
	}
	public void setReference_owner_id(OwnersBean reference_owner_id) {
		this.reference_owner_id = reference_owner_id;
	}
	public int getEmerStatus() {
		return emerStatus;
	}
	public void setEmerStatus(int emerStatus) {
		this.emerStatus = emerStatus;
	}
	public String getDate_nofi() {
		return date_nofi;
	}
	public void setDate_nofi(String date_nofi) {
		this.date_nofi = date_nofi;
	}
	
	
	
}
	
	