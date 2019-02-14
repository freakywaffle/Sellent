package com.sellent.web.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.entity.Member;

@Component
public class SellentLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		String id = authentication.getName();
		Member member = memberDao.getMember(id);
		session.setAttribute("member", member);
        String redirectUrl = (String) session.getAttribute("prevPage");
        if (redirectUrl != null) {
            session.removeAttribute("prevPage");
            response.sendRedirect(redirectUrl);
        } else {
        	response.sendRedirect("/index");
        }
		
		
	}
	
}
