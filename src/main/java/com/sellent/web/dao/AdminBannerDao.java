package com.sellent.web.dao;

import java.util.List; 

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Banner;

public interface AdminBannerDao {
	
	List<Banner> getBannerList(AdminPaging paging);
	
	int getBannerOrderMax();
	
	int getBannerCnt();
	
	int insert(Banner banner);
	
	int change(Banner banner);
	
	int update(Banner banner);
	
	int delete(int id);
	
}
