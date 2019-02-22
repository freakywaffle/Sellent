package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.entity.Member;
import com.sellent.web.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender javaMailSender;


	
	@GetMapping("index")
	public String index() {
		
	
		return "index";
	}
	
	
	@GetMapping("login")
	public String login(HttpServletRequest request) {
		
		String prevPage = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", prevPage);
		System.out.println(prevPage);
		
		return "member.login";
	}
	
	@GetMapping("join")
	public String join() {
		
		return "member.join";
	}
	@PostMapping("join")
	public String join(Member member, String skill, @RequestParam("profile") MultipartFile filedata) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setPhoto(filedata.getOriginalFilename());
		String pwd = encoder.encode(member.getPassword());
		System.out.println(pwd);
		member.setPassword(pwd);
		memberService.insertMember(member, skill, filedata);
		
		
		return "redirect:login";
	}

	
	@PostMapping("idchk")
	 @ResponseBody
	 public String idchk(String id) {
		/* System.out.println("id"+id); */
		 System.out.println(id);
		int select = memberDao.select(id);
		 
		 return String.valueOf(select);
	 }
	
	@PostMapping("email-send")
	 @ResponseBody
	 private String emailSend(String email) throws MessagingException{
		 String checkId = UUID.randomUUID().toString() ;
		 StringBuilder html = new StringBuilder();
		 
		 html.append("<!DOCTYPE html>");
		 html.append("<html>");
		 html.append("<head>");
		 html.append("<meta charset=\"utf-8 \">");
		 html.append("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
		 html.append("<title>인증 메일</title>");
		 html.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
		 html.append("<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"main.css>");
		 html.append("<script src=\"main.js\"></script>)");
		 html.append("</head>)");
		 html.append("<body>)");
		 html.append("<h1>뉴렉처 Academy 인증을 위한 메일 발송</h1>");
		 html.append("<section>");
		 html.append("<h1>인증번호</h1>");
		 html.append("<div style=\"color:palevioletred\">"+checkId+"</div>");
		 html.append("</section>");
		 html.append("</body>");
		 html.append("</html>");
		 
		 MimeMessage message = javaMailSender.createMimeMessage();
		 MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8"); 
			
		 helper.setFrom("sellent@naver.com");
		 helper.setTo(email);
		 helper.setText(html.toString(), true);
		 helper.setSubject("이메일 검증을 위한 번호 전달");
		System.out.println("여기");
		 javaMailSender.send(message);
		System.out.println(checkId);	
		 return checkId;
	 }
	 
	 
	 @PostMapping("idFind")
	 @ResponseBody
	 public String idFind(
			 String nickname, String email
			 ) {
		/* System.out.println("id"+id); */
		 //System.out.println("hi");
		 //System.out.println(id);
		 //System.out.println(email);
		 Member select = memberDao.findID(nickname,email);
		 System.out.println(select.getId());
		 
		 return select.getId();
	 }
	 
	 @PostMapping("pwdFind")
	 @ResponseBody
	 public String pwdFind(  String id, String email ) {
		
		 System.out.println(id);
		 System.out.println(email);
		 int result = 0;
		 int select = memberDao.findPwd(id,email);
		 
		 if(select == 0)//존재 하지 않을때
		 {
			 result = 0;
		 }
		 else {
			 result = 1;
		 }
		 System.out.println("result:"+result);
		 return String.valueOf(result);
	 }
	 
	 @GetMapping("findInfo")
	 public String findInfo() {
		
		 return "member.findInfo";
	 }
	 
	 @PostMapping("changePwd")
	 @ResponseBody
	 public String changePwd(String id, String newPwd) {
		 System.out.println(newPwd);
		 PasswordEncoder encoder = new BCryptPasswordEncoder();
			String pwd = encoder.encode(newPwd);
			System.out.println(pwd);
			int result=0;
			int update = memberDao.changePwd(id, pwd);
			if(result == 0) result = 0; //안바뀌었을때
			else result=1; //바뀌었을때
		 return String.valueOf(result);
	 }
}
