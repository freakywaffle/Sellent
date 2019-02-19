package com.sellent.web.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.sellent.web.dao.CategoryDao;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.QnaService;

@Component
public class HomePreparer implements ViewPreparer {


	@Autowired
	private QnaService qnaService;
    @Autowired
    private CategoryDao categoryDao;
	
	
   @Override
   public void execute(Request tilesRequest, 
      
		   AttributeContext attributeContext) {
    
	   List<QnaPaCategory> list = qnaService.getOftenQnaList();
	   List<QnaSubCategory> subList = qnaService.getOftenQnaSubList();

	  // Map<String, Object> model = tilesRequest.getContext("request");           
      // model.put("list", list);
      // model.put("subList", subList);
       
       Attribute aa = new Attribute(list);
       Attribute bb = new Attribute(subList);
       attributeContext.putAttribute("list", aa, true);
       attributeContext.putAttribute("subList", bb, true);
       
       List<List<SubCategory>> CtList = new ArrayList<List<SubCategory>>(); 
       
       List<ParentCategory> parentCtList = categoryDao.getParentList();
       for(ParentCategory pc: parentCtList) {
    	   List<SubCategory> subCtList = categoryDao.getSubListByParent(pc.getName());
    	   CtList.add(subCtList);
       }
       
       
       
       attributeContext.putAttribute("CtList",new Attribute(CtList), true);
       
       
   }

}