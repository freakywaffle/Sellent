package com.sellent.web.entity;

public class Skill{
	private String name;
	private String memberId;
	
	public Skill() {
		// TODO Auto-generated constructor stub
	}

	

	public Skill(String name, String memberId) {
		this.name = name;
		this.memberId = memberId;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	@Override
	public String toString() {
		return "Skill [name=" + name + ", memberId=" + memberId + "]";
	}

	
}
