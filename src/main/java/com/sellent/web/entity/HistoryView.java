package com.sellent.web.entity;

public class HistoryView extends History{
	private String title;
	private int price;
	private String parent_category;
	
	public HistoryView() {
		// TODO Auto-generated constructor stub
	}

	public HistoryView(String title, int price) {
		super();
		this.title = title;
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	
	public String getParent_category() {
		return parent_category;
	}

	public void setParent_category(String parent_category) {
		this.parent_category = parent_category;
	}

	@Override
	public String toString() {
		return "HistoryView [title=" + title + ", price=" + price + ", parent_category=" + parent_category + "]";
	}

	
	
}
