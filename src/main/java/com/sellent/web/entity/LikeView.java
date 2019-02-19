package com.sellent.web.entity;

import java.util.Date;

public class LikeView extends ProductView{
	
	private String photo;
	


	public LikeView(int no, String title, String thumbnail, String photo, String parentCategory, String subCategory,
			String writerId, String simpleContent, String detailContent, int price, int sellCheck, int duration,
			int editCnt, double avgStarPoint, Date regdate, int approval, int reviewCnt, String nickname) {
		super(no, title, thumbnail, parentCategory, subCategory, writerId, simpleContent, detailContent, price,
				sellCheck, duration, editCnt, avgStarPoint, regdate, approval, reviewCnt, nickname);
		this.photo = photo;

	}



	public LikeView() {
		super();
	}



	public String getPhoto() {
		return photo;
	}



	public void setPhoto(String photo) {
		this.photo = photo;
	}



	@Override
	public String toString() {
		return "LikeView [photo=" + photo + ", getReviewCnt()=" + getReviewCnt() + ", getNickname()=" + getNickname()
				+ ", toString()=" + super.toString() + ", getNo()=" + getNo() + ", getTitle()=" + getTitle()
				+ ", getThumbnail()=" + getThumbnail() + ", getParentCategory()=" + getParentCategory()
				+ ", getSubCategory()=" + getSubCategory() + ", getWriterId()=" + getWriterId()
				+ ", getSimpleContent()=" + getSimpleContent() + ", getDetailContent()=" + getDetailContent()
				+ ", getPrice()=" + getPrice() + ", getSellCheck()=" + getSellCheck() + ", getDuration()="
				+ getDuration() + ", getEditCnt()=" + getEditCnt() + ", getAvgStarPoint()=" + getAvgStarPoint()
				+ ", getRegdate()=" + getRegdate() + ", getApproval()=" + getApproval() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}






	



	
	
	
}
