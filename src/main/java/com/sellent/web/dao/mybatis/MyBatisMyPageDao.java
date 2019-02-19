package com.sellent.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.MyPageDao;
import com.sellent.web.entity.MyParentCategory;
import com.sellent.web.entity.MySubCategory;

@Repository
public class MyBatisMyPageDao implements MyPageDao{

	@Autowired
	private SqlSessionTemplate session;
	
	public List<MyParentCategory> getOfMyPageList(){
		
		MyPageDao mypageDao = session.getMapper(MyPageDao.class);
		return mypageDao.getOfMyPageList();
	}

	public List<MySubCategory> getOpMyPageSubList(){
		MyPageDao mypageDao = session.getMapper(MyPageDao.class);
		return mypageDao.getOpMyPageSubList();
		
	}
}
