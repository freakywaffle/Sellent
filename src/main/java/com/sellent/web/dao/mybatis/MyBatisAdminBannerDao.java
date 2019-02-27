package com.sellent.web.dao.mybatis;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sellent.web.dao.AdminBannerDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.Banner;

@Repository
public class MyBatisAdminBannerDao implements AdminBannerDao{
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Banner> getBannerList(AdminPaging paging) {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.getBannerList(paging);
	}


	@Override
	public List<Banner> getBannerMain() {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.getBannerMain();
	}


	@Override
	public int getBannerOrderMax() {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.getBannerOrderMax();
	}

	@Override
	public int getBannerCnt() {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.getBannerCnt();
	}

	@Override
	public int insert(Banner banner) {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.insert(banner);
	}

	@Override
	public int change(Banner banner) {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.change(banner);
	}

	@Override
	public int update(Banner banner) {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.update(banner);
	}

	@Override
	public int delete(int id) {
		AdminBannerDao adminBannerDao = session.getMapper(AdminBannerDao.class);
		return adminBannerDao.delete(id);
	}
	
	
}
