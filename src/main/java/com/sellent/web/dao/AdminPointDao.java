package com.sellent.web.dao;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.PointConfig;
import com.sellent.web.entity.PointHistory;

public interface AdminPointDao{
	
	List<PointHistory> getPointHistory(String condition, String text, AdminPaging paging);
	List<PointConfig> getPointConfig();
	
	int getPointCnt(String condition, String text);
	
	int insert(String id, String content, int point);
	
	int updateConfig(String content, int point, int use);
}
