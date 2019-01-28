package com.sellent.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminBoard")
@RequestMapping("/admin/board/")
public class BoardController {

	@RequestMapping("category")
	public String category() {
		
		return "admin.board.category";
	}

	@RequestMapping("board")
	public String board() {
		
		return "admin.board.board";
	}
	
	@RequestMapping("sale")
	public String sale() {
		
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
