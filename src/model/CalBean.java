package model;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class CalBean {
	

	private String id;
	private String title;
	private String url;
	private String date;
	private String Status;
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

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

	
	
}
