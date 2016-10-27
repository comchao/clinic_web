package model;

public class SymptomsBean {
	
	int id_symptom;
	String  symptom;
	String disease;
	boolean valid;
	
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
