package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.Product;
import com.sellent.web.entity.Qna;
import com.sellent.web.entity.QnaContent;
import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;

public interface QnaDao {
	List<Qna> getList();
	
	
	
	Qna get(int no);
	int getRecentlyNo();
	int insert(String email, String title, String content);
	int update(Qna qna);
	int delete(int no);



	List<QnaPaCategory> OftenQnaList();
	List<QnaSubCategory> OftenQnaSubList();
	List<QnaContent> getQnaContent(String title);




}
