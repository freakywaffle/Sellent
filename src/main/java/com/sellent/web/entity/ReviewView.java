package com.sellent.web.entity;

import java.util.Date;

public class ReviewView extends Review{
	private String photo;
	private String nickname;

	public ReviewView() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ReviewView(int no, int product_no, String writer_id, String content, double starpoint, Date regdate,
			String photo, String nickname) {
		super(no, product_no, writer_id, content, starpoint, regdate);
		this.photo = photo;
		this.nickname = nickname;
	}


	public ReviewView(String photo, String nickname) {
		this.photo = photo;
		this.nickname = nickname;
	}

	

	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	@Override
	public String toString() {
		return "{\"no\":" + super.getNo() + ", \"product_no\":" + super.getProduct_no() + ", \"writer_id\":\"" + super.getWriter_id() + "\", \"content\":\"" + super.getContent()
				+ "\", \"starpoint\":" + super.getStarpoint() + ", \"regdate\":\"" + super.getRegdate() + "\", \"photo\":\""+photo+"\", \"nickname\":\""+nickname+"\"}";
	}
	
}
