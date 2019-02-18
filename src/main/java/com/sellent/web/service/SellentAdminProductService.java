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
	public List<AdminProductView> getBoard(String parent, String sub, int sale, String startDate,
			String endDate, String condition, String text, AdminPaging paging) {
		return adminProductDao.getBoard(parent, sub, sale, startDate, endDate, condition, text, paging);
	}

	@Override
	public List<AdminProductView> getSale(String approval, String startDate, String endDate, String condition,
			String text, AdminPaging paging) {
		return adminProductDao.getSale(approval, startDate, endDate, condition, text, paging);
	}

	@Override
	public int getBoardCnt(String parent, String sub, int sale, String startDate, String endDate,
			String condition, String text) {
		return adminProductDao.getBoardCnt(parent, sub, sale, startDate, endDate, condition, text);
	}

	@Override
	public int getSaleCnt(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text) {
		return adminProductDao.getSaleCnt(approval, startDate, endDate, condition, text);
	}

	@Override
	public int update(String approval, int no) {
		return adminProductDao.update(approval, no);
	}

	@Override
	public int delete(int no) {
		return adminProductDao.delete(no);
	}
	
}
