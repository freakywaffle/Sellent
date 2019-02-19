package com.sellent.web.dao;

import java.util.List; 

import org.springframework.ui.Model;

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;

public interface AdminProductDao {
	List<AdminProductView> getBoard(
			String parent, String sub, int sale, String startDate, String endDate,
			String condition, String text, AdminPaging paging);
	
	List<AdminProductView> getSale(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text,
			AdminPaging paging);
	
	int getBoardCnt(String parent, String sub, int sale, String startDate, String endDate,
			String condition, String text);
	
	int getSaleCnt(
			String approval,
			String startDate,
			String endDate,
			String condition,
			String text);
	
	
	int update(String approval, int no);
	int delete(int no);
}
