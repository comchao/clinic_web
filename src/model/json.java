package model;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class json implements JSONAware {

	private float  litres;
	private String country;
	public json (String litres,String country){
	
		
		this.litres = Float.parseFloat(litres);
		
		this.country = country;
		
		
		
	}
	
	@Override
	public String toJSONString(){
	    JSONObject obj = new JSONObject();
	    
	    obj.put("litres", litres);
	    obj.put("country", country);
	    
	   
	   
	    return obj.toString();
	  }
}
