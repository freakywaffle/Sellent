package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminPersonDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminPersonView;


@Repository
public class MaBatisAdminPersonDao implements AdminPersonDao{

	@Autowired
	SqlSessionTemplate sessison;
	
	@Override
	public List<AdminPersonView> getPersonViewList(String type, String state, String startDate, String endDate,
			String condition, String text, AdminPaging paging) {
		
		AdminPersonDao adminPersonDao = sessison.getMapper(AdminPersonDao.class);
		
		return adminPersonDao.getPersonViewList(type, state, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getPersonViewCnt(String type, String state, String startDate, String endDate, String condition,
			String text) {
		AdminPersonDao adminPersonDao = sessison.getMapper(AdminPersonDao.class);
		
		return adminPersonDao.getPersonViewCnt(type, state, startDate, endDate, condition, text);
	}

}
