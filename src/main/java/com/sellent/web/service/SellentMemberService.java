package com.sellent.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.SkillDao;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Skill;


@Service
public class SellentMemberService implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SkillDao skillDao;

	@Override
	public int insertMember(Member member, String skill) {
		// TODO Auto-generated method stub
		memberDao.insert(member);
		String [] skills = skill.split(",");
		for(String s: skills) {
			Skill sk = new Skill();
			sk.setMemberId(member.getId());
			System.out.println("skill-memberid= " + sk.getMemberId());
			sk.setName(s);
			System.out.println("skill-skillname= " + sk.getName());
			skillDao.insert(sk);
		}
		return 0;
	
	}

	

}
