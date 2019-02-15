package com.sellent.web.dao.mybatis;

import java.util.List;

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

	@Override
	public int insert_sy(String name, int point) {
		// TODO Auto-generated method stub
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);
		
		return pointHistoryDao.insert_sy(name, point);
	}

	@Override
	public List<PointHistory> select_sy(String  member_id) {
		// TODO Auto-generated method stub
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);

		
		return pointHistoryDao.select_sy(member_id);
	}
	
}
