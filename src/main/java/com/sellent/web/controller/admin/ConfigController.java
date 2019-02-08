package com.sellent.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminConfig")
@RequestMapping("/admin/config/")
public class ConfigController {

	@RequestMapping("admin")
	public String admin() {
		
		return "admin.config.admin";
	}
	
	@RequestMapping("point")
	public String point() {
		
		return "admin.config.point";
	}
	
	@RequestMapping("banner")
	public String banner() {
		
		return "admin.config.banner";
	}
}
