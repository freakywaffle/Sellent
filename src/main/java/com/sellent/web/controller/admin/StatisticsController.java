package com.sellent.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminStatistics")
@RequestMapping("/admin/statistics/")
public class StatisticsController {

	@GetMapping("user")
	public String user() {
		
		return "admin.statistics.user";
	}
	
	@GetMapping("product")
	public String product() {
		
		return "admin.statistics.product";
	}
	
}
