package com.sellent.web.entity;

import java.util.Date;

public class ProductView extends Product{
	private int reviewCnt;
	private String nickname;
	
	public ProductView() {
	}

	

	public ProductView(int no, String title, String thumbnail, String parentCategory, String subCategory,
			String writerId, String simpleContent, String detailContent, int price, int sellCheck, int duration,
			int editCnt, double avgStarPoint, Date regdate, int approval, int reviewCnt, String nickname) {
		super(no, title, thumbnail, parentCategory, subCategory, writerId, simpleContent, detailContent, price,
				sellCheck, duration, editCnt, avgStarPoint, regdate, approval);
		this.reviewCnt = reviewCnt;
		this.nickname = nickname;
	}

	


	public ProductView(String title, String thumbnail, String parentCategory, String subCategory, String writerId,
			String simpleContent, String detailContent, int price, int sellCheck, int duration, int editCnt,
			int reviewCnt, String nickname) {
		super(title, thumbnail, parentCategory, subCategory, writerId, simpleContent, detailContent, price, sellCheck,
				duration, editCnt);
		this.reviewCnt = reviewCnt;
		this.nickname = nickname;
	}


	

	public ProductView(int reviewCnt, String nickname) {
		this.reviewCnt = reviewCnt;
		this.nickname = nickname;
	}



	public int getReviewCnt() {
		return reviewCnt;
	}



	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	
	
	
}
