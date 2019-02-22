package com.sellent.web.entity;

import java.util.Date;

public class Review {
	private int no;
	private int product_no;
	private String writer_id;
	private String content;
	private double starpoint;
	private Date regdate;
	
	
	
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Review(int no, int product_no, String writer_id, String content, double starpoint, Date regdate) {
		this.no = no;
		this.product_no = product_no;
		this.writer_id = writer_id;
		this.content = content;
		this.starpoint = starpoint;
		this.regdate = regdate;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public String getWriter_id() {
		return writer_id;
	}


	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public double getStarpoint() {
		return starpoint;
	}


	public void setStarpoint(double starpoint) {
		this.starpoint = starpoint;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "{\"no\":" + no + ", \"product_no\":" + product_no + ", \"writer_id\":\"" + writer_id + "\", \"content\":\"" + content
				+ "\", \"starpoint\":" + starpoint + ", \"regdate\":\"" + regdate + "\"}";
	}
	
	
}
