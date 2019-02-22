package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminMemberDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Skill;
 
@Service
public class SellentAdminMemberService implements AdminMemberService{

	@Autowired
	private AdminMemberDao adminMemberDao;
	
	@Override
	public List<Member> getMemberList(String startDate, String endDate, String condition, String text,
			AdminPaging paging) {
		return adminMemberDao.getMemberList(startDate, endDate, condition, text, paging);
	}

	@Override
	public int getMemberCnt(String startDate, String endDate, String condition, String text) {
		return adminMemberDao.getMemberCnt(startDate, endDate, condition, text);
	}

	@Override
	public Member getMember(String id) {
		return adminMemberDao.getMember(id);
	}

	@Override
	public List<String> getSkillList(String memberId) {
		return adminMemberDao.getSkillList(memberId);
	}

	@Override
	public int insert(Member member) {
		return adminMemberDao.insert(member);
	}

	@Override
	public int insertSkill(String skill, String memberId) {
		return adminMemberDao.insertSkill(skill, memberId);
	}

	@Override
	public int delete(String id) {
		return adminMemberDao.delete(id);
	}
	
}
