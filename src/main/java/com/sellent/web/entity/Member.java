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
	private int enabled;
	private int sell_count;
	private int product_count;
	private double star_point;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	//for inserting
	public Member(String id, String password, String nickname, String photo, String simple_introduction,String detail_introduction, String email) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.photo = photo;
		this.simple_introduction = simple_introduction;
		this.detail_introduction = detail_introduction;
		this.email = email;
	}
	
	
	public Member(String nickname, String password, String photo, String email, String id) {
		super();
		this.nickname = nickname;
		this.password = password;
		this.photo = photo;
		this.email = email;
		this.id = id;
	}
	public Member(String id, String password, String nickname, String photo, String simple_introduction,
			String detail_introduction, String email, Date regdate, int point, String account, int enabled) {
		
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
		this.enabled = enabled;
	}

	


	public Member(String id, String password, String nickname, String photo, String simple_introduction,
			String detail_introduction, String email, Date regdate, int point, String account, int enabled,
			int sell_count, int product_count, double star_point) {
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
		this.enabled = enabled;
		this.sell_count = sell_count;
		this.product_count = product_count;
		this.star_point = star_point;
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
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getSell_count() {
		return sell_count;
	}
	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public double getStar_point() {
		return star_point;
	}
	public void setStar_point(double star_point) {
		this.star_point = star_point;
	}
	
	
	
	
	
	
}