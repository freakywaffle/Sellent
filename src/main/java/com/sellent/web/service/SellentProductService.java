package com.sellent.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ProductFileDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;

@Service
public class SellentProductService implements ProductService{

	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductFileDao productFileDao;
	
	
	@Override
	public int insert(Product product, List<ProductFile> files) {
		
		productDao.insert(product);
		
		for(ProductFile pf : files) {
			
			productFileDao.insert(pf);
		}
		
		return 0;
	}


	@Override
	public Map<String, Object> getProductByNo(int no) {
		Product product = productDao.get(no);
		List<ProductFile> files = productFileDao.get(no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		map.put("files", files);
		return map;
	}
	
}
