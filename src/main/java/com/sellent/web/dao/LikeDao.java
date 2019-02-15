package com.sellent.web.dao;


import java.util.List;

import com.sellent.web.entity.Like;

public interface LikeDao {
	int insert(Like like);
	int delete(Like like);
	int hasLike(Like like);
	
	List<Like> getListById(String id);
}
