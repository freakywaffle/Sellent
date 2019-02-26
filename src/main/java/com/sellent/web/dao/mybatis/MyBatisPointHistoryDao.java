package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.PointHistoryDao;
import com.sellent.web.dao.ProductDao;
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
	public int update_sy(String name, int point) {
		// TODO Auto-generated method stub
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);
		
		return pointHistoryDao.update_sy(name, point);
	}

	@Override
	public List<PointHistory> select_sy(String  member_id) {
		// TODO Auto-generated method stub
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);

		
		return pointHistoryDao.select_sy(member_id);
	}

	@Override
	public List<PointHistory> getListById(String id, int page) {
		// TODO Auto-generated method stub
		return getListById(id, page, 0);
	}

	@Override
	public List<PointHistory> getListById(String id, int page, int selector) {
		// TODO Auto-generated method stub
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);
		System.out.println(id);
		System.out.println(page);
		System.out.println(selector);
		page = (page-1)*5;
		return pointHistoryDao.getListById(id,page,selector);
	}

	@Override
	public int getAllCntById(String id, int selector) {
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);
		return pointHistoryDao.getAllCntById(id, selector);
	}

	@Override
	public int getAllSumById(String id, int selector) {
		// TODO Auto-generated method stub
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);
		return pointHistoryDao.getAllSumById(id, selector);
	}

	@Override
	public int guidePoint() {
		PointHistoryDao pointHistoryDao = session.getMapper(PointHistoryDao.class);
		return pointHistoryDao.guidePoint();
	}
	
}
