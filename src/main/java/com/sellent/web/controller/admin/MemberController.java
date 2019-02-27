package com.sellent.web.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList; 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.sellent.web.dao.AdminMemberDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.PointConfig;
import com.sellent.web.entity.PointHistory;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.AdminMemberService;
import com.sellent.web.service.AdminPointService;

@Controller("adminMember")
@RequestMapping("/admin/member/")
public class MemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private AdminPointService adminPointService;
	
	@RequestMapping("member")
	public String member(
			@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "condition", defaultValue = "") String condition,
			@RequestParam(name = "text", defaultValue = "") String text,
			@RequestParam(name = "page", defaultValue = "1") int page, 
			Model model) {
		
		int cnt = adminMemberService.getMemberCnt(startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<Member> list = adminMemberService.getMemberList(startDate, endDate, condition, text, paging);
		List<PointConfig> pointList = adminPointService.getPointConfig();
		
		String query = "?startDate=" + startDate + "&endDate=" + endDate + "&condition=" + condition + "&text=" + text;
		
		model.addAttribute("list", list); 
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		model.addAttribute("pointList",pointList);
		
		return "admin.member.member";
	}

	@PostMapping("memberRemove")
	@ResponseBody
	public String memberRemove(@RequestParam(name = "arr") ArrayList<String> arr) {
		
		for (int i = 0; i < arr.size(); i++) {
			int result = adminMemberService.delete(arr.get(i));
		}
		
		return "ok";
	}
	
	@PostMapping("memberSkill")
	@ResponseBody
	public String memberSkill(@RequestParam(name = "memberId") String memberId) {
		
		List<String> skillList = adminMemberService.getSkillList(memberId);
		
		Gson gson = new Gson();
		String skill = gson.toJson(skillList);
		
		return skill;
	}
	
	@PostMapping("memberInsert")
	public String memberInsert(
			
			MultipartHttpServletRequest multipartHttpServletRequest
			) throws IllegalStateException, IOException {

		Member member = new Member();
		member.setId(multipartHttpServletRequest.getParameter("id"));
		member.setNickname(multipartHttpServletRequest.getParameter("nickname"));
		member.setPassword(multipartHttpServletRequest.getParameter("pwd"));
		member.setEmail(multipartHttpServletRequest.getParameter("email"));
		member.setSimple_introduction(multipartHttpServletRequest.getParameter("simple"));
		member.setDetail_introduction(multipartHttpServletRequest.getParameter("detail"));
		
//		String aa = multipartHttpServletRequest.getParameter("skill").replaceAll(" ", "");
//		
//		String[] skills = aa.split(",");
//		
//		for(int i=0; i<skills.length;i++) {
//			int resultSkill = adminMemberService.insertSkill(skills[i], member.getId());
//		}
		
		String filePath = "F:\\sellent\\profile\\"+member.getId()+"\\";
		
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("imageFile");
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdir();
		}
		
		for(int i =0; i<files.size(); i++) {
			member.setPhoto(files.get(i).getOriginalFilename());
			file = new File(filePath+files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);	// 객체에 저장된 경로로  파일을 전송한다
		}
		

		int result = adminMemberService.insert(member);

		return "redirect:member";
	}

	@GetMapping("point")
	public String point(
		@RequestParam(name = "condition", defaultValue = "") String condition,
		@RequestParam(name = "text", defaultValue = "") String text,
		@RequestParam(name = "page", defaultValue = "1") int page, 
		Model model) {
	
		int cnt = adminPointService.getPointCnt(condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);
		
		List<PointHistory> list = adminPointService.getPointHistory(condition, text, paging);

		List<PointConfig> pointList = adminPointService.getPointConfig();
		
		String query = "?condition=" + condition + "&text=" + text;
		
		model.addAttribute("list", list); 
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		model.addAttribute("pointList",pointList);
		
		return "admin.member.point";
	}
	
	@PostMapping("pointInsert")
	@ResponseBody 
	public String pointInsert(
			String id, String content, int point
			//String id, String content, String point
			) {
		
		int result = adminPointService.insert(id, content, point);
		
		return "ok";
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
