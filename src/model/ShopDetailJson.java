package model;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class ShopDetailJson implements JSONAware {
	private String name;
	private String total;

	
	
	public ShopDetailJson (String name, String total){
		this.name=name;
		this.total=total;
		
		
	}
	
	@Override
	public String toJSONString(){
	    JSONObject obj = new JSONObject();
	    obj.put("name", name);
	    obj.put("total", total);
	   
	   
	    return obj.toString();
	  }
}
