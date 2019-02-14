package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.SkillDao;

import com.sellent.web.entity.Member;
import com.sellent.web.entity.Skill;
import com.sellent.web.service.MemberService;


@Controller
@RequestMapping("/member/")
public class MemberController {
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SkillDao skillDao;
	
	
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
	public String editInfo(Principal principal, Model model) {
		Member member = memberDao.getMember(principal.getName());
		model.addAttribute("member",member);
		return "member.profile.editinfo";
	}
	@PostMapping("editInfo")
	public String editInfo(Principal principal, Member member) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setId(principal.getName());
		System.out.println(member.getPassword());
		System.out.println(member.getNickname());
		String pwd = encoder.encode(member.getPassword());
		member.setPassword(pwd);
		int select = memberDao.editData(member);
		return "redirect:./introduce";
	}
	 
	
	@GetMapping("introduce")
	public String introduce(Principal principal, Model model) {
		Member member = memberDao.getMember(principal.getName());
		List<Skill> skill = skillDao.select(principal.getName());
		model.addAttribute("member",member);
		model.addAttribute("skill",skill);
		System.out.println(member.getId());
		for (Skill sk : skill) {
			System.out.println(sk.getName());
		}
		return "member.profile.introduce";
	}
	
	@PostMapping("introduce")
	public String introduce(Principal principal, Member member) {
		member.setId(principal.getName());
		member.setSimple_introduction(member.getSimple_introduction());
		System.out.println("'simple_intro:' " + member.getSimple_introduction());
		member.setDetail_introduction(member.getDetail_introduction());
		System.out.println("'detail_intro:' " + member.getDetail_introduction());
		int updateIntro = memberDao.updateIntro(member);
		//memberService.insertMember(member, skill);
		return "redirect:login";
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
	
	 
	 @PostMapping("skill-send")
	 @ResponseBody
	 public String skillSend(Principal principal,String newSkill, Skill skill) {
		// System.out.println("'principal.getName()'"+principal.getName());
		 skill.setMemberId(principal.getName());
		 skill.setName(newSkill);
		 System.out.println("'newSkill': " + skill.getName());
		 int skillInsert = skillDao.insert(skill);
		 return newSkill;
	 }
	 
	 @PostMapping("delete-tech")
	 @ResponseBody
	 public String deleteTech(Principal principal, String deltech, Skill skill) {
		 skill.setMemberId(principal.getName());
		 skill.setName(deltech);
		 System.out.println("'delTech': "+skill.getName());
		 System.out.println("'delTech': "+skill.getMemberId());
		 
		 int skillDel = skillDao.skillDele(skill);
		 return deltech;
	 }

}
