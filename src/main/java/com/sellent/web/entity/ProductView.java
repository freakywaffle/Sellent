package com.sellent.web.entity;

import java.util.Date;

public class ProductView extends Product{
	private int reviewCnt;

	public ProductView() {
	}
	
	public ProductView(int no, String title, String parentCategory, String subCategory, String writerId,
			String simpleContent, String detailContent, int price, int sellCheck, int duration, int editCnt,
			double avgStarPoint, Date regdate, int approval, int reviewCnt) {
		super(no, title, parentCategory, subCategory, writerId, simpleContent, detailContent, price, sellCheck,
				duration, editCnt, avgStarPoint, regdate, approval);
		this.reviewCnt = reviewCnt;
	}

	public ProductView(String title, String parentCategory, String subCategory, String writerId, String simpleContent,
			String detailContent, int price, int sellCheck, int duration, int editCnt, int reviewCnt) {
		super(title, parentCategory, subCategory, writerId, simpleContent, detailContent, price, sellCheck, duration,
				editCnt);
		this.reviewCnt = reviewCnt;
	}

	public int getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	
	
}
