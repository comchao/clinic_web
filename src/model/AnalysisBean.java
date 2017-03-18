package model;

public class AnalysisBean {
	int id;
	int id_disease;
	String disease;
	int id_pet;
	int id_member;
	public int getId_pet() {
		return id_pet;
	}
	public void setId_pet(int id_pet) {
		this.id_pet = id_pet;
	}
	public int getId_member() {
		return id_member;
	}
	public void setId_member(int id_member) {
		this.id_member = id_member;
	}
	float Total1;
	String  percentage;
	float SumPercentage;
	public float getSumPercentage() {
		return SumPercentage;
	}
	public void setSumPercentage(float sumPercentage) {
		SumPercentage = sumPercentage;
	}
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	public float getTotal1() {
		return Total1;
	}
	public void setTotal1(float total1) {
		Total1 = total1;
	}
	Float Total;
	Float  Totalcolum;
	Float Totalvalue ;
	 Float sum;
	public Float getSum() {
		return sum;
	}
	public void setSum(Float sum) {
		this.sum = sum;
	}
	public Float getTotalvalue() {
		return Totalvalue;
	}
	public void setTotalvalue(Float totalvalue) {
		Totalvalue = totalvalue;
	
	}
	public Float getTotalcolum() {
		return Totalcolum;
	}
	public void setTotalcolum(Float totalcolum) {
		Totalcolum = totalcolum;
	}
	public Float getTotal() {
		return Total;
	}
	public void setTotal(Float total) {
		Total = total;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
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
	
	
	String symptom;
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
}
