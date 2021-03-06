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
	
	/*@Override
	public List<Member> getMember() {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public Member getMember(String id) {

		// TODO Auto-generated method stub
		MemberDao memberDao = session.getMapper(MemberDao.class);
		
		return memberDao.getMember(id);
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMember(Member member) {

		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.insertMember(member);
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

	@Override
	public Member findID(String nickname, String email) {
		// TODO Auto-generated method stub
		
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.findID(nickname, email);
	}

	@Override
	public int findPwd(String id, String email) {
		// TODO Auto-generated method stub
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.findPwd(id, email);
	}

	@Override
	public int changePwd(String id, String newPwd) {
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.changePwd(id, newPwd);
	}

	@Override
	public int editData(Member member) {
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.editData(member);
	}

	@Override
	public int updateIntro(Member member) {
		// TODO Auto-generated method stub
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.updateIntro(member);
	}


	@Override
	public int addPoint(String id, int point) {
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.addPoint(id, point);
	}

	@Override
	public List<Member> getTopSellent() {
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.getTopSellent();
	}

	@Override
	public List<Member> getTopSellent2() {
		// TODO Auto-generated method stub
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.getTopSellent2();
	}

	@Override
	public String role(String name) {
		MemberDao memberDao = session.getMapper(MemberDao.class);
		return memberDao.role(name);
	}

}
