package com.sellent.web.dao;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;

public interface AdminProductDao {

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
}
