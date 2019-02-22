package com.sellent.web.service;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminPersonView;

public interface AdminPersonService {
	List<AdminPersonView> getPersonViewList(
			String type,
			String state,
			String startDate,
			String endDate,
			String condition,
			String text,
			AdminPaging paging);
	
	int getPersonViewCnt(
			String type,
			String state,
			String startDate,
			String endDate,
			String condition,
			String text);
}
