package com.sellent.web.entity;

public class QnaFile {
	private int qnaNo;
	private String saveName;
	private String name;
	
	public QnaFile() {
		
	}

	public QnaFile(int qnaNo, String saveName, String name) {
		super();
		this.qnaNo = qnaNo;
		this.saveName = saveName;
		this.name = name;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "QnaFile [qnaNo=" + qnaNo + ", saveName=" + saveName + ", name=" + name + "]";
	}
	
	
	
	
	
	
	
}
