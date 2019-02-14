package com.sellent.web.dao;

import java.security.Principal;
import java.util.List;

import com.sellent.web.entity.Skill;

public interface SkillDao {

	int insert(Skill skill);
	//리턴값 메소드 (매게변수 이름)
	List<Skill> select(String id);
	
	int update(Skill skill);
	int skillinsert(String id, Skill skill);
	int skillDele(Skill skill);
	String select(Skill skill);
}
