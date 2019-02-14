package com.sellent.web.entity;

public class QnaContent {

	private int sub_no;
	private String content1;
	private String content2;
	private String content3;
	private String content4;
	private String content5;
	public QnaContent() {
		super();
	}
	public QnaContent(int sub_no, String content1, String content2, String content3, String content4, String content5) {
		super();
		this.sub_no = sub_no;
		this.content1 = content1;
		this.content2 = content2;
		this.content3 = content3;
		this.content4 = content4;
		this.content5 = content5;
	}
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getContent3() {
		return content3;
	}
	public void setContent3(String content3) {
		this.content3 = content3;
	}
	public String getContent4() {
		return content4;
	}
	public void setContent4(String content4) {
		this.content4 = content4;
	}
	public String getContent5() {
		return content5;
	}
	public void setContent5(String content5) {
		this.content5 = content5;
	}
	@Override
	public String toString() {
		return "{\"sub_no\":" + sub_no + ", \"content1\":\"" + content1 + "\", \"content2\":\"" + content2 + "\", \"content3\":\""
				+ content3 + "\", \"content4\":\"" + content4 + "\", \"content5\":\"" + content5 + "\"}";
	}
	
	
}
