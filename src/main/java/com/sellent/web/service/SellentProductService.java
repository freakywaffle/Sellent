package com.sellent.web.service;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.sellent.web.dao.LikeDao;
import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.PointHistoryDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ProductFileDao;
import com.sellent.web.dao.ReviewDao;
import com.sellent.web.entity.Like;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.PointHistory;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.ProductView;
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
	@Autowired
	private LikeDao likeDao;
	@Autowired
	private PointHistoryDao pointHistoryDao;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insert(Product product, List<ProductFile> files) {
		
		String thumbnail = product.getThumbnail();
		System.out.println(thumbnail);
		
		for(ProductFile pf : files) {
			if(pf.getName().equals(thumbnail)) 
				product.setThumbnail(pf.getSaveName());			
		}
		
		productDao.insert(product);
		
		for(ProductFile pf : files) {
			
			productFileDao.insert(pf);				
		}
		
		return 0;
	}


	@Override
	public Map<String, Object> getProductByNo(int no) {		
		Map<String, Object> map = new HashMap<String, Object>();

		ProductView product = productDao.get(no);
		List<ProductFile> files = productFileDao.get(no);
		Member member = memberDao.getMember(product.getWriterId());
		map.put("root", "/sellent/upload/");
		map.put("product", product);
		map.put("files", files);
		if(files.size() != 0)
			map.put("thumbnail", files.get(0).getSaveName());
		map.put("member", member);
		
		return map;
	}


	@Override
	@Transactional
	public int regReview(Integer no, String json, Principal principal) {
		JsonParser parser = new JsonParser();
		Review review = new Review();
		review.setProduct_no(no);
		review.setWriter_id(principal.getName());
		
		review.setContent(
				parser.parse(json)
				.getAsJsonObject()
				.get("content")
				.getAsString());
		
		review.setStarpoint(
				parser.parse(json)
				.getAsJsonObject()
				.get("starpoint")
				.getAsDouble());
		reviewDao.insert(review);
		
		double avgStarPoint = reviewDao.getAvgStarPointByProductNo(no);
		productDao.updateStarPointByNo(no, avgStarPoint);
		
		
		memberDao.addPoint(principal.getName(), 100);
		
		PointHistory pointHistory = new PointHistory();
		pointHistory.setMember_id(principal.getName());
		pointHistory.setContent("리뷰등록");
		pointHistory.setPoint(100);
		pointHistoryDao.insert(pointHistory);
		
		return 0;
	}
	
}
