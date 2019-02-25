package com.sellent.web.config;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.SkillDao;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductView;
import com.sellent.web.entity.Skill;

@Component
public class SellentLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	MemberDao memberDao;
	
	@Autowired
	SkillDao skillDao;
	
	@Autowired
	ProductDao productDao;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		String id = authentication.getName();
		Member member = memberDao.getMember(id);
		List<ProductView> photo = productDao.getPhoto(id);
		List<Skill> skill = skillDao.select(id);
		for (int i = 0; i < skill.size(); i++) {
			System.out.println(skill.get(i).getName());
		}
		session.setAttribute("member", member);
		session.setAttribute("skill", skill );
		
		session.setAttribute("photo",photo);
		String redirectUrl = (String) session.getAttribute("prevPage");

        if (redirectUrl != null) {
        	String lastUrl = redirectUrl.split("/")[redirectUrl.split("/").length-1];
        	if(!lastUrl.equals("login")) {
        		session.removeAttribute("prevPage");
        		response.sendRedirect(redirectUrl);
        		
        	}else {
        		response.sendRedirect("/index");
        		
        	}
        } else {
        	response.sendRedirect("/index");
        }
		
		
	}
	
}
