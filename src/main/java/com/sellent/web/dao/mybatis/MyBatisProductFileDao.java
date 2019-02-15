package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.ProductFileDao;
import com.sellent.web.entity.ProductFile;

@Repository
public class MyBatisProductFileDao implements ProductFileDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insert(ProductFile productFile) {
		// TODO Auto-generated method stub
		ProductFileDao productDao = session.getMapper(ProductFileDao.class);
		return productDao.insert(productFile);
	}

	@Override
	public List<ProductFile> get(int no) {
		ProductFileDao productDao = session.getMapper(ProductFileDao.class);
		return productDao.get(no);
	}

}
