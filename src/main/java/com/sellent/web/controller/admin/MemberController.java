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

	
}
