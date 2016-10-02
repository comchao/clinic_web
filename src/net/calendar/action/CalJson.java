package net.calendar.action;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class CalJson implements JSONAware {
	private String id;
	private String title;
	private String start;
	private String url;
	
	
	public CalJson(String id, String title, String date, String url){
		this.id=id;
		this.title=title;
		this.start=date;
		this.url=url;
		
	}
	
	@Override
	public String toJSONString(){
	    JSONObject obj = new JSONObject();
	    obj.put("id", id);
	    obj.put("title", title);
	    obj.put("start", start);
	    obj.put("url", url);
	   
	    return obj.toString();
	  }
}
