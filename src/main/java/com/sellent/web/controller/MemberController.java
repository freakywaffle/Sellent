package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
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

import com.google.gson.Gson;
import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.SkillDao;


import com.sellent.web.entity.Member;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductView;
import com.sellent.web.entity.Skill;
import com.sellent.web.service.MemberService;


@Controller
@RequestMapping("/member/")
public class MemberController {
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SkillDao skillDao;
	
	@Autowired
	private ProductDao productDao;
	
	
	@GetMapping("project")
	public String project(Principal principal, Model model, @RequestParam(value="p" ,defaultValue="1") int page, @RequestParam(value="optionValue", defaultValue="0")Integer selector, Product product) {
		System.out.println("selectornum: " + selector);
		List<ProductView> showPage = productDao.getListById(principal.getName(),page, selector);		
		int allCnt = productDao.getAllCntById(principal.getName(),selector);
		System.out.println("now Page: " + page);
		System.out.println("total page: " +allCnt );
		int num=5; //화면에 보여질 페이지 번호의 갯수
		//끝 페이지 번호
		int endpage;
		endpage = (int)(Math.ceil((double)page/(double)num)*(double)num);
		System.out.println("endpage: " +endpage);
		
		//시작페이지번호
				int startpage= (endpage-num);
				System.out.println("startpage: "+startpage);
				
		//마지막 페이지 번호
		int tempendpage = (int)(Math.ceil((double)allCnt/(double)num));
		System.out.println("tempendpage: " +tempendpage);
		if (endpage > tempendpage) {
			endpage = tempendpage;
			System.out.println("endpage2:" + endpage);
		}
		
		
		
		//이전버튼 생성 여부
		boolean prev = startpage == 0 ? false:true;
		System.out.println("prevbutton 여부: " + prev);
		//다음버튼 생성 여부
		boolean next = endpage * 5 >= allCnt ? false:true;
		System.out.println("nextbutton 여부: " + next);
		
		model.addAttribute("product",showPage);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("tempendpage",tempendpage);
		model.addAttribute("page",page);
		model.addAttribute("allCnt",allCnt);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
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
	
	@PostMapping("sendStatic")
	@ResponseBody
	public String sendStatic(Principal principal, Model model,  @RequestParam(value="optionValue", defaultValue="0")Integer selector, Product product) {
		Date date = new Date();
        SimpleDateFormat sdformat = new SimpleDateFormat("MM");
        SimpleDateFormat sdformat2 = new SimpleDateFormat("YYYY");

		Calendar cal = Calendar.getInstance();

        int month = Calendar.MONTH;
        
        System.out.println(month);
		
        List<List<ProductView>> showStatic = new ArrayList<List<ProductView>>();
        Double [][] arr = new Double[4][2];
        for(int i =0 ; i<4 ;i++) {
        	cal.setTime(date);
        	cal.add(month, -i);
        	int pmonth = Integer.parseInt(sdformat.format(cal.getTime()));
    		int pyear = Integer.parseInt(sdformat2.format(cal.getTime()));
        	System.out.println(i+"월: "+pmonth+"년도" + pyear);
        	
        	System.out.println("principal:" + principal);
        	System.out.println("selector" + selector);
        	Double ss = productDao.getListToStatic(principal.getName(),selector,pmonth,  pyear);
        	System.out.println(ss);
        	arr[i][0] = Double.valueOf(pmonth);
        	arr[i][1]= ss;
        	
        }
        
        Gson gson = new Gson();
        String json = gson.toJson(arr);
        	
		return json;
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
		//smemberService.insertMember(member, skill);
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
