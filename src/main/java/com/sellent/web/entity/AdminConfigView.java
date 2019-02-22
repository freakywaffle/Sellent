package com.sellent.web.entity;

import java.util.Date;

public class AdminConfigView {

	private int no;
	private String id;
	private String nickname;
	private String email;
	private Date regdate;
	private String role;
	public AdminConfigView() {
		super();
	}
	public AdminConfigView(int no, String id, String nickname, String email, Date regdate, String role) {
		super();
		this.no = no;
		this.id = id;
		this.nickname = nickname;
		this.email = email;
		this.regdate = regdate;
		this.role = role;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	
}
