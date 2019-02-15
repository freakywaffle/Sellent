package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.LikeDao;
import com.sellent.web.entity.Like;

@Repository
public class MyBatisLikeDao implements LikeDao{

	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int insert(Like like) {
		LikeDao likeDao = session.getMapper(LikeDao.class);
		return likeDao.insert(like);
	}


	@Override
	public int delete(Like like) {
		LikeDao likeDao = session.getMapper(LikeDao.class);
		return likeDao.delete(like);
	}


	@Override
	public int hasLike(Like like) {
		LikeDao likeDao = session.getMapper(LikeDao.class);
		return likeDao.hasLike(like);
	}


	@Override
	public List<Like> getListById(String id) {
		LikeDao likeDao = session.getMapper(LikeDao.class);
		return likeDao.getListById(id);
	}
	
}
