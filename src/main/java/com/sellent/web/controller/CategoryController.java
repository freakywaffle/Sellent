package com.sellent.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.service.ProductService;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("list")
	public String list() {
		
		return "category.list";
	}
	
	@GetMapping("detail")
	public String detail() {
		
		return "category.detail";
	}
	
	@GetMapping("reg")
	public String reg() {
		return "category.reg";
	}
	@PostMapping("reg")
	public String reg(Product product) {
		
		product.setWriterId("khh111");
		List<ProductFile> files = new ArrayList<ProductFile>();
		System.out.println(product);
		productService.insert(product, files);
		
		return "redirect:list";
	}
}
