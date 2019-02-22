package com.sellent.web.dao;

import java.util.List; 

import com.sellent.web.entity.AdminConfigView;
import com.sellent.web.entity.AdminPaging;

public interface AdminConfigDao {

	List<AdminConfigView> getAdminConfigView(
			String role,
			String startDate,
			String endDate,
			String condition,
			String text,
			AdminPaging paging);
	
	int getAdminConfigCnt(
			String role,
			String startDate,
			String endDate,
			String condition,
			String text);
	
	int update(String id, String role);
	
}
