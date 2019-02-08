package com.sellent.web.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sellent.web.dao.MemberDao;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
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
	@GetMapping("statics")
	public String statics() {
		
		return "member.management.static";
	}


	@GetMapping("messageList")
	public String messageList() {
		
		return "member.message.list";
	}
	
	@GetMapping("messageDetail")
	public String messageDetail() {
		
		return "member.message.detail";
	}
	
	@GetMapping("editInfo")
	public String editInfo() {
		
		return "member.profile.editinfo";
	}
	
	
	@GetMapping("introduce")
	public String introduce() {
		
		return "member.profile.introduce";
	}
	
	@GetMapping("point")
	public String point() {
		
		return "member.profile.point";
	}
	
	@GetMapping("review")
	public String review() {
		
		return "member.review.list";
	}
	
	@GetMapping("mypage")
	public String mypage() {
		
		return "member.mypage.index";
	}
	
	@GetMapping("my_bookmarks")
	public String bookmarks() {
		
		return "member.bookmarks";
	}
	
	
	 @PostMapping("idchk")
	 @ResponseBody
	 public String idchk(String id) {
		/* System.out.println("id"+id); */
		 System.out.println(id);
		int select = memberDao.select(id);
		 
		 return String.valueOf(select);
	 }
}
