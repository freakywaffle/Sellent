package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
