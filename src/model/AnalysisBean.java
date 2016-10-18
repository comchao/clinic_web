package model;

public class AnalysisBean {
	int id;
	int id_disease;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_disease() {
		return id_disease;
	}
	public void setId_disease(int id_disease) {
		this.id_disease = id_disease;
	}
	public int getId_symptom() {
		return id_symptom;
	}
	public void setId_symptom(int id_symptom) {
		this.id_symptom = id_symptom;
	}
	public float getValue() {
		return value;
	}
	public void setValue(float value) {
		this.value = value;
	}
	int id_symptom;
	float value;
	boolean valid;
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
}
