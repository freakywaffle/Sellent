package com.sellent.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminHome")
@RequestMapping("/admin")
public class HomeController {

	@RequestMapping("")
	public String home() {
		return "admin.member.member";
		
	}
	
}
