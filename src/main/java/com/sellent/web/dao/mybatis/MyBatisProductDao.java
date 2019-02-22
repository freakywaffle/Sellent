package com.sellent.web.dao.mybatis;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.ProductDao;

import com.sellent.web.entity.LikeView;

import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductView;


@Repository
public class MyBatisProductDao implements ProductDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ProductView> getList() {
		
		return getList("", "", 0, 7);
	}
	
	@Override
	public List<ProductView> getList(String parent, int start, int cnt) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getList(parent, start, cnt);
	}

	@Override
	public List<ProductView> getList(String parent, String sub, int start, int cnt) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getList(parent, sub, start, cnt);
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
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.update(product);
	}

	@Override
	public int delete(int no) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.delete(no);
	}

	@Override
	public int updateStarPointByNo(int no, double avgStarPoint) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.updateStarPointByNo(no, avgStarPoint);
	}

	@Override
	public List<ProductView> getListById(String id, int page) {
		
		return getListById(id, page, 0);
	}
	@Override
	public List<ProductView> getListById(String id, int page, int selector) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		//System.out.println(id);
		//System.out.println(page);
		//System.out.println(selector);
		page = (page-1)*5;
		return productDao.getListById(id,page,selector);
	}

	@Override
	public int getAllCntById(String id, int selector) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getAllCntById(id, selector);
	}

	

	public int getAllCnt() {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getAllCnt();
	}


	@Override
	public Double getListToStatic(String id, int selector, int pmonth, int pyear) {
		// TODO Auto-generated method stub
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getListToStatic(id,selector,pmonth, pyear);
	}



	@Override
	public List<ProductView> getLikeView(int no) {
		// TODO Auto-generated method stub
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getLikeView(no);
	}

	@Override
	public List<ProductView> getLikeView1(int no, String category) {
		// TODO Auto-generated method stub
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getLikeView1(no,category);
	}

	@Override
	public List<ProductView> getListByFilter(String parent, String sub, int sellChk, int start, int cnt) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		
		return productDao.getListByFilter(parent, sub, sellChk, start, cnt);
	}
	@Override
	public List<ProductView> getList(int start, int cnt) {
		
		ProductDao productDao = session.getMapper(ProductDao.class);
		return productDao.getList(start,cnt);
	}

	@Override
	public List<ProductView> getListBySearch(String keyword, List<ParentCategory> parentCategory, int sellChk, int start, int cnt) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		return productDao.getListBySearch(keyword, parentCategory, sellChk, start, cnt);
	}

	@Override
	public List<ProductView> getListBySearchAll(String keyword, List<ParentCategory> parentCategory, int sellChk) {
		ProductDao productDao = session.getMapper(ProductDao.class);
		return productDao.getListBySearchAll(keyword, parentCategory, sellChk);

	}


	
}
