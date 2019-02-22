package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminPersonDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminPersonView;

@Service
public class SellentAdminPersonService implements AdminPersonService{

	@Autowired
	AdminPersonDao adminPersonDao;
	
	@Override
	public List<AdminPersonView> getPersonViewList(String type, String state, String startDate, String endDate,
			String condition, String text, AdminPaging paging) {
		return adminPersonDao.getPersonViewList(type, state, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getPersonViewCnt(String type, String state, String startDate, String endDate, String condition,
			String text) {
		return adminPersonDao.getPersonViewCnt(type, state, startDate, endDate, condition, text);
	}

}
