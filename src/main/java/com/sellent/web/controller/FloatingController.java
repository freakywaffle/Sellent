package com.sellent.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/floating/")
public class FloatingController {
	
	
	@PostMapping("qna")
	@ResponseBody
	public String send() {
		
		
		
		return "";
	}
}
