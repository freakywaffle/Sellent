package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminTotalDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminTotalView;

@Repository
public class MyBatisAdminTotalDao implements AdminTotalDao{
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<AdminTotalView> getTotalViewList(String state, String startDate, String endDate, String buyer,
			String seller, AdminPaging paging) {
		AdminTotalDao adminTradeDao = session.getMapper(AdminTotalDao.class);
		return adminTradeDao.getTotalViewList(state, startDate, endDate, buyer, seller, paging);
	}

	@Override
	public int getTotalViewCnt(String state, String startDate, String endDate, String buyer, String seller) {
		AdminTotalDao adminTradeDao = session.getMapper(AdminTotalDao.class);
		return adminTradeDao.getTotalViewCnt(state, startDate, endDate, buyer, seller);
	}

	@Override
	public int delete(int no) {
		AdminTotalDao adminTradeDao = session.getMapper(AdminTotalDao.class);
		return adminTradeDao.delete(no);
	}
	
	
	
}
