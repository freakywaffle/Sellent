package com.sellent.web.entity;

public class PointConfig {

	private String content;
	private int point;
	private int use;
	public PointConfig() {
		super();
	}
	public PointConfig(String content, int point, int use) {
		super();
		this.content = content;
		this.point = point;
		this.use = use;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUse() {
		return use;
	}
	public void setUse(int use) {
		this.use = use;
	}
	

	
}
