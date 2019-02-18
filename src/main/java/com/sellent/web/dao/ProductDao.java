package com.sellent.web.dao;

import java.security.Principal;
import java.util.List;

import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductView;

public interface ProductDao {

	List<ProductView> getLikeView(int no);
	
	List<ProductView> getList();

	List<ProductView> getListById(String id, int page);
	List<ProductView> getListById(String id, int page, int selector);

	List<ProductView> getList(int start, int cnt);
	Double getListToStatic(String id, int selector, int pmonth, int pyear);

	List<ProductView> getList(String parent, int start, int cnt);
	List<ProductView> getList(String parent, String sub, int start, int cnt);

	ProductView get(int no);
	
	int getAllCnt();
	int getRecentlyNo();
	int insert(Product product);
	int update(Product product);
	int delete(int no);
	int updateStarPointByNo(int no, double avgStarPoint);
	int getAllCntById(String id, int selector);

}
