package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.SearchQna;

public interface SearchDao {

	List<SearchQna> getViewList(String search);
}
