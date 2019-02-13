package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;

public interface ReviewDao {
	int insert(Review review);
	List<ReviewView> getListByProductNo(int productNo, int cnt);
	double getAvgStarPointByProductNo(int productNo);
}
