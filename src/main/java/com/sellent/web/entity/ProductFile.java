package com.sellent.web.entity;

public class ProductFile {
	private int productNo;
	private String saveName;
	private String name;
	
	public ProductFile() {
		
	}
	
	public ProductFile(int productNo, String saveName, String name) {
		this.productNo = productNo;
		this.saveName = saveName;
		this.name = name;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
		return "ProductFile [productNo=" + productNo + ", saveName=" + saveName + ", name=" + name + "]";
	}
	
	
	
	
	
}
