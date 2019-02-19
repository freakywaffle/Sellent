package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;

import com.sellent.web.dao.AdminReviewDao;
import org.springframework.stereotype.Service;

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;

@Service
public class SellentAdminReviewService implements AdminReviewService{
	
	@Autowired
	private AdminReviewDao adminReviewDao;
	
	@Override
	public List<ReviewView> getReviewView(String startDate, String endDate, String condition, String text, AdminPaging paging) {
		return adminReviewDao.getReviewView(startDate, endDate, condition, text, paging);
	}

	@Override
	public int getReviewCnt(String startDate, String endDate, String condition, String text) {
		return adminReviewDao.getReviewCnt(startDate, endDate, condition, text);
	}

	@Override
	public int delete(int no) {
		return adminReviewDao.delete(no);
	}

}
