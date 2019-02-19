package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminQnaDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Qna;

@Repository
public class MyBatisAdminQnaDao implements AdminQnaDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Qna> getQna(String state, String startDate, String endDate, String condition, String text,
			AdminPaging paging) {
		AdminQnaDao adminQnaDao = session.getMapper(AdminQnaDao.class);
		return adminQnaDao.getQna(state, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getQnaCnt(String state, String startDate, String endDate, String condition, String text) {
		AdminQnaDao adminQnaDao = session.getMapper(AdminQnaDao.class);
		return adminQnaDao.getQnaCnt(state, startDate, endDate, condition, text);
	}

	@Override
	public int delete(int no) {
		AdminQnaDao adminQnaDao = session.getMapper(AdminQnaDao.class);
		return adminQnaDao.delete(no);
	}

	@Override
	public int update(int state, int no) {
		AdminQnaDao adminQnaDao = session.getMapper(AdminQnaDao.class);
		return adminQnaDao.update(state, no);
	}
	
}
