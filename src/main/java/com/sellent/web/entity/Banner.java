package com.sellent.web.entity;

import java.util.Date;

public class Banner {
	
	private int id;
	private int order;
	private String image;
	private String title;
	private String content;
	private String end_date;
	private int use;
	
	
	public Banner() {
		super();
	}

	public Banner(int id, int order, String image, String title, String content, String end_date, int use) {
		super();
		this.id = id;
		this.order = order;
		this.image = image;
		this.title = title;
		this.content = content;
		this.end_date = end_date;
		this.use = use;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getUse() {
		return use;
	}

	public void setUse(int use) {
		this.use = use;
	}

}
