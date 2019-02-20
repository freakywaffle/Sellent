package com.sellent.web.dao;

import com.sellent.web.entity.History;

public interface HistoryDao {
	int insert(History history);
	int delete(History history);
	int hasBuy(String id, int ProductNo);
}
