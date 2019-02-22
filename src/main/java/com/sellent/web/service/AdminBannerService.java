package com.sellent.web.service;

import java.util.List;    

import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Banner;
 
public interface AdminBannerService {
	List<Banner> getBannerList(AdminPaging paging);
	int getBannerCnt();
	
	int insert(Banner banner);
	
	int update(Banner banner);
	
	int delete(int id);
}
