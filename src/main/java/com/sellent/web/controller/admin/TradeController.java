package com.sellent.web.controller.admin;

import java.util.ArrayList; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminPersonView;
import com.sellent.web.entity.AdminProductView;
import com.sellent.web.entity.AdminTotalView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.AdminPersonService;
import com.sellent.web.service.AdminTotalService;

@Controller("adminTrade")
@RequestMapping("/admin/trade/")
public class TradeController {

	@Autowired
	AdminTotalService adminTradeService;

	@Autowired
	AdminPersonService adminPersonService;

	@RequestMapping("total")
	public String member(@RequestParam(name = "state", defaultValue = "") String state,
			@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "buyer", defaultValue = "") String buyer,
			@RequestParam(name = "seller", defaultValue = "") String seller,
			@RequestParam(name = "page", defaultValue = "1") int page, Model model) {

		int cnt = adminTradeService.getTotalViewCnt(state, startDate, endDate, buyer, seller);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<AdminTotalView> list = adminTradeService.getTotalViewList(state, startDate, endDate, buyer, seller,
				paging);
		String query = "?state=" + state + "&startDate=" + startDate + "&endDate=" + endDate + "&buyer=" + buyer
				+ "&seller=" + seller;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);

		return "admin.trade.total";
	}

	@PostMapping("totalRemove")
	@ResponseBody
	public String removeTotal(@RequestParam(name = "arr") ArrayList<Integer> arr) {
		for (int i = 0; i < arr.size(); i++) {

			int result = adminTradeService.delete(arr.get(i));
		}
		return "ok";
	}

	@RequestMapping("person")
	public String person(@RequestParam(name = "type", defaultValue = "") String type,
			@RequestParam(name = "state", defaultValue = "") String state,
			@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "condition", defaultValue = "") String condition,
			@RequestParam(name = "text", defaultValue = "") String text,
			@RequestParam(name = "page", defaultValue = "1") int page, Model model) {

		System.out.println(type);

		int cnt = adminPersonService.getPersonViewCnt(type, state, startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<AdminPersonView> list = adminPersonService.getPersonViewList(type, state, startDate, endDate, condition,
				text, paging);

		String query = "?type=" + type + "&state=" + state + "&startDate=" + startDate + "&endDate=" + endDate
				+ "&condition=" + condition + "$text" + text;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);

		return "admin.trade.person";
	}

}
