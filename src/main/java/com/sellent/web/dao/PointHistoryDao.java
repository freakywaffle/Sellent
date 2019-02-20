package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.PointHistory;

public interface PointHistoryDao {
	int insert(PointHistory pointHistory);

	int insert_sy(String name, int point);
	int update_sy(String name, int point);
	List<PointHistory> select_sy(String member_id);

	List<PointHistory>  getListById(String id, int page);
	List<PointHistory>  getListById(String id, int page, int selector);

	int getAllCntById(String id, int selector);

	int getAllSumById(String id, int selector);
}
