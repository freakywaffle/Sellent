package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminPointDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.PointConfig;
import com.sellent.web.entity.PointHistory;

@Repository
public class MyBatisAdminPointDao implements AdminPointDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<PointHistory> getPointHistory(String condition, String text, AdminPaging paging) {
		
		AdminPointDao adminPointDao = session.getMapper(AdminPointDao.class);
		
		return adminPointDao.getPointHistory(condition, text, paging);
	}

	@Override
	public List<PointConfig> getPointConfig() {
		AdminPointDao adminPointDao = session.getMapper(AdminPointDao.class);
		
		return adminPointDao.getPointConfig();
	}

	@Override
	public int getPointCnt(String condition, String text) {
		AdminPointDao adminPointDao = session.getMapper(AdminPointDao.class);
		
		return adminPointDao.getPointCnt(condition, text);
	}

	@Override
	public int insert(String id, String content, int point) {
		AdminPointDao adminPointDao = session.getMapper(AdminPointDao.class);
		
		return adminPointDao.insert(id, content, point);
	}

	@Override
	public int updateConfig(String content, int point, int use) {
		AdminPointDao adminPointDao = session.getMapper(AdminPointDao.class);
		
		return adminPointDao.updateConfig(content, point, use);
	}

}
