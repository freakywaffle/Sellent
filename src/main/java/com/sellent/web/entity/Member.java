package com.sellent.web.entity;

import java.util.Date;

public class Member{
	private String id;
	private String password;
	private String nickname;
	private String photo;
	private String simple_introduction;
	private String detail_introduction;
	private String email;
	private Date regdate;
	private int point;
	private String account;
	private int enable;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	//for inserting
	public Member(String id, String password, String nickname, String photo, String simple_introduction,String detail_introduction, String email) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.photo = photo;
		this.simple_introduction = simple_introduction;
		this.detail_introduction = detail_introduction;
		this.email = email;
	}
	
	
	public Member(String id, String password, String nickname, String photo, String simple_introduction,
			String detail_introduction, String email, Date regdate, int point, String account, int enable) {
		
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.photo = photo;
		this.simple_introduction = simple_introduction;
		this.detail_introduction = detail_introduction;
		this.email = email;
		this.regdate = regdate;
		this.point = point;
		this.account = account;
		this.enable = enable;
	}




	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSimple_introduction() {
		return simple_introduction;
	}

	public void setSimple_introduction(String simple_introduction) {
		this.simple_introduction = simple_introduction;
	}

	public String getDetail_introduction() {
		return detail_introduction;
	}

	public void setDetail_introduction(String detail_introduction) {
		this.detail_introduction = detail_introduction;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}
	
	
	
}