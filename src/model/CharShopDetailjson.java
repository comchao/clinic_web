package model;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class CharShopDetailjson implements JSONAware {
	private String country;
	private float  visits;
	
	
	public CharShopDetailjson ( String country ,String visits ){
	
		this.country = country;
		
		this.visits = Float.parseFloat(visits);
		
		
		
		
		
	}
	
	@Override
	public String toJSONString(){
	    JSONObject obj = new JSONObject();
	    
	    
	    obj.put("country", country);
	  
	    obj.put("visits", visits);
	  
	    
	   
	   
	    return obj.toString();
	  }
}
