package com.sellent.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ProductFileDao;
import com.sellent.web.dao.ReviewDao;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.Review;

@Service
public class SellentProductService implements ProductService{

	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductFileDao productFileDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private ReviewDao reviewDao;
	
	
	@Override
	@Transactional
	public int insert(Product product, List<ProductFile> files) {
		
		productDao.insert(product);
		
		for(ProductFile pf : files) {
			
			productFileDao.insert(pf);
		}
		
		return 0;
	}


	@Override
	public Map<String, Object> getProductByNo(int no) {		
		Map<String, Object> map = new HashMap<String, Object>();

		Product product = productDao.get(no);
		List<ProductFile> files = productFileDao.get(no);
		Member member = memberDao.getMemberById(product.getWriterId());
		map.put("root", "/sellent/upload/");
		map.put("product", product);
		map.put("files", files);
		map.put("thumbnail", files.get(0).getSaveName());
		map.put("member", member);
		return map;
	}


	@Override
	public int regReview(String json) {
		// TODO Auto-generated method stub
		JsonParser parser = new JsonParser();
		Review review = new Review();
		review.setContent(
				parser.parse(json)
				.getAsJsonObject()
				.get("content")
				.getAsString());
		
		review.setProduct_no(
				parser.parse(json)
				.getAsJsonObject()
				.get("productNo")
				.getAsInt());
		
		review.setStarpoint(
				parser.parse(json)
				.getAsJsonObject()
				.get("starpoint")
				.getAsDouble());
		
		
		
		return reviewDao.insert(review);
	}
	
}
