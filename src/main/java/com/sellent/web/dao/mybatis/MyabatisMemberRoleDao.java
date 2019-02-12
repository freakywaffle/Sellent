package com.sellent.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.MemberRoleDao;
import com.sellent.web.entity.MemberRole;

@Repository
public class MyabatisMemberRoleDao implements MemberRoleDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insert(MemberRole memberRole) {
		// TODO Auto-generated method stub
		MemberRoleDao memberRoleDao = session.getMapper(MemberRoleDao.class);
		
		return memberRoleDao.insert(memberRole);
	}

	
}
