package com.sellent.web.entity;

import java.util.Date;

public class AdminPersonView {

	private int no;
	private String id;
	private String type;
	private String product_no;
	private Date regdate;
	private String state;
	private int price;
	public AdminPersonView() {
		super();
	}
	public AdminPersonView(int no, String id, String type, String product_no, Date regdate, String state, int price) {
		super();
		this.no = no;
		this.id = id;
		this.type = type;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
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
