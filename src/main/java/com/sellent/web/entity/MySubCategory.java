package com.sellent.web.entity;

public class MySubCategory {
	private String name;
	private String parent_name;
	
	public MySubCategory() {
		// TODO Auto-generated constructor stub
	}

	public MySubCategory(String name, String parent_name) {
		super();
		this.name = name;
		this.parent_name = parent_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParent_name() {
		return parent_name;
	}

	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	
	
	
}
