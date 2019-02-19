package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminQnaDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Qna;

@Service
public class SellentAdminQnaService implements AdminQnaService{

	@Autowired
	private AdminQnaDao adminQnaDao;
	
	@Override
	public List<Qna> getQna(String state, String startDate, String endDate, String condition, String text,
			AdminPaging paging) {
		return adminQnaDao.getQna(state, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getQnaCnt(String state, String startDate, String endDate, String condition, String text) {
		return adminQnaDao.getQnaCnt(state, startDate, endDate, condition, text);
	}

	@Override
	public int delete(int no) {
		return adminQnaDao.delete(no);
	}

	@Override
	public int update(int state, int no) {
		return adminQnaDao.update(state, no);
	}
	

}
