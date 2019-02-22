package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminTotalDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminTotalView;

@Service
public class SellentAdminTotalService implements AdminTotalService{

	@Autowired
	private AdminTotalDao adminTotalDao;
	
	@Override
	public List<AdminTotalView> getTotalViewList(String state, String startDate, String endDate, String buyer,
			String seller, AdminPaging paging) {
		return adminTotalDao.getTotalViewList(state, startDate, endDate, buyer, seller, paging);
	}

	@Override
	public int getTotalViewCnt(String state, String startDate, String endDate, String buyer, String seller) {
		return adminTotalDao.getTotalViewCnt(state, startDate, endDate, buyer, seller);
	}

	@Override
	public int delete(int no) {
		return adminTotalDao.delete(no);
	}

}
