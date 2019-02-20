package com.sellent.web.dao.mybatis;

import java.util.List;   

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.CategoryDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.SearchDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.CategoryView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.ParentCategorySY;
import com.sellent.web.entity.SearchQna;
import com.sellent.web.entity.SubCategory;


@Repository
public class MyBatisSearchDao implements SearchDao{

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<SearchQna> getViewList(String search) {
		// TODO Auto-generated method stub
		System.out.println("마이바티스"+search);
		SearchDao searchDao = session.getMapper(SearchDao.class);
		System.out.println("마이바티스"+searchDao);
		
		return searchDao.getViewList(search);
	}
	
	
	
}
