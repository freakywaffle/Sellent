package com.sellent.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ProductFileDao;
import com.sellent.web.dao.QnaDao;
import com.sellent.web.dao.QnaFileDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.Qna;
import com.sellent.web.entity.QnaContent;
import com.sellent.web.entity.QnaFile;
import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;

@Service
public class SellentQnaService implements QnaService{

	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private QnaFileDao qnaFileDao;
	
	


	@Override
	public Map<String, Object> getProductByNo(int no) {
		Qna qna = qnaDao.get(no);
		List<QnaFile> files = qnaFileDao.get(no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna", qna);
		map.put("files", files);
		return map;
	}



//문의 보내기
	@Override
	public int insert(String email, String title, String content, List<QnaFile> files) {
		//public int insert(String email, String title, String content) {
		// TODO Auto-generated method stub
		
		qnaDao.insert(email, title, content);
		for(QnaFile qf : files) {
			qnaFileDao.insert(qf);		
		}
		
		return 0;
	}




	@Override
	public List<QnaPaCategory> getOftenQnaList() {
		// TODO Auto-generated method stub

		List<QnaPaCategory> list = qnaDao.OftenQnaList();
		
		return list;
	}



	@Override
	public List<QnaSubCategory> getOftenQnaSubList() {
		// TODO Auto-generated method stub
		List<QnaSubCategory> list = qnaDao.OftenQnaSubList();
		
		return list;
	}



	@Override
	public List<QnaContent> getContent(String title) {
		// TODO Auto-generated method stub
		System.out.println("1 : "+title);
		List<QnaContent> list = qnaDao.getQnaContent(title);
		System.out.println(list);
		return list;
	}
	
}
