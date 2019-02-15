package com.sellent.web.dao;


import java.util.List;

import com.sellent.web.entity.Like;

public interface LikeDao {
	
	List<Like> select(String id);
	
	int insert(Like like);
	int delete(Like like);
	int hasLike(Like like);
}
