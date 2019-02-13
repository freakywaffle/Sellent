package com.sellent.web.entity;

public class QnaSubCategory {
	
	private int parent_no;
	private int sub_no;
	private String title;
	
	
	public QnaSubCategory() {
		super();
	}


	public QnaSubCategory(int parent_no, int sub_no, String title) {
		super();
		this.parent_no = parent_no;
		this.sub_no = sub_no;
		this.title = title;
	}


	public int getParent_no() {
		return parent_no;
	}


	public void setParent_no(int parent_no) {
		this.parent_no = parent_no;
	}


	public int getSub_no() {
		return sub_no;
	}


	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	@Override
	public String toString() {
		return "QnaSubCategory [parent_no=" + parent_no + ", sub_no=" + sub_no + ", title=" + title + "]";
	}
	
	
}
