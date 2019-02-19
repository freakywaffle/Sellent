package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.MyParentCategory;
import com.sellent.web.entity.MySubCategory;

public interface MyPageDao {

	List<MyParentCategory> getOfMyPageList();

	List<MySubCategory> getOpMyPageSubList();

}
