package com.sellent.web.controller;

import java.security.Principal; 
import java.util.ArrayList;
import java.util.List;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

import com.sellent.web.dao.CategoryDao;
import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.SkillDao;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.QnaPaCategory;
import com.sellent.web.entity.QnaSubCategory;
import com.sellent.web.entity.Skill;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.QnaService;

@Component
public class HomePreparer implements ViewPreparer {

	@Autowired
	private MemberDao  memberDao;	
	@Autowired
	private QnaService qnaService;
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private SkillDao Skilldao;
	
    

	
   @Override
   public void execute(Request tilesRequest, 
      
		   AttributeContext attributeContext) {
    
	   //floating Bar
	   List<QnaPaCategory> list = qnaService.getOftenQnaList();
	   List<QnaSubCategory> subList = qnaService.getOftenQnaSubList();

       attributeContext.putAttribute("list", new Attribute(list), true);
       attributeContext.putAttribute("subList", new Attribute(subList), true);
       
       //categoryHeader
       List<List<SubCategory>> CtList = new ArrayList<List<SubCategory>>(); 
       
       List<ParentCategory> parentCtList = categoryDao.getParentList();
       for(ParentCategory pc: parentCtList) {
    	   List<SubCategory> subCtList = categoryDao.getSubListByParent(pc.getName());
    	   CtList.add(subCtList);
       }
       attributeContext.putAttribute("CtList",new Attribute(CtList), true);
       
       
       
       
       
       List<Member> mem = new ArrayList<>();
       HomeController h = new HomeController();
       List<Skill> skill = new ArrayList<>();
       System.out.println(h.id);
       int point = 0;
       Member member = memberDao.getMember("khh111");
       if(h.id.isEmpty()) {
    	   System.out.println("preparer:아이디 없음");
       }
       else if(!h.id.isEmpty()) {
    	   System.out.println(h.id.get(0));
    	   System.out.println("size"+h.id.size());
    	   //String id = h.id.get(0);
    	   String id = h.id.get(h.id.size()-1);
    	   member = memberDao.getMember(id);
    	   skill = Skilldao.select(id);
    	   System.out.println(skill);
    	   point = member.getPoint();
    	   System.out.println(point);
       }
       
       attributeContext.putAttribute("sypoint",new Attribute(point), true);
       attributeContext.putAttribute("syskill",new Attribute(skill), true);
       attributeContext.putAttribute("symember",new Attribute(member), true);
     //  String id = h.id.get(0);
      // System.out.println("preparer");
      // System.out.println(id);
      // }
			
			
		
		
       
       
   }

}