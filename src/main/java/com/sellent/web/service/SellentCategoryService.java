package com.sellent.web.service;

import java.util.List;   

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.CategoryDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.CategoryView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.SubCategory;

@Service
public class SellentCategoryService implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<CategoryView> getViewList(int page, String parent, String sub, AdminPaging paging) {

		return categoryDao.getViewList(page, parent, sub, paging);
	}


	@Override
	public int getCategoryCnt(String parent,String sub) {
		return categoryDao.getCategoryCnt(parent, sub);
	}

	@Override
	public List<ParentCategory> getParentList() {
		return categoryDao.getParentList();
	}

	@Override
	public List<SubCategory> getSubList() {
		return categoryDao.getSubList();
	}
	
	@Override
	public int insertParent(String parentValue) {
		return categoryDao.insertParent(parentValue);
	}

	@Override
	public int insertSub(String parentValue, String subValue) {
		return categoryDao.insertSub(parentValue, subValue);
	}


	@Override
	public int deleteParent(String parentLabel) {
		return categoryDao.deleteParent(parentLabel);
	}
	
	@Override
	public int deleteSub(String parentLabel, String subLabel) {
		return categoryDao.deleteSub(parentLabel, subLabel);
	}


	@Override
	public int update(String parentBefore, String subBefore, String subAfter) {
		
		int productCnt = categoryDao.getProductCnt(parentBefore, subBefore);
		
		if(productCnt != 0) {
			int a = categoryDao.insertSub(parentBefore, subAfter);
			int b = categoryDao.updateProduct(subBefore, subAfter);
			int c = categoryDao.deleteSub(parentBefore, subBefore);
		}

		return productCnt;
	}

}