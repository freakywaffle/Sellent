package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ReviewDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.ProductView;
import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;
import com.sellent.web.service.ProductService;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@GetMapping("list")
	public String list() {
		
		return "category.list";
	}
	
	@GetMapping("{no}")
	public String detail(@PathVariable("no") Integer no, Model model) {
		
		Map<String, Object> product = productService.getProductByNo(no);
		List<ReviewView> reviews = reviewDao.getListByProductNo(no, 10);
		model.addAttribute("map", product);
		if(reviews.size()!=0)
			model.addAttribute("reviews", reviews);
		
		return "category.detail";
	}
	
	
	@GetMapping("reg")
	public String reg() {
		return "category.reg";
	}
	
	private ArrayList<ProductFile> tempFiles;
	
	@PostMapping("reg")
	public String reg(Product product, Principal principal) {
		
		product.setWriterId(principal.getName());
		
		System.out.println(product);
		productService.insert(product, tempFiles);
		
		return "redirect:list";
	}
	
	@PostMapping("imageUp")
	@ResponseBody
	public String imageUp(@RequestParam("img") ArrayList<MultipartFile> files) throws IOException {
		tempFiles = new ArrayList<ProductFile>();
        String root = "E:\\sellent\\upload\\";
        int recentNo = productDao.getRecentlyNo()+1;
        String path = root+recentNo;
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }

		for(MultipartFile file : files) {
			
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			String fileName = file.getOriginalFilename();
			String saveName = now + "_" + file.getOriginalFilename();
			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveName);
			fos.write(data);
			fos.close();
			
			ProductFile pf = new ProductFile();
			pf.setName(fileName);
			pf.setSaveName(saveName);
			pf.setProductNo(recentNo);
			
			tempFiles.add(pf);
		}
		
		return "ok";
	}
	
	@PostMapping("{no}/review")
	@ResponseBody
	public String review(@PathVariable("no") Integer no, String json, Principal principal) {
		productService.regReview(no, json, principal);
		List<ReviewView> reviews = reviewDao.getListByProductNo(no, 10);
		String jsonArr = "{\"reviews\":["; 
		for(int i = 0; i<reviews.size();i++) {
			jsonArr+=reviews.get(i).toString();
			if(i != reviews.size()-1)
				jsonArr+=",";
		}
		jsonArr += "]";
		
		ProductView product = productDao.get(no);
		
		jsonArr += ", \"reviewCnt\":"+product.getReviewCnt();
		jsonArr += ", \"avgStarPoint\":"+product.getAvgStarPoint()+"}";
		
		
		System.out.println(jsonArr);
		return jsonArr;
	}
	
	@GetMapping("{no}/moreReview")
	@ResponseBody
	public String moreReview(@PathVariable("no") Integer no, @RequestParam int cnt) {
		List<ReviewView> reviews = reviewDao.getListByProductNo(no, cnt);
		String jsonArr = "{\"reviews\":["; 
		for(int i = 0; i<reviews.size();i++) {
			jsonArr+=reviews.get(i).toString();
			if(i != reviews.size()-1)
				jsonArr+=",";
		}
		jsonArr += "]";
		
		jsonArr += ", \"reviewCnt\":"+productDao.get(no).getReviewCnt()+"}";
		return jsonArr;
	}
	
	@GetMapping("{no}/like")
	@ResponseBody
	public String like(@PathVariable("no") Integer no) {
		System.out.println("in"+no);
		return "";
	}
	@GetMapping("{no}/delike")
	@ResponseBody
	public String delike(@PathVariable("no") Integer no) {
		System.out.println("del"+no);
		return "";
	}
	
	
}
