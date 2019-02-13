package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/member/")
public class MemberController {
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender javaMailSender;
	
	@GetMapping("login")
	public String login() {
		
		return "member.login";
	}
	
	@GetMapping("join")
	public String join() {
		
		return "member.join";
	}
	@PostMapping("join")
	public String join(Member member, String skill) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		String pwd = encoder.encode(member.getPassword());
		System.out.println(pwd);
		member.setPassword(pwd);
		memberService.insertMember(member, skill);
		return "redirect:login";
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
			
		 helper.setFrom("haejeong1005@naver.com");
		 helper.setTo(email);
		 helper.setText(html.toString(), true);
		 helper.setSubject("이메일 검증을 위한 번호 전달");
			
		 javaMailSender.send(message);
		System.out.println(checkId);	
		 return checkId;
	 }
	 
	 @PostMapping("file-upload")
	 @ResponseBody
	 public String fileUpload(@RequestParam("uploadfile") MultipartFile filedata) throws IOException {
		
		 String filePath = "F:\\Upload\\";
		 System.out.println(filedata.getOriginalFilename());
		 File dir = new File(filePath);
		 if(!dir.isDirectory()){
            dir.mkdir();
		 }
		 byte[] data = filedata.getBytes();
         FileOutputStream fos = new FileOutputStream(filePath + "\\" + filedata.getOriginalFilename());
         fos.write(data);
         fos.close();
		 return null;
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
		 int select = memberDao.findPwd(id,email);
		 
		 
		 return id;
	 }
	 
}
