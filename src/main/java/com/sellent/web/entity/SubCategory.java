package com.sellent.web.entity;

public class SubCategory {

	private String parentName;
	private String name;
	public SubCategory(String parentName, String name) {
		super();
		this.parentName = parentName;
		this.name = name;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
