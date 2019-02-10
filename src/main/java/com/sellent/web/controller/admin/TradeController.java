package com.sellent.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminTrade")
@RequestMapping("/admin/trade/")
public class TradeController {

	@RequestMapping("total")
	public String member() {
		
		return "admin.trade.total";
	}

	@RequestMapping("person")
	public String person() {
		
		return "admin.trade.person";
	}
	
}
