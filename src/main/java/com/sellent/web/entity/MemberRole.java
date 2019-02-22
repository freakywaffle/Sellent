package com.sellent.web.entity; 

public class MemberRole {

	private String id;
	private String role;
	
	public MemberRole() {
		// TODO Auto-generated constructor stub
	}

	public MemberRole(String id, String role) {
		super();
		this.id = id;
		this.role = role;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
	
	
}
