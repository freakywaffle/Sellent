package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.QnaDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.Qna;
import com.sellent.web.entity.QnaContent;
import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;


@Repository
public class MyBatisQnaDao implements QnaDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Qna> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna get(int no) {
		// TODO Auto-generated method stub
		QnaDao qnaDao = session.getMapper(QnaDao.class);
		
		return qnaDao.get(no);
	}
	
	@Override
	public int getRecentlyNo() {
		// TODO Auto-generated method stub
		QnaDao qnaDao = session.getMapper(QnaDao.class);
		
		return qnaDao.getRecentlyNo();
	}

	@Override
	public int insert(String email, String title, String content) {
		// TODO Auto-generated method stub
		
		QnaDao qnaDao = session.getMapper(QnaDao.class);
		
		return qnaDao.insert(email, title, content);
	}

	@Override
	public int update(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QnaPaCategory> OftenQnaList() {
		// TODO Auto-generated method stub
		QnaDao qnaDao = session.getMapper(QnaDao.class);
		
		return qnaDao.OftenQnaList();
	}

	@Override
	public List<QnaSubCategory> OftenQnaSubList() {
		// TODO Auto-generated method stub
		QnaDao qnaDao = session.getMapper(QnaDao.class);
		
		return qnaDao.OftenQnaSubList();
	}

	@Override
	public List<QnaContent> getQnaContent(String title) {
		// TODO Auto-generated method stub
		System.out.println("2 : "+title);
	QnaDao qnaDao = session.getMapper(QnaDao.class);
		
		return qnaDao.getQnaContent(title);
	}
	


	
}
