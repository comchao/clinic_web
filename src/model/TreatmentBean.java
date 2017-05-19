package model;

public class TreatmentBean {
	int id;
	PetsBean refer_pet_id;
	String treatment_date;
	String vet_name;
	String treatment_detail;
	
	String 	note;
	String 	treatment_month;
	String treatment_year;
	String No_Bil;
	public String getNo_Bil() {
		return No_Bil;
	}
	public void setNo_Bil(String no_Bil) {
		No_Bil = no_Bil;
	}
	public int getId() {
		return id;
	}
	public String getTreatment_month() {
		return treatment_month;
	}
	public void setTreatment_month(String treatment_month) {
		this.treatment_month = treatment_month;
	}
	public String getTreatment_year() {
		return treatment_year;
	}
	public void setTreatment_year(String treatment_year) {
		this.treatment_year = treatment_year;
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
