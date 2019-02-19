package com.sellent.web.service;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Qna;

public interface AdminQnaService {
	List<Qna> getQna(
			String state, 
			String startDate, 
			String endDate, 
			String condition, 
			String text, 
			AdminPaging paging);
	
	int getQnaCnt(
			String state, 
			String startDate, 
			String endDate, 
			String condition, 
			String text);
	
	int delete(int no);
	int update(int state, int no);
}
