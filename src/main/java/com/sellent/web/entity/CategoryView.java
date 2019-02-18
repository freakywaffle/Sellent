package com.sellent.web.entity;

public class CategoryView {

	private int num;
	private String parentCategory;
	private String subCategory;
	private int cnt;
	
	public CategoryView() {
		super();
	}
	
	public CategoryView(int num, String parentCategory, String subCategory, int cnt) {
		super();
		this.num = num;
		this.parentCategory = parentCategory;
		this.subCategory = subCategory;
		this.cnt = cnt;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(String parentCategory) {
		this.parentCategory = parentCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	
	
	
}
