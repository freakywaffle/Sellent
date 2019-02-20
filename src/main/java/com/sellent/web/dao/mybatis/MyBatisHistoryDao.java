package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.HistoryDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.entity.History;
import com.sellent.web.entity.HistoryView;

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
	public List<HistoryView> getListById(String id, int page) {
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		//System.out.println(id);
		//System.out.println(page);
		//System.out.println(selector);
		page = (page-1)*5;
		return historyDao.getListById(id,page);
	}


	@Override
	public int getAllCntById(String id, int selector) {
		// TODO Auto-generated method stub
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		
		return historyDao.getAllCntById(id, selector);
	}


	@Override
	public List<HistoryView> getListById2(String id, int page) {
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		page = (page-1)*5;
		return historyDao.getListById2(id,page);
	}




	@Override
	public int chgState(History history) {
		// TODO Auto-generated method stub
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		
		return historyDao.chgState(history);
	}




	@Override
	public int getAllCntById2(String id, int selector) {
		// TODO Auto-generated method stub
		HistoryDao historyDao = session.getMapper(HistoryDao.class);
		
		return historyDao.getAllCntById2(id, selector);
	}

}
