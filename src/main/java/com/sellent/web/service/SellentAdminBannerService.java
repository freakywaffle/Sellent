package com.sellent.web.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sellent.web.dao.AdminBannerDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Banner;

@Service
public class SellentAdminBannerService implements AdminBannerService{
							
	@Autowired
	AdminBannerDao adminBannerDao;

	@Override
	public List<Banner> getBannerList(AdminPaging paging) {
		return adminBannerDao.getBannerList(paging);
	}

	@Override
	public int getBannerCnt() {
		return adminBannerDao.getBannerCnt();
	}

	@Override
	public int insert(Banner banner) {
		return adminBannerDao.insert(banner);
	}

	@Override
	public int update(Banner banner) {
		return adminBannerDao.update(banner);
	}

	@Override
	public int delete(int id) {
		return adminBannerDao.delete(id);
	}
	
	
	
}	

