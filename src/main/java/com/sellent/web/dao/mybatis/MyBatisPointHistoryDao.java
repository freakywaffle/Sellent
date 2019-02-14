package com.sellent.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.PointHistoryDao;
import com.sellent.web.entity.PointHistory;

@Repository
public class MyBatisPointHistoryDao implements PointHistoryDao{

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insert(PointHistory pointHistory) {
		
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);
		return pointHistoryDao.insert(pointHistory);
	}
	
}
