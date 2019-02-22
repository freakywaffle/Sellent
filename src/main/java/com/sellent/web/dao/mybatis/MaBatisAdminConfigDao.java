package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminConfigDao;
import com.sellent.web.entity.AdminConfigView;
import com.sellent.web.entity.AdminPaging;

@Repository
public class MaBatisAdminConfigDao implements AdminConfigDao{
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<AdminConfigView> getAdminConfigView(String role, String startDate, String endDate, String condition,
			String text, AdminPaging paging) {
		
		AdminConfigDao adminConfigDao = session.getMapper(AdminConfigDao.class);
		return adminConfigDao.getAdminConfigView(role, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getAdminConfigCnt(String role, String startDate, String endDate, String condition, String text) {
		AdminConfigDao adminConfigDao = session.getMapper(AdminConfigDao.class);
		return adminConfigDao.getAdminConfigCnt(role, startDate, endDate, condition, text);
	}

	@Override
	public int update(String id, String role) {
		AdminConfigDao adminConfigDao = session.getMapper(AdminConfigDao.class);
		return adminConfigDao.update(id, role);
	}
	
}
