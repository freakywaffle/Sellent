package com.sellent.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.HistoryDao;
import com.sellent.web.entity.History;

@Repository
public class MyBatisHistoryDao implements HistoryDao{

	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int insert(History history) {
		
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		
		return historyDao.insert(history);
	}

	@Override
	public int delete(History history) {
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		
		return historyDao.delete(history);
	}

	@Override
	public int hasBuy(String id, int ProductNo) {
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		
		return historyDao.hasBuy(id, ProductNo);
	}


	

}