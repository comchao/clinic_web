package model;

public class TreatmentDetailBean {
	int id;
	TreatmentBean refer_treatment_id;
	String treatment_name;
	double treatment_price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTreatment_name() {
		return treatment_name;
	}
	public void setTreatment_name(String treatment_name) {
		this.treatment_name = treatment_name;
	}
	public double getTreatment_price() {
		return treatment_price;
	}
	public void setTreatment_price(double treatment_price) {
		this.treatment_price = treatment_price;
	}
	public TreatmentBean getRefer_treatment_id() {
		return refer_treatment_id;
	}
	public void setRefer_treatment_id(TreatmentBean refer_treatment_id) {
		this.refer_treatment_id = refer_treatment_id;
	}
	
}
