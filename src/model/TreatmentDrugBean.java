package model;

public class TreatmentDrugBean {
	int id;
	private TreatmentBean refer_treatment_id;
	private DrugBean refer_drug_id;
	private int drug_qty;
	private double drug_sumprice;
	private String treatment_date;
	private String treatment_detail;
	private String note;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getDrug_qty() {
		return drug_qty;
	}
	public void setDrug_qty(int drug_qty) {
		this.drug_qty = drug_qty;
	}
	public double getDrug_sumprice() {
		return drug_sumprice;
	}
	public void setDrug_sumprice(double drug_sumprice) {
		this.drug_sumprice = drug_sumprice;
	}
	public TreatmentBean getRefer_treatment_id() {
		return refer_treatment_id;
	}
	public void setRefer_treatment_id(TreatmentBean refer_treatment_id) {
		this.refer_treatment_id = refer_treatment_id;
	}
	public DrugBean getRefer_drug_id() {
		return refer_drug_id;
	}
	public void setRefer_drug_id(DrugBean refer_drug_id) {
		this.refer_drug_id = refer_drug_id;
	}
	public String getTreatment_date() {
		return treatment_date;
	}
	public void setTreatment_date(String treatment_date) {
		this.treatment_date = treatment_date;
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
	
}
