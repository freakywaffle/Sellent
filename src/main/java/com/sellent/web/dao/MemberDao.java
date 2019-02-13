package com.sellent.web.dao;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.sellent.web.entity.Member;


public interface MemberDao {

	//List<Member> getMember();

	
	Member getMember(String id);
	int update(Member member);
	int insert(Member member);
	int select(String id);
	int delete(Member member);
	Member findID(String nickname, String email);
	int findPwd(String id, String email);
	int changePwd(String id, String newPwd);
	int editData(Member member);
	int updateIntro(Member member);


}
