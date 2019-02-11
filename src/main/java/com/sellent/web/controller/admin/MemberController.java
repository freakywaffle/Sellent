package com.sellent.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminMember")
@RequestMapping("/admin/member/")
public class MemberController {

	@RequestMapping("member")
	public String member() {
		
		return "admin.member.member";
	}

	@RequestMapping("point")
	public String point() {
		
		return "admin.member.point";
	}
	
	@RequestMapping("chat")
	public String chat() {
		
		return "admin.member.chat";
	}
	
	@RequestMapping("state")
	public String state() {
		
		return "admin.member.state";
	}
	
}
