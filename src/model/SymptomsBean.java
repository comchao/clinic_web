package model;

public class SymptomsBean {
	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	int id_symptom;
	String  symptom;
	String disease;
	boolean valid;
	String Symptom_Type;
	
	public String getSymptom_Type() {
		return Symptom_Type;
	}
	public void setSymptom_Type(String symptom_Type) {
		Symptom_Type = symptom_Type;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getId_symptom() {
		return id_symptom;
	}
	public void setId_symptom(int id_symptom) {
		this.id_symptom = id_symptom;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

}
