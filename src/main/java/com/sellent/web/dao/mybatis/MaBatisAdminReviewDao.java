package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminReviewDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;

@Repository
public class MaBatisAdminReviewDao implements AdminReviewDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<ReviewView> getReviewView(String startDate, String endDate, String condition, String text, AdminPaging paging) {
		AdminReviewDao adminReviewDao = session.getMapper(AdminReviewDao.class);
		return adminReviewDao.getReviewView(startDate, endDate, condition, text, paging);
	}

	@Override
	public int getReviewCnt(String startDate, String endDate, String condition, String text) {
		AdminReviewDao adminReviewDao = session.getMapper(AdminReviewDao.class);
		return adminReviewDao.getReviewCnt(startDate, endDate, condition, text);
	}
	
	@Override
	public int delete(int no) {
		AdminReviewDao adminReviewDao = session.getMapper(AdminReviewDao.class);
		return adminReviewDao.delete(no);
	}


}
