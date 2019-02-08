package com.sellent.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;

@Service
public class SellentProductService implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public int insert(Product product, List<ProductFile> files) {
		
		productDao.insert(product);
		
		
		return 0;
	}
	
}
