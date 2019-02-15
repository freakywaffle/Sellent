package com.sellent.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.QnaContent;
import com.sellent.web.entity.QnaFile;
import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;

public interface QnaService {

	List<QnaPaCategory> getOftenQnaList();
	List<QnaSubCategory> getOftenQnaSubList();
	List<QnaContent> getContent(String title);
	
	
	int insert(String email, String title, String content, List<QnaFile> files);
	//int insert(String email, String title, String content);

	Map<String, Object> getProductByNo(int no);
	
	
}
