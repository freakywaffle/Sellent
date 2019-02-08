package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.Member;

public interface MemberDao {

	List<Member> getMember();
	
	Member getMember(int id);
	int update(Member member);
	int insert(Member member);
	int select(String id);
	int delete(Member member);
}
