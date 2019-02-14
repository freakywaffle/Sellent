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

	@Override
	public List<Skill> select(String skill) {
		// TODO Auto-generated method stub
		SkillDao skillDao = session.getMapper(SkillDao.class);
		return skillDao.select(skill);
	}

	@Override
	public int update(Skill skill) {
		// TODO Auto-generated method stub
		SkillDao skillDao = session.getMapper(SkillDao.class);
		return skillDao.update(skill);
	}

	@Override
	public int skillinsert(String id, Skill skill) {
		SkillDao skillDao = session.getMapper(SkillDao.class);
		return skillDao.skillinsert(id, skill);
	}

	@Override
	public int skillDele(Skill skill) {
		// TODO Auto-generated method stub
		SkillDao skillDao = session.getMapper(SkillDao.class);
		return skillDao.skillDele(skill);
	}

	@Override
	public String select(Skill skill) {
		// TODO Auto-generated method stub
		return null;
	}

	





}
