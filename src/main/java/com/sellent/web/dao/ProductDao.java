package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.Product;

public interface ProductDao {
	List<Product> getList();
	
	Product get(int no);
	int insert(Product product);
	int update(Product product);
	int delete(int no);
}
