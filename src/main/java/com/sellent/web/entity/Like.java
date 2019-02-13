package com.sellent.web.entity;

public class Like {
	private String member_id;
	private String product_no;
	
	public Like() {
	}

	public Like(String member_id, String product_no) {
		this.member_id = member_id;
		this.product_no = product_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	
	
}
