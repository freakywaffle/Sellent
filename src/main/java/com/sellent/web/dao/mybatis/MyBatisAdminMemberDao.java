package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminMemberDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Skill;
 
@Repository
public class MyBatisAdminMemberDao implements AdminMemberDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Member> getMemberList(String startDate, String endDate, String condition, String text,
			AdminPaging paging) {
		
		AdminMemberDao adminMemberDao = session.getMapper(AdminMemberDao.class);
		return adminMemberDao.getMemberList(startDate, endDate, condition, text, paging);
	}

	@Override
	public int getMemberCnt(String startDate, String endDate, String condition, String text) {
		AdminMemberDao adminMemberDao = session.getMapper(AdminMemberDao.class);
		return adminMemberDao.getMemberCnt(startDate, endDate, condition, text);
	}

	@Override
	public Member getMember(String id) {
		AdminMemberDao adminMemberDao = session.getMapper(AdminMemberDao.class);
		return adminMemberDao.getMember(id);
	}

	@Override
	public List<String> getSkillList(String memberId) {
		AdminMemberDao adminMemberDao = session.getMapper(AdminMemberDao.class);
		return adminMemberDao.getSkillList(memberId);
	}

	@Override
	public int insert(Member member) {
		AdminMemberDao adminMemberDao = session.getMapper(AdminMemberDao.class);
		
		System.out.println("이미지 : "+member.getPhoto());
		return adminMemberDao.insert(member);
	}

	@Override
	public int insertSkill(String skill, String memberId) {
		AdminMemberDao adminMemberDao = session.getMapper(AdminMemberDao.class);
		return adminMemberDao.insertSkill(skill, memberId);
	}

	@Override
	public int delete(String id) {
		AdminMemberDao adminMemberDao = session.getMapper(AdminMemberDao.class);
		return adminMemberDao.delete(id);
	}
	

}
