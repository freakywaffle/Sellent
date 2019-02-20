package com.sellent.web.entity;

public class HistoryView extends History{
	private String title;
	private int price;
	
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

	@Override
	public String toString() {
		return "HistoryView [title=" + title + ", price=" + price + "]";
	}
	
	
}
