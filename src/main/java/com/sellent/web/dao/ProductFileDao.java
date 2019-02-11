package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.ProductFile;

public interface ProductFileDao {
	int insert(ProductFile productFile);
	List<ProductFile> get(int no);
}
