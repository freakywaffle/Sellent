package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.Skill;


@Repository
public class MybatisMemberDao implements MemberDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Member> getMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member getMemberById(String id) {
		// TODO Auto-generated method stub
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.getMemberById(id);
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Member member) {

		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.insert(member);
	}

	@Override
	public int select(String id) {
		// TODO Auto-generated method stub
		
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.select(id);
	}
	
	 

	@Override
	public int delete(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}




}
