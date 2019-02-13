package com.sellent.web.entity;

import java.util.Date;

public class ReviewView extends Review{
	private String photo;

	public ReviewView() {
	}
	
	public ReviewView(int no, int product_no, String writer_id, String content, double starpoint, Date regdate,
			String photo) {
		super(no, product_no, writer_id, content, starpoint, regdate);
		this.photo = photo;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "{\"no\":" + super.getNo() + ", \"product_no\":" + super.getProduct_no() + ", \"writer_id\":\"" + super.getWriter_id() + "\", \"content\":\"" + super.getContent()
				+ "\", \"starpoint\":" + super.getStarpoint() + ", \"regdate\":\"" + super.getRegdate() + "\", \"photo\":\""+photo+"\"}";
	}
	
}
