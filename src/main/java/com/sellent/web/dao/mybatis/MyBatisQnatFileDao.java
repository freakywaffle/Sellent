package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.ProductFileDao;
import com.sellent.web.dao.QnaDao;
import com.sellent.web.dao.QnaFileDao;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.QnaFile;

@Repository
public class MyBatisQnatFileDao implements QnaFileDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insert(QnaFile qnaFile) {
		// TODO Auto-generated method stub
		QnaFileDao qnaDao = session.getMapper(QnaFileDao.class);
		return qnaDao.insert(qnaFile);
	}

	@Override
	public List<QnaFile> get(int no) {
		QnaFileDao qnaDao = session.getMapper(QnaFileDao.class);
		return qnaDao.get(no);
	}


}
