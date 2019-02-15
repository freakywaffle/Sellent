package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductView;


@Repository
public class MyBatisProductDao implements ProductDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ProductView> getList() {
		
		return getList(0, 7);
	}
	
	@Override
	public List<ProductView> getList(int start, int cnt) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getList(start, cnt);
	}

	@Override
	public ProductView get(int no) {
		// TODO Auto-generated method stub
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.get(no);
	}
	
	@Override
	public int getRecentlyNo() {
		// TODO Auto-generated method stub
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getRecentlyNo();
	}

	@Override
	public int insert(Product product) {
		// TODO Auto-generated method stub
		
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.insert(product);
	}

	@Override
	public int update(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStarPointByNo(int no, double avgStarPoint) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.updateStarPointByNo(no, avgStarPoint);
	}

	@Override
	public int getAllCnt() {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getAllCnt();
	}


	
}
