package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ReviewDao;
import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;

@Repository
public class MybatisReviewDao implements ReviewDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insert(Review review) {
		
		ReviewDao reviewDao = session.getMapper(ReviewDao.class);
		
		return reviewDao.insert(review);
	}

	@Override
	public List<ReviewView> getListByProductNo(int productNo, int cnt) {
		ReviewDao reviewDao = session.getMapper(ReviewDao.class);
		
		return reviewDao.getListByProductNo(productNo, cnt);
	}

	@Override
	public double getAvgStarPointByProductNo(int productNo) {
		ReviewDao reviewDao = session.getMapper(ReviewDao.class);
		
		return reviewDao.getAvgStarPointByProductNo(productNo);
	}

	@Override
	public List<ReviewView> getListById(String id, int page) {
		// TODO Auto-generated method stub
		return getListById(id, page, 0);
	}

	@Override
	public List<ReviewView> getListById(String id, int page, int selector) {
		ReviewDao reviewDao = session.getMapper(ReviewDao.class);
		System.out.println("dao-id: "+id);
		page = (page-1)*5;
		System.out.println("dao-page: "+page);
		System.out.println("dao-selector: "+selector);
		return reviewDao.getListById(id,page,selector);
	}

	@Override
	public int getAllCntById(String id, int selector) {
		ReviewDao reviewDao = session.getMapper(ReviewDao.class);
		return reviewDao.getAllCntById(id,selector);
	}

	@Override
	public int update(Review review) {
		// TODO Auto-generated method stub
		ReviewDao reviewDao = session.getMapper(ReviewDao.class);
		return reviewDao.update(review);
	}

	@Override
	public int delete(int no) {
		ReviewDao reviewDao = session.getMapper(ReviewDao.class);
		return reviewDao.delete(no);
	}

}
