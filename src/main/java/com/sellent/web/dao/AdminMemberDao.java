package com.sellent.web.dao;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Skill;

public interface AdminMemberDao {

	List<Member> getMemberList(String startDate, String endDate, String condition, String text, AdminPaging paging);
	
	int getMemberCnt(String startDate, String endDate, String condition, String text);
	
	Member getMember(String id);
	
	List<String> getSkillList(String memberId);
	
	int insert(Member member);
	int insertSkill(String skill,String memberId);
	
	int delete(String id);
}
