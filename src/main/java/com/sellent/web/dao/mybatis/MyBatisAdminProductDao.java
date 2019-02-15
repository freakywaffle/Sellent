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
	public List<AdminProductView> getViewList(String approval, String startDate, String endDate, String condition,
			String text, AdminPaging paging) {
		
		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.getViewList(approval, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getProductCnt(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text) {
		
		AdminProductDao adminProductDao = session.getMapper(AdminProductDao.class);
		return adminProductDao.getProductCnt(approval, startDate, endDate, condition, text);
	}

	
}
