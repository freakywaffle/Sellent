package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminProductDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;


@Repository
public class MyBatisAdminProductDao implements AdminProductDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<AdminProductView> getBoard(String parent, String sub, int sale, String startDate,
			String endDate, String condition, String text, AdminPaging paging) {

		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.getBoard(parent, sub, sale, startDate, endDate, condition, text, paging);
	}

	@Override
	public List<AdminProductView> getSale(String approval, String startDate, String endDate, String condition,
			String text, AdminPaging paging) {
		
		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.getSale(approval, startDate, endDate, condition, text, paging);
	}
	
	@Override
	public int getBoardCnt(String parent, String sub, int sale, String startDate, String endDate,
			String condition, String text) {
		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.getBoardCnt(parent, sub, sale, startDate, endDate, condition, text);
	}

	@Override
	public int getSaleCnt(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text) {
		
		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.getSaleCnt(approval, startDate, endDate, condition, text);
	}

	@Override
	public int update(String approval, int no) {
		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.update(approval, no);
	}

	@Override
	public int delete(int no) {
		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.delete(no);
	}

	
}
