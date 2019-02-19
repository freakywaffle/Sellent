package com.sellent.web.entity;

public class ParentCategorySY {

	private String parent_category;
	private int cnt;
	
	
	
	
	public ParentCategorySY() {
		super();
	}




	public ParentCategorySY(String parent_category, int cnt) {
		super();
		this.parent_category = parent_category;
		this.cnt = cnt;
	}




	public String getParent_category() {
		return parent_category;
	}




	public void setParent_category(String parent_category) {
		this.parent_category = parent_category;
	}




	public int getCnt() {
		return cnt;
	}




	public void setCnt(int cnt) {
		this.cnt = cnt;
	}




	@Override
	public String toString() {
		return "ParentCategorySY [parent_category=" + parent_category + ", cnt=" + cnt + "]";
	}

	
	
	
}
