package com.sellent.web.entity;

import java.util.Date;

public class Qna {
	
	private int no; 
	private String email; 
	private String title; 
	private String content;
	private Date regdate; 
	
	
	public Qna() {
		super();
	}


	public Qna(int no, String email, String title, String content, Date regdate) {
		super();
		this.no = no;
		this.email = email;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}


	public Qna(String email, String title, String content) {
		super();
		this.email = email;
		this.title = title;
		this.content = content;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "Qna [no=" + no + ", email=" + email + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + "]";
	}


	

	



	
	
	
	
	
	
	
}
