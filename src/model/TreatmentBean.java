package model;

public class TreatmentBean {
	int id;
	PetsBean refer_pet_id;
	String treatment_date;
	String vet_name;
	String treatment_detail;
	String 	note;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTreatment_date() {
		return treatment_date;
	}
	public void setTreatment_date(String treatment_date) {
		this.treatment_date = treatment_date;
	}
	public String getVet_name() {
		return vet_name;
	}
	public void setVet_name(String vet_name) {
		this.vet_name = vet_name;
	}
	public String getTreatment_detail() {
		return treatment_detail;
	}
	public void setTreatment_detail(String treatment_detail) {
		this.treatment_detail = treatment_detail;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public PetsBean getRefer_pet_id() {
		return refer_pet_id;
	}
	public void setRefer_pet_id(PetsBean refer_pet_id) {
		this.refer_pet_id = refer_pet_id;
	}

}
