package com.sellent.web.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sellent.web.dao.AdminBannerDao;
import com.sellent.web.entity.AdminConfigView;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;
import com.sellent.web.entity.Banner;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.PointConfig;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.AdminConfigService;
import com.sellent.web.service.AdminPointService;
import com.google.gson.Gson;

@Controller("adminConfig")
@RequestMapping("/admin/config/")
public class ConfigController {

	@Autowired
	AdminPointService adminPointService;
	
	@Autowired
	AdminConfigService adminConfigService;
	
	@Autowired
	AdminBannerDao adminBannerDao;
	
	@GetMapping("banner")
	public String banner(
			@RequestParam(name = "page", defaultValue = "1") int page,
			Model model) {
		
		int cnt = adminBannerDao.getBannerCnt();
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<Banner> list = adminBannerDao.getBannerList(paging);
		int orderMax = adminBannerDao.getBannerOrderMax();
		
		String query="";

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		model.addAttribute("orderMax", orderMax);
		
		return "admin.config.banner";
	}
	
	@PostMapping("bannerInsert")
	public String bannerInsert(
			MultipartHttpServletRequest multipartHttpServletRequest
			) throws IllegalStateException, IOException, ParseException {
		
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		
		int order = adminBannerDao.getBannerCnt()+1;
		
		Banner banner = new Banner();
		
		banner.setTitle(multipartHttpServletRequest.getParameter("title"));
		banner.setEnd_date(multipartHttpServletRequest.getParameter("endDate"));
		banner.setContent(multipartHttpServletRequest.getParameter("content"));
		banner.setOrder(order);
		
		// 파일 경로
		String filePath = "F:\\sellent\\admin\\";
		
		// 파라미터명이 files인 파일을 가져온다 -> List형태로 담는다
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("image");
		
		//System.out.println(files.get(0).getOriginalFilename());
		banner.setImage(files.get(0).getOriginalFilename());
		
		int result = adminBannerDao.insert(banner);
		
		// 파일객체에 경로를 담는다 (디렉토리, 파일 형식 둘다 가능)
		File file = new File(filePath);
		
		// 객체가 가지고 있는 경로가 없으면 디렉토리 생성
		if(file.exists() == false) {
			file.mkdir();
		}
		
		for(int i =0; i<files.size(); i++) {
		
			file = new File(filePath+files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);	// 객체에 저장된 경로로  파일을 전송한다
		}
		
		return "redirect:banner";
	}
	
	@PostMapping("bannerRemove")
	@ResponseBody
	public String boardRemove(@RequestParam(name = "arr") ArrayList<Integer> arr) {

		for (int i = 0; i < arr.size(); i++) {

			int result = adminBannerDao.delete(arr.get(i));
		}
		return "ok";
	}
	
	@PostMapping("bannerUpdate")
	public String bannerUpdate(
			@RequestParam(name = "idArr") ArrayList<Integer> idArr, 
			@RequestParam(name = "orderArr") ArrayList<Integer> orderArr,
			@RequestParam(name = "useArr") ArrayList<Integer> useArr
			) {

		Banner banner = new Banner();
		for(int i =0; i < idArr.size(); i++) {
		
			int id = idArr.get(i);
			int order = orderArr.get(i);
			int use = useArr.get(i);
			
			banner.setId(id);
			banner.setOrder(order);	
			banner.setUse(use);
			adminBannerDao.update(banner);
			
		}
		
		return "ok";
	}
	
	@PostMapping("bannerChange")
	public String bannerChange(
			@RequestParam(name = "id") int id, 
			@RequestParam(name = "title") String title,
			@RequestParam(name = "image") String image,
			@RequestParam(name = "content") String content,
			@RequestParam(name = "endDate") String endDate
			) {
		
		Banner banner = new Banner();
		banner.setId(id);
		banner.setTitle(title);
		banner.setContent(content);
		banner.setEnd_date(endDate);
		banner.setImage(image);
		adminBannerDao.change(banner);
		
		return "ok";
	}
	
	
	@GetMapping("point")
	public String point(
			Model model) {
		
		List<PointConfig> list = adminPointService.getPointConfig();
		
		model.addAttribute("list",list);
		
		
		return "admin.config.point";
	}
	
	@PostMapping("pointUpdate")
	@ResponseBody
	public String pointUpdate(@RequestBody String arr) {
		
		Gson gson = new Gson();
		List list = gson.fromJson(arr, List.class);
		
		for (Object object : list) {
			
			Map<String, String> map = (Map)object;
			String content = (String)map.get("content");
			int point = Integer.parseInt(map.get("point"));
			int use = Integer.parseInt(map.get("use"));
			
			int result = adminPointService.updateConfig(content, point, use);
		}
		
		return "ok";
	}
	
	@GetMapping("admin")
	public String admin(
			@RequestParam(name = "role", defaultValue = "") String role,
			@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "condition", defaultValue = "") String condition,
			@RequestParam(name = "text", defaultValue = "") String text,
			@RequestParam(name = "page", defaultValue = "1") int page,
			Model model) {
		
		int cnt = adminConfigService.getAdminConfigCnt(role, startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<AdminConfigView> list = adminConfigService.getAdminConfigView(role, startDate, endDate, condition, text, paging);

		String query = "?role=" + role + "&startDate=" + startDate + "&endDate=" + endDate + "&condition=" + condition + "&text="
				+ text;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		
		return "admin.config.admin";
	}
	
	@PostMapping("adminUpdate")
	@ResponseBody
	public String adminUpdate(String id, int roleNum) {

		String role;
		if(roleNum == 0) {
			role = "ROLE_MEMBER";
		}else{
			role = "ROLE_ADMIN";
		}
		
		adminConfigService.update(id, role);
		
		return "ok";
	}
	
	@PostMapping("adminTotalUpdate")
	@ResponseBody
	public String adminTotalUpdate(@RequestBody String arr) {

		Gson gson = new Gson();
		List list = gson.fromJson(arr, List.class);
		
		for (Object object : list) {
			
			Map<String, String> map = (Map)object;
			
			String id = map.get("id");
			Integer roleNum = Integer.parseInt(map.get("roleNum"));
			
			String role;
			
			if(roleNum == 0) {
				role = "ROLE_MEMBER";
			}else{
				role = "ROLE_ADMIN";
			}
			
			int result = adminConfigService.update(id, role);
		}
		
		return "ok";
	}
}

