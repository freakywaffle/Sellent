package com.sellent.web.service;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Skill;

public interface AdminMemberService {

	List<Member> getMemberList(String startDate, String endDate, String condition, String text, AdminPaging paging);
	
	int getMemberCnt(String startDate, String endDate, String condition, String text);
	
	Member getMember(String id);

	List<String> getSkillList(String memberId);
	
	int insert(Member member);
	
	int insertSkill(String skill,String memberId);
	
	int delete(String id);
}
