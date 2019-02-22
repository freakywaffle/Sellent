package com.sellent.web.dao;

import java.util.List;  

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.CategoryView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.ParentCategorySY;
import com.sellent.web.entity.SubCategory;

public interface CategoryDao {
	List<CategoryView> getViewList(int page, String parent, String sub, AdminPaging paging);
	
	List<ParentCategory> getParentList();
	List<ParentCategorySY> getParentCntList(String id);
	
	List<SubCategory> getSubList();
	
	List<SubCategory> getSubListByParent(String ParentName);
	
	int getCategoryCnt(String parentBefore,String subBefore);
	int getProductCnt(String parent, String sub);
	
	int insertParent(String parentValue);
	int insertSub(String parentValue, String subValue);

	int deleteParent(String parentLabel);
	int deleteSub(String parentLabel, String subLabel);
	
	int updateProduct(String subBefore, String subAfter);
}