package com.sellent.web.entity;

public class AdminPaging {

	int startCount;	//시작번호
	int endCount;	//끝 번호
	
	int page;		// 현재 페이지
	int startPage;	// 시작 페이지
	int endPage;	// 마지막 페이지
	
	int prevPage;	// 이전페이지
	int nextPage;	// 다음페이지
	
	int countPage = 5;	// 뷰에 가져올 페이지 수
	int countList = 10;	// 전체 페이지 수를 구하기 위한 수
	
	int totalCount;	// 전체 게시물 수
	int totalPage;	// 전체 페이지 수
	
	public int getPage() {
		
		return page;
	}
	
	public void setPage(int page) {
		this.page = page; 
		this.startPage = ((page-1) / countPage) * countPage +1;
		this.endPage = startPage + countPage - 1;
		
		// 마지막 페이지가 총 페이지를 넘지 않도록 보정
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		this.page = page;
		
		this.startCount = (page-1) * countList;	// 오라클은 1을 더함
		this.endCount = page * countList;
		
		this.prevPage = (this.page-1) < 1 ? 1 : (this.page-1);
		this.nextPage = (this.page+1) > totalPage ? totalPage : (this.page+1);
		
	}
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.totalPage = this.totalCount / countList;
		// 나머지가 있는 경우에 페이지 +1
		if(this.totalCount % countList >0) {
			totalPage++;
		}
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	
	
}
