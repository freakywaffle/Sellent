package com.sellent.web.service;

import java.util.List;

import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;

public interface ProductService {
	
	int insert(Product product, List<ProductFile> files);
	
	
}
