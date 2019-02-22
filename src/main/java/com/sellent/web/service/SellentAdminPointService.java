package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminPointDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.PointConfig;
import com.sellent.web.entity.PointHistory;

@Service
public class SellentAdminPointService implements AdminPointService{

	@Autowired
	private AdminPointDao adminPointDao;
	
	@Override
	public List<PointHistory> getPointHistory(String condition, String text, AdminPaging paging) {
		return adminPointDao.getPointHistory(condition, text, paging);
	}

	@Override
	public List<PointConfig> getPointConfig() {
		return adminPointDao.getPointConfig();
	}

	@Override
	public int getPointCnt(String condition, String text) {
		return adminPointDao.getPointCnt(condition, text);
	}

	@Override
	public int insert(String id, String content, int point) {
		return adminPointDao.insert(id, content, point);
	}

	@Override
	public int updateConfig(String content, int point, int use) {
		return adminPointDao.updateConfig(content, point, use);
	}

}
