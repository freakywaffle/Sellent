package com.sellent.web.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;
import com.sellent.web.service.QnaService;

@Component
public class HomePreparer implements ViewPreparer {


	@Autowired
	private QnaService qnaService;
      
	
	
   @Override
   public void execute(Request tilesRequest, 
         AttributeContext attributeContext) {
      

	   List<QnaPaCategory> list = qnaService.getOftenQnaList();
	   List<QnaSubCategory> subList = qnaService.getOftenQnaSubList();

	   Map<String, Object> model = tilesRequest.getContext("request");           
       model.put("list", list);
       model.put("subList", subList);
       
       
   }

}