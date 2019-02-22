package com.sellent.web.dao;

import java.util.List;


import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;

public interface ReviewDao {
	int insert(Review review);
	List<ReviewView> getListByProductNo(int productNo, int cnt);
	double getAvgStarPointByProductNo(int productNo);
	
	List<ReviewView> getListById(String id, int page);
	List<ReviewView> getListById(String id, int page, int selector);
	int getAllCntById(String id, int selector);
	
	int update(Review review);
	int delete(int no);
}
