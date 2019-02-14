package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductView;

public interface ProductDao {
	List<ProductView> getList();
	
	
	
	ProductView get(int no);
	int getRecentlyNo();
	int insert(Product product);
	int update(Product product);
	int delete(int no);
	int updateStarPointByNo(int no, double avgStarPoint);
}
