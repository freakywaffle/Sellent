package com.sellent.web.entity;

public class QnaPaCategory {
	
	private int parent_no;
	private String title;
	
	public QnaPaCategory() {
		super();
	}
	public QnaPaCategory(int parent_no, String title) {
		super();
		this.parent_no = parent_no;
		this.title = title;
	}
	public int getParent_no() {
		return parent_no;
	}
	public void setParent_no(int parent_no) {
		this.parent_no = parent_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "QnaPaCategory [parent_no=" + parent_no + ", title=" + title + "]";
	}
	
	
}
