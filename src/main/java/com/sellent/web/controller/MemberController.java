package com.sellent.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@GetMapping("login")
	public String login() {
		
		return "member.login";
	}
	@GetMapping("join")
	public String join() {
		
		return "member.join";
	}
	
	@GetMapping("findInfo")
	public String findInfo() {
		
		return "member.findInfo";
	}
	
	@GetMapping("project")
	public String project() {
		
		return "member.management.project";
	}
	
	@GetMapping("history")
	public String history() {
		
		return "member.management.history";
	}
}