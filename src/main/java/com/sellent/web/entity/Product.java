package com.sellent.web.entity;

import java.util.Date;

public class Product {
	private int no; 
	private String title; 
	private String thumbnail;
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
	
	
	public Product() {
		// TODO Auto-generated constructor stub
	}


	


	public Product(int no, String title, String thumbnail, String parentCategory, String subCategory, String writerId,
			String simpleContent, String detailContent, int price, int sellCheck, int duration, int editCnt,
			double avgStarPoint, Date regdate, int approval) {
		this.no = no;
		this.title = title;
		this.thumbnail = thumbnail;
		this.parentCategory = parentCategory;
		this.subCategory = subCategory;
		this.writerId = writerId;
		this.simpleContent = simpleContent;
		this.detailContent = detailContent;
		this.price = price;
		this.sellCheck = sellCheck;
		this.duration = duration;
		this.editCnt = editCnt;
		this.avgStarPoint = avgStarPoint;
		this.regdate = regdate;
		this.approval = approval;
	}

	



	public Product(String title, String thumbnail, String parentCategory, String subCategory, String writerId,
			String simpleContent, String detailContent, int price, int sellCheck, int duration, int editCnt) {
		this.title = title;
		this.thumbnail = thumbnail;
		this.parentCategory = parentCategory;
		this.subCategory = subCategory;
		this.writerId = writerId;
		this.simpleContent = simpleContent;
		this.detailContent = detailContent;
		this.price = price;
		this.sellCheck = sellCheck;
		this.duration = duration;
		this.editCnt = editCnt;
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





	public String getThumbnail() {
		return thumbnail;
	}





	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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





	@Override
	public String toString() {
		return "Product [no=" + no + ", title=" + title + ", thumbnail=" + thumbnail + ", parentCategory="
				+ parentCategory + ", subCategory=" + subCategory + ", writerId=" + writerId + ", simpleContent="
				+ simpleContent + ", detailContent=" + detailContent + ", price=" + price + ", sellCheck=" + sellCheck
				+ ", duration=" + duration + ", editCnt=" + editCnt + ", avgStarPoint=" + avgStarPoint + ", regdate="
				+ regdate + ", approval=" + approval + "]";
	}

	
	
	
	
}
