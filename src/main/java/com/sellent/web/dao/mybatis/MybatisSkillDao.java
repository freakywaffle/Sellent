package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.SkillDao;
import com.sellent.web.entity.Skill;


@Repository
public class MybatisSkillDao implements SkillDao{

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insert(Skill skill) {
		// TODO Auto-generated method stub
		
		SkillDao skillDao = session.getMapper(SkillDao.class);
		return skillDao.insert(skill);
	}
	





}
