package com.sellent.web.entity;

import java.util.Date;

public class AdminProductView {
	private int no; 
	private String title; 
	private String parentCategory; 
	private String subCategory; 
	private String writerId; 
	private String simpleContent; 
	private String detailContent; 
	private int price; 
	private int sellCheck; 
	private int duration; 
	private int editCnt; 
	private double avgStarPoint; 
	private Date regdate; 
	private int approval;
	
	
	public AdminProductView() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getParentCategory() {
		return parentCategory;
	}


	public void setParentCategory(String parentCategory) {
		this.parentCategory = parentCategory;
	}


	public String getSubCategory() {
		return subCategory;
	}


	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}


	public String getWriterId() {
		return writerId;
	}


	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}


	public String getSimpleContent() {
		return simpleContent;
	}


	public void setSimpleContent(String simpleContent) {
		this.simpleContent = simpleContent;
	}


	public String getDetailContent() {
		return detailContent;
	}


	public void setDetailContent(String detailContent) {
		this.detailContent = detailContent;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getSellCheck() {
		return sellCheck;
	}


	public void setSellCheck(int sellCheck) {
		this.sellCheck = sellCheck;
	}


	public int getDuration() {
		return duration;
	}


	public void setDuration(int duration) {
		this.duration = duration;
	}


	public int getEditCnt() {
		return editCnt;
	}


	public void setEditCnt(int editCnt) {
		this.editCnt = editCnt;
	}


	public double getAvgStarPoint() {
		return avgStarPoint;
	}


	public void setAvgStarPoint(double avgStarPoint) {
		this.avgStarPoint = avgStarPoint;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public int getApproval() {
		return approval;
	}


	public void setApproval(int approval) {
		this.approval = approval;
	}


	
	
}
