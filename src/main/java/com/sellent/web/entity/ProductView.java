package com.sellent.web.entity;

import java.util.Date;

public class ProductView extends Product{
	private int reviewCnt;
	private String nickname;
	private String photo;
	
	public ProductView() {
	}

	public ProductView(int no, String title, String thumbnail, String parentCategory, String subCategory,
			String writerId, String simpleContent, String detailContent, int price, int sellCheck, int duration,
			int editCnt, double avgStarPoint, Date regdate, int approval, int reviewCnt, String nickname,
			String photo) {
		super(no, title, thumbnail, parentCategory, subCategory, writerId, simpleContent, detailContent, price,
				sellCheck, duration, editCnt, avgStarPoint, regdate, approval);
		this.reviewCnt = reviewCnt;
		this.nickname = nickname;
		this.photo = photo;
	}


	public ProductView(String title, String thumbnail, String parentCategory, String subCategory, String writerId,
			String simpleContent, String detailContent, int price, int sellCheck, int duration, int editCnt,
			int reviewCnt, String nickname, String photo) {
		super(title, thumbnail, parentCategory, subCategory, writerId, simpleContent, detailContent, price, sellCheck,
				duration, editCnt);
		this.reviewCnt = reviewCnt;
		this.nickname = nickname;
		this.photo = photo;
	}


	public ProductView(int reviewCnt, String nickname, String photo) {
		this.reviewCnt = reviewCnt;
		this.nickname = nickname;
		this.photo = photo;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}



	@Override
	public String toString() {
		return "ProductView [reviewCnt=" + reviewCnt + ", nickname=" + nickname + "]";
	}


	
	
	
}
