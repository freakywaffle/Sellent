package com.sellent.web.dao;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;
 
public interface AdminReviewDao {
	
	List<ReviewView> getReviewView(
			String startDate, 
			String endDate, 
			String condition,
			String text,
			AdminPaging paging);
	
	int getReviewCnt(
			String startDate, 
			String endDate, 
			String condition,
			String text);
	
	int delete(int no);

}
