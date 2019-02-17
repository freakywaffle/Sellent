package com.sellent.web.service;

import java.util.List; 

import com.sellent.web.dao.AdminProductDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;

public interface AdminProductService {
	List<AdminProductView> getViewList(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text,
			AdminPaging paging);
	
	int getProductCnt(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text);
	int update(String approval, int no);
	int delete(int no);
}
