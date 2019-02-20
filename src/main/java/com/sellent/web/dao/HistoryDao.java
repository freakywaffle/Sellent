package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.History;
import com.sellent.web.entity.HistoryView;

public interface HistoryDao {
	int insert(History history);


	List<HistoryView> getListById(String id, int page);



	List<HistoryView> getListById2(String id, int page);

	int chgState(History history);

	int getAllCntById(String id, int selector);
	int getAllCntById2(String id, int selector);

	int delete(History history);
	int hasBuy(String id, int ProductNo);

}
