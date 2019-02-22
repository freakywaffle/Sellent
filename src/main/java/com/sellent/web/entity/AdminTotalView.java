package com.sellent.web.entity;

import java.util.Date;

public class AdminTotalView {

	private int no;
	private String seller_id;
	private String buyer_id;
	private int product_no;
	private Date regdate;
	private String state;
	private int price;
	
	public AdminTotalView() {
		super();
	}
	public AdminTotalView(int no, String seller_id, String buyer_id, int product_no, Date regdate, String state,
			int price) {
		super();
		this.no = no;
		this.seller_id = seller_id;
		this.buyer_id = buyer_id;
		this.product_no = product_no;
		this.regdate = regdate;
		this.state = state;
		this.price = price;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
