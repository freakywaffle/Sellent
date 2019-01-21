package com.sellent.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	@GetMapping("list")
	public String list() {
		
		return "category.list";
	}
}
