package com.sellent.web.entity;

public class Like {
	private String member_id;
	private int product_no;
	
	public Like() {
	}

	public Like(String member_id, int product_no) {
		this.member_id = member_id;
		this.product_no = product_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	@Override
	public String toString() {
		return "Like [member_id=" + member_id + ", product_no=" + product_no + "]";
	}
	
	
	
}
