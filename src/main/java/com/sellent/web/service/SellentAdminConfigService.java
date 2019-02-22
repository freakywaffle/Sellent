package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminConfigDao;
import com.sellent.web.entity.AdminConfigView;
import com.sellent.web.entity.AdminPaging;

@Service
public class SellentAdminConfigService implements AdminConfigService{
	
	@Autowired
	AdminConfigDao adminConfigDao;

	@Override
	public List<AdminConfigView> getAdminConfigView(String role, String startDate, String endDate, String condition,
			String text, AdminPaging paging) {
		return adminConfigDao.getAdminConfigView(role, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getAdminConfigCnt(String role, String startDate, String endDate, String condition, String text) {
		return adminConfigDao.getAdminConfigCnt(role, startDate, endDate, condition, text);
	}

	@Override
	public int update(String id, String role) {
		return adminConfigDao.update(id, role);
	}
	
	
}
