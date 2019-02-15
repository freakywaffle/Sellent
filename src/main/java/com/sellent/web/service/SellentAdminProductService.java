package com.sellent.web.service;

import java.util.List; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminProductDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;


@Service
public class SellentAdminProductService implements AdminProductService{

	@Autowired
	private AdminProductDao adminProductDao;
	
	@Override
	public List<AdminProductView> getViewList(String approval, String startDate, String endDate, String condition,
			String text, AdminPaging paging) {
		return adminProductDao.getViewList(approval, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getProductCnt(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text) {
		return adminProductDao.getProductCnt(approval, startDate, endDate, condition, text);
	}

	
	
}
