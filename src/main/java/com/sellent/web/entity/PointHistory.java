package com.sellent.web.entity;

import java.util.Date;

public class PointHistory {
	private int no;
	private String member_id;
	private String content;
	private Date regdate;
	private int point;
	private String date;
	
	public PointHistory() {
	}

	public PointHistory(int no, String member_id, String content, Date regdate, int point) {
		this.no = no;
		this.member_id = member_id;
		this.content = content;
		this.regdate = regdate;
		this.point = point;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	@Override
	public String toString() {
		return "PointHistory [no=" + no + ", member_id=" + member_id + ", content=" + content + ", regdate=" + regdate
				+ ", point=" + point + "]";
	}
	
	
	
}	
