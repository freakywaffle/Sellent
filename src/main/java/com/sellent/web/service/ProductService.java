package com.sellent.web.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;

public interface ProductService {
	
	int insert(Product product, List<ProductFile> files);
	Map<String, Object> getProductByNo(int no);
	int regReview(Integer no, String json, Principal principal);
	
	int update(Product product, List<ProductFile> files);
}
