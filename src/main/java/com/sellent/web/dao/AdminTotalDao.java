package com.sellent.web.dao;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminTotalView;

public interface AdminTotalDao {

	List<AdminTotalView> getTotalViewList(
			String state, 
			String startDate, 
			String endDate, 
			String buyer, 
			String seller, 
			AdminPaging paging);
	
	int getTotalViewCnt(
			String state, 
			String startDate, 
			String endDate, 
			String buyer, 
			String seller);
	
	int delete(int no);
	
}
