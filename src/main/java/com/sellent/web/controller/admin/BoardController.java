package com.sellent.web.controller.admin;

import java.util.ArrayList; 
import java.util.List;   

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sellent.web.dao.AdminProductDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;
import com.sellent.web.entity.CategoryView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.AdminProductService;
import com.sellent.web.service.CategoryService;
import com.google.gson.Gson;

@Controller("adminBoard")
@RequestMapping("/admin/board/")
public class BoardController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private AdminProductService adminProductService;

	// list
	@GetMapping("category")
	public String category(
			@RequestParam(name="parent", defaultValue="") String parent, 
			@RequestParam(name="sub", defaultValue="")String sub,
			@RequestParam(name="page", defaultValue="1")int page,
			Model model) {

		int cnt = categoryService.getCategoryCnt(parent, sub);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);
		
		List<CategoryView> viewList = categoryService.getViewList(page,parent,sub,paging);
		List<ParentCategory> parentList = categoryService.getParentList();
		List<SubCategory> subList = categoryService.getSubList();
		
		model.addAttribute("viewList",viewList);
		model.addAttribute("parentList", parentList);
		model.addAttribute("subList", subList);
		model.addAttribute("paging",paging);
		model.addAttribute("parent",parent);
		model.addAttribute("sub",sub);
		
		return "admin.board.category";
	}

	@GetMapping("categoryModal")
	@ResponseBody
	public String categoryModal(Model model) {
		
		List<ParentCategory> parentList = categoryService.getParentList();
		List<SubCategory> subList = categoryService.getSubList();
		
		List list = new ArrayList();
		list.add(parentList);
		list.add(subList);
		
		Gson gson = new Gson();
		String parent = gson.toJson(list);
		
		return parent;
		
	}
	
	@PostMapping("parentInsert")
	@ResponseBody
	public String parentInsert(
			String parentValue, 
			Model model) {
		
		int result = categoryService.insertParent(parentValue);

		return "ok";
	}
	
	@PostMapping("parentDelete")
	@ResponseBody
	public String parentDelete(
			String parentLabel,
			Model model) {
		
		
		int result = categoryService.deleteParent(parentLabel);
		
		return "ok";
	}
	
	@PostMapping("subInsert")
	@ResponseBody
	public String subInsert(
			String parentValue,
			String subValue, 
			Model model) {
		
		int result = categoryService.insertSub(parentValue, subValue);

		return "ok";
	}

	@PostMapping("subDelete")
	@ResponseBody
	public String subDelete(
			String parentLabel,
			String subLabel,
			Model model) {
		
		int result = categoryService.deleteSub(parentLabel, subLabel);
		
		return "ok";
	}
	
	@PostMapping("categoryUpdate")
	@ResponseBody
	public String categoryUpdate(
			String parentBefore,
			String subBefore,
			String subAfter,
			Model model) {

		int result = categoryService.update(parentBefore, subBefore, subAfter);
		return "admin.board.category";
	}
	
	
	@RequestMapping("board")
	public String board() {
		
		return "admin.board.board";
	}

	 
	@GetMapping("sale")
	public String sale(
			@RequestParam(name="approval", defaultValue="") String approval,
			@RequestParam(name="startDate", defaultValue="") String startDate,
			@RequestParam(name="endDate", defaultValue="") String endDate,
			@RequestParam(name="condition", defaultValue="") String condition,
			@RequestParam(name="text", defaultValue="") String text,
			@RequestParam(name="page", defaultValue="1")int page,
			Model model) {
		
		int cnt = adminProductService.getProductCnt(approval, startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);
		
		List<AdminProductView> list = adminProductService.getViewList(approval, startDate, endDate, condition, text, paging);
		String query = 
				"?approval="+approval+"&startDate="+startDate
				+"&endDate="+endDate+"&condition="+condition+"&text="+text;

		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		model.addAttribute("query",query);
		
		return "admin.board.sale";
	}
	
	@RequestMapping("consult")
	public String consult() {
		
		return "admin.board.consult";
	}
	
	@RequestMapping("comment")
	public String comment() {
		
		return "admin.board.comment";
	}
	
	@RequestMapping("banner")
	public String banner() {
		
		return "admin.board.banner";
	}
}
