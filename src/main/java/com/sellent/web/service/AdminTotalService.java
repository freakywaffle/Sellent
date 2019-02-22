package com.sellent.web.service;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminTotalView;

public interface AdminTotalService {
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
