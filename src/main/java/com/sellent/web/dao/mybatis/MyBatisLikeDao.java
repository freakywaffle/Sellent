package com.sellent.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sellent.web.dao.LikeDao;
import com.sellent.web.entity.Like;

public class MyBatisLikeDao implements LikeDao{

	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int insert(Like like) {
		LikeDao likeDao = session.getMapper(LikeDao.class);
		return likeDao.insert(like);
	}
	
}
