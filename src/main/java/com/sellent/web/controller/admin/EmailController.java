package com.sellent.web.controller.admin;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class EmailController {

	@Autowired
	private JavaMailSender javaMailSender;
	
	@PostMapping("email-send")
	@ResponseBody
	public String emailSend(
			String title,
			String email,
			String content) throws MessagingException {
		
		System.out.println(title);
		System.out.println(email);
		System.out.println(content);
		
		String checkId = UUID.randomUUID().toString();
		
		//메시지 타입 설정(문자 이외에 이미지,동영상 가능)
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setFrom("dkstnrbs@gmail.com");		// SMTP에 등록한 자신의 아이디
		helper.setTo(email);
		helper.setText(content);
		helper.setSubject(title);
		
		javaMailSender.send(message);
		
		return checkId;
	}
	
}
