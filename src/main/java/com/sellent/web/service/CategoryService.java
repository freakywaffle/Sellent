package com.sellent.web.service;

import java.util.List;  

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.CategoryView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.SubCategory;

public interface CategoryService {
	List<CategoryView> getViewList(int page, String parent, String sub, AdminPaging paging);

	List<ParentCategory> getParentList();
	List<SubCategory> getSubList();
	
	int getCategoryCnt(String parent,String sub);

	int insertParent(String parentValue);
	int insertSub(String parentValue, String subValue);

	int deleteParent(String parentLabel);
	int deleteSub(String parentLabel, String subLabel);
	
	int update(String parentBefore, String subBefore, String subAfter);
}