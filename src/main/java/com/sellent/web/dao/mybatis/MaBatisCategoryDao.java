package com.sellent.web.dao.mybatis;

import java.util.List;    

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.CategoryDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.CategoryView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.SubCategory;


@Repository
public class MaBatisCategoryDao implements CategoryDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<CategoryView> getViewList(int page, String parent, String sub, AdminPaging paging) {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		
		return categoryDao.getViewList(page, parent,sub, paging);
	}

	@Override
	public int getCategoryCnt(String parent,String sub) {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		
		return categoryDao.getCategoryCnt(parent, sub);
	}

	@Override
	public List<ParentCategory> getParentList() {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		return categoryDao.getParentList();
	}

	@Override
	public List<SubCategory> getSubList() {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		return categoryDao.getSubList();
	}

	@Override
	public int insertParent(String parentValue) {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		return categoryDao.insertParent(parentValue);
	}

	@Override
	public int insertSub(String parentValue, String subValue) {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		return categoryDao.insertSub(parentValue, subValue);
	}


	@Override
	public int deleteParent(String parentLabel) {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		return categoryDao.deleteParent(parentLabel);
	}

	@Override
	public int deleteSub(String parentLabel, String subLabel) {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		return categoryDao.deleteSub(parentLabel, subLabel);
	}

	@Override
	public int update(String parentBefore, String subBefore, String subAfter) {
		CategoryDao categoryDao = session.getMapper(CategoryDao.class);
		return categoryDao.update(parentBefore, subBefore, subAfter);
	}
	
	
}
