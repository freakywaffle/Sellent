package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.sellent.web.dao.PointHistoryDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.QnaDao;
import com.sellent.web.dao.SearchDao;
import com.sellent.web.entity.PointHistory;
import com.sellent.web.entity.QnaContent;
import com.sellent.web.entity.QnaFile;
import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;
import com.sellent.web.entity.SearchQna;
import com.sellent.web.service.QnaService;

@Controller
@RequestMapping("/Qna/")
public class QnaController {
	

	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private PointHistoryDao pointHistoryDao;
	
	@Autowired
	private QnaService qnaService;

	@Autowired
	private SearchDao searchDao;
	
	private ArrayList<QnaFile> tempFiles; 

	
	@RequestMapping("qna")
	public String oftenQna(Model model, String title) {
			
		List<QnaPaCategory> list = qnaService.getOftenQnaList();
		System.out.println(list);
		
		List<QnaSubCategory> subList = qnaService.getOftenQnaSubList();
		System.out.println(subList);
		
		model.addAttribute("list",list);
		model.addAttribute("subList",subList);
		
		
		
		return "/inc/floatingBar";
	}
	
	@RequestMapping("ajax")
	@ResponseBody
	public String subQna(String title) {
			
		List<QnaContent> content = qnaService.getContent(title);

		Gson gson = new Gson();
		String json = gson.toJson(content);
		System.out.println(json);
		return json;
	}
	
	@RequestMapping("search")
	@ResponseBody
	public String search(String search) {
			
		System.out.println(search);
		
		List<SearchQna> searchQna = searchDao.getViewList(search);
		System.out.println(searchQna);

		Gson gson = new Gson();
		String json = gson.toJson(searchQna);
		System.out.println(json);
		return json;
	}
	
	
	@RequestMapping("Attachments")
	@ResponseBody
	public String Attachments( HttpServletRequest request,@RequestParam("img") ArrayList<MultipartFile> files) throws IOException {
		System.out.println(files);
		tempFiles = new ArrayList<QnaFile>();
        String root = "F:\\sellent\\qna\\qna";
        int recentNo = qnaDao.getRecentlyNo()+1;
        String path = root+recentNo;
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        
		for(MultipartFile file : files) {
			System.out.println("몇번?");
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			String fileName = file.getOriginalFilename();
			String saveName = now + "_" + file.getOriginalFilename();
			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveName);
			fos.write(data);
			fos.close();
			
			QnaFile qf = new QnaFile();
			qf.setName(fileName);
			qf.setSaveName(saveName);
			qf.setQnaNo(recentNo);
			System.out.println(qf);
			tempFiles.add(qf);
			System.out.println(tempFiles);
			
		}
		 
		 
		return "ok";
	}
	
	@RequestMapping("question")
	@ResponseBody
	public String question( HttpServletRequest request,String [] main) {
		
		String email = main[0];
		String title = main[1];
		String content = main[2];
		System.out.println(main[0]);
		System.out.println(main[1]);
		System.out.println(main[2]);

		System.out.println(tempFiles);
		 qnaService.insert(email, title, content, tempFiles);
		 //qnaService.insert(email, title, content);
		 
		return "ok";
	}
	
	
	
	@RequestMapping("point")
	@ResponseBody
	public String point( HttpServletRequest request, int point, Principal principal) {
		
		System.out.println(point);

		Object principal2 = SecurityContextHolder.getContext()

				.getAuthentication().getPrincipal();
		
		if(principal2.equals("anonymousUser"))
			System.out.println(principal2);
		
		else {
			System.out.println(principal.getName());
			List<PointHistory> list = pointHistoryDao.select_sy(principal.getName());
			
			System.out.println(list);
			if(list.isEmpty()) {
				System.out.println("비었!!");
				int a = pointHistoryDao.insert_sy(principal.getName(),point);
				int update = pointHistoryDao.update_sy(principal.getName(),point);
			}
			else if(!list.isEmpty())
				System.out.println("안비었!!");
		};
				
		
//		String email = main[0];
//		String title = main[1];
//		String content = main[2];
//		System.out.println(main[0]);
//		System.out.println(main[1]);
//		System.out.println(main[2]);
//
//		System.out.println(tempFiles);
//		 qnaService.insert(email, title, content, tempFiles);
		 //qnaService.insert(email, title, content);
		 
		return "ok";
	}
	

}