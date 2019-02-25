package com.sellent.web.controller;

import java.io.File; 
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import java.util.ArrayList;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.google.gson.Gson;

import com.sellent.web.dao.HistoryDao;

import com.sellent.web.dao.CategoryDao;

import com.sellent.web.dao.LikeDao;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.PointHistoryDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ReviewDao;
import com.sellent.web.dao.SkillDao;
import com.sellent.web.entity.History;
import com.sellent.web.entity.HistoryView;
import com.sellent.web.entity.Like;
import com.sellent.web.entity.LikeView;
import com.sellent.web.entity.Member;

import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.ParentCategorySY;

import com.sellent.web.entity.PointHistory;

import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductView;

import com.sellent.web.entity.QnaContent;

import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;

import com.sellent.web.entity.Skill;
import com.sellent.web.service.MemberService;


@Controller
@RequestMapping("/member/")
public class MemberController {
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SkillDao skillDao;
	/////
	@Autowired
	private LikeDao likeDao;
	
	@Autowired
	private ProductDao productDao;


	@Autowired
	private CategoryDao categoryDao;

	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private PointHistoryDao pointHistoryDao;

	@Autowired
	private HistoryDao historyDao;


	
	@GetMapping("project")
	public String project(Principal principal, Model model, @RequestParam(value="p" ,defaultValue="1") int page, @RequestParam(value="optionValue", defaultValue="0")Integer selector, Product product) {
		//System.out.println("selectornum: " + selector);
		List<ProductView> showPage = productDao.getListById(principal.getName(),page, selector);		
		int allCnt = productDao.getAllCntById(principal.getName(),selector);
		System.out.println("now Page: " + page);
		System.out.println("total page: " +allCnt );
		int num=5; //화면에 보여질 페이지 번호의 갯수
		//끝 페이지 번호
		int endpage;
		endpage = (int)(Math.ceil((double)page/(double)num)*(double)num);
		System.out.println("endpage: " +endpage);
		
		//시작페이지번호
				int startpage= (endpage-num);
				System.out.println("startpage: "+startpage);
				
		//마지막 페이지 번호
		int tempendpage = (int)(Math.ceil((double)allCnt/(double)num));
		System.out.println("tempendpage: " +tempendpage);
		if (endpage > tempendpage) {
			endpage = tempendpage;
			System.out.println("endpage2:" + endpage);
		}
		
		String pageTitle = "관리";
		
		//이전버튼 생성 여부
		boolean prev = startpage == 0 ? false:true;
		System.out.println("prevbutton 여부: " + prev);
		//다음버튼 생성 여부
		boolean next = endpage * 5 >= allCnt ? false:true;
		System.out.println("nextbutton 여부: " + next);
		
		model.addAttribute("product",showPage);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("tempendpage",tempendpage);
		model.addAttribute("page",page);
		model.addAttribute("allCnt",allCnt);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		model.addAttribute("pageTitle",pageTitle);
		model.addAttribute("selector",selector);
		return "member.management.project";
	}

	
	@GetMapping("history")
	public String history(Principal principal, Model model, @RequestParam(value="p" ,defaultValue="1") int page, @RequestParam(value="optionValue", defaultValue="0")Integer selector, History history) {
		System.out.println("selectornum: " + selector);
		
		if(selector == 0) {
			List<HistoryView> showPage = historyDao.getListById(principal.getName(),page);
			int allCnt = historyDao.getAllCntById(principal.getName(),selector);
			String pageTitle = "관리";
			String showPart = "판매";
			System.out.println("now Page: " + page);
			System.out.println("total page: " +allCnt );
			int num=5; //화면에 보여질 페이지 번호의 갯수
			//끝 페이지 번호
			int endpage;
			endpage = (int)(Math.ceil((double)page/(double)num)*(double)num);
			System.out.println("endpage: " +endpage);
			
			//시작페이지번호
					int startpage= (endpage-num);
					System.out.println("startpage: "+startpage);
					
			//마지막 페이지 번호
			int tempendpage = (int)(Math.ceil((double)allCnt/(double)num));
			System.out.println("2tempendpage: " +tempendpage);
			if (endpage > tempendpage) {
				endpage = tempendpage;
				System.out.println("endpage:" + endpage);
				System.out.println("---------------------------------");
			}
			
			
			
			//이전버튼 생성 여부
			boolean prev = startpage == 0 ? false:true;
			System.out.println("prevbutton 여부: " + prev);
			//다음버튼 생성 여부
			boolean next = endpage * 5 >= allCnt ? false:true;
			System.out.println("nextbutton 여부: " + next);
			
			model.addAttribute("pageTitle",pageTitle);
			model.addAttribute("showPart",showPart);
			model.addAttribute("selector",selector);
			model.addAttribute("product",showPage);
			model.addAttribute("startpage",startpage);
			model.addAttribute("endpage",endpage);
			model.addAttribute("tempendpage",tempendpage);
			model.addAttribute("page",page);
			model.addAttribute("allCnt",allCnt);
			model.addAttribute("prev",prev);
			model.addAttribute("next",next);
		}
		else {
			List<HistoryView> showPage2 = historyDao.getListById2(principal.getName(),page);
			int allCnt2 = historyDao.getAllCntById2(principal.getName(),selector);
			String pageTitle = "관리";
			String showPart = "구매";
			System.out.println("2now Page: " + page);
			System.out.println("2total page: " +allCnt2 );
			int num=5; //화면에 보여질 페이지 번호의 갯수
			//끝 페이지 번호
			int endpage;
			endpage = (int)(Math.ceil((double)page/(double)num)*(double)num);
			System.out.println("2endpage: " +endpage);
			
			//시작페이지번호
					int startpage= (endpage-num);
					System.out.println("2startpage: "+startpage);
					
			//마지막 페이지 번호
			int tempendpage = (int)(Math.ceil((double)allCnt2/(double)num));
			System.out.println("2tempendpage: " +tempendpage);
			if (endpage > tempendpage) {
				endpage = tempendpage;
				System.out.println("2endpage2:" + endpage);
			}
			
			
			
			//이전버튼 생성 여부
			boolean prev = startpage == 0 ? false:true;
			System.out.println("2prevbutton 여부: " + prev);
			//다음버튼 생성 여부
			boolean next = endpage * 5 >= allCnt2 ? false:true;
			System.out.println("2nextbutton 여부: " + next);
			
			model.addAttribute("pageTitle",pageTitle);
			model.addAttribute("showPart",showPart);
			model.addAttribute("selector",selector);
			model.addAttribute("product",showPage2);
			model.addAttribute("startpage",startpage);
			model.addAttribute("endpage",endpage);
			model.addAttribute("tempendpage",tempendpage);
			model.addAttribute("page",page);
			model.addAttribute("allCnt",allCnt2);
			model.addAttribute("prev",prev);
			model.addAttribute("next",next);
		}
		
		return "member.management.history";
	}
	@GetMapping("statics")
	public String statics(Model model) {

		String pageTitle = "관리";
		model.addAttribute("pageTitle",pageTitle);
		
		return "member.management.static";
	}
	
	@PostMapping("sendStatic")
	@ResponseBody
	public String sendStatic(Principal principal, Model model,  @RequestParam(value="optionValue", defaultValue="0")Integer selector, Product product) {
		Date date = new Date();
        SimpleDateFormat sdformat = new SimpleDateFormat("MM");
        SimpleDateFormat sdformat2 = new SimpleDateFormat("YYYY");

		Calendar cal = Calendar.getInstance();

        int month = Calendar.MONTH;
        
        System.out.println(month);
		
        List<List<ProductView>> showStatic = new ArrayList<List<ProductView>>();
        Double [][] arr = new Double[4][2];
        for(int i =0 ; i<4 ;i++) {
        	cal.setTime(date);
        	cal.add(month, -i);
        	int pmonth = Integer.parseInt(sdformat.format(cal.getTime()));
    		int pyear = Integer.parseInt(sdformat2.format(cal.getTime()));
        	System.out.println(i+"월: "+pmonth+"년도" + pyear);
        	
        	System.out.println("principal:" + principal);
        	System.out.println("selector" + selector);
        	Double ss = productDao.getListToStatic(principal.getName(),selector,pmonth,  pyear);
        	System.out.println(ss);
        	arr[i][0] = Double.valueOf(pmonth);
        	arr[i][1]= ss;
        	
        }
        
        Gson gson = new Gson();
        String json = gson.toJson(arr);
        	
		return json;
	}
	


	@GetMapping("messageList")
	public String messageList(Model model) {
		
		String pageTitle = "대화";
		model.addAttribute("pageTitle",pageTitle);

		return "member.message.list";
	}
	
	/*@GetMapping("messageDetail")
	public String messageDetail() {
		
		return "member.message.detail";
	}*/
	
	@GetMapping("editInfo")
	public String editInfo(Principal principal, Model model) {
		Member member = memberDao.getMember(principal.getName());
		String pageTitle = "계정";
		
		model.addAttribute("pageTitle",pageTitle);
		model.addAttribute("member",member);
		return "member.profile.editinfo";
	}
	@PostMapping("editInfo")
	public String editInfo(Principal principal, Member member) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setId(principal.getName());
		System.out.println(member.getPassword());
		System.out.println(member.getNickname());
		String pwd = encoder.encode(member.getPassword());
		member.setPassword(pwd);
		int select = memberDao.editData(member);
		return "redirect:./introduce";
	}
	 
	
	@GetMapping("introduce")
	public String introduce(Principal principal, Model model) {
		Member member = memberDao.getMember(principal.getName());
		List<Skill> skill = skillDao.select(principal.getName());
		
		String pageTitle = "계정";
		
		model.addAttribute("pageTitle",pageTitle);
		model.addAttribute("member",member);
		model.addAttribute("skill",skill);
		System.out.println(member.getId());
		for (Skill sk : skill) {
			System.out.println(sk.getName());
		}
		return "member.profile.introduce";
	}
	
	@PostMapping("introduce")
	public String introduce(Principal principal, Member member, HttpServletRequest req, ProductView productView) {
		//List<ProductView> photo = productDao.getPhoto(principal.getName());
		member.setId(principal.getName());
		member.setSimple_introduction(member.getSimple_introduction());
		System.out.println("'simple_intro:' " + member.getSimple_introduction());
		member.setDetail_introduction(member.getDetail_introduction());
		System.out.println("'detail_intro:' " + member.getDetail_introduction());
		//req.getSession().setAttribute("photo",photo);
		int updateIntro = memberDao.updateIntro(member);
		//smemberService.insertMember(member, skill);
		return "redirect:login";
	}
	
	@GetMapping("point")
	public String point(Principal principal, Model model, @RequestParam(value="p" ,defaultValue="1") int page, @RequestParam(value="optionValue", defaultValue="0")Integer selector,PointHistory pointHistory) {
		System.out.println("selectornum: " + selector);
		List<PointHistory> showPage = pointHistoryDao.getListById(principal.getName(),page, selector);		
		int allCnt = pointHistoryDao.getAllCntById(principal.getName(),selector);
		int allSum = pointHistoryDao.getAllSumById(principal.getName(),selector);
		Member member = memberDao.getMember(principal.getName());
		//System.out.println("now Page: " + page);
		//System.out.println("total page: " +allCnt );
				int num=5; //화면에 보여질 페이지 번호의 갯수
				//끝 페이지 번호
				int endpage;
				endpage = (int)(Math.ceil((double)page/(double)num)*(double)num);
				//System.out.println("endpage: " +endpage);
				
				//시작페이지번호
						int startpage= (endpage-num);
						//System.out.println("startpage: "+startpage);
						
				//마지막 페이지 번호
				int tempendpage = (int)(Math.ceil((double)allCnt/(double)num));
				//System.out.println("tempendpage: " +tempendpage);
				if (endpage > tempendpage) {
					endpage = tempendpage;
					//System.out.println("endpage2:" + endpage);
				}
				
				
				
				//이전버튼 생성 여부
				boolean prev = startpage == 0 ? false:true;
				//System.out.println("prevbutton 여부: " + prev);
				//다음버튼 생성 여부
				boolean next = endpage * 5 >= allCnt ? false:true;
				//System.out.println("nextbutton 여부: " + next);
				String pageTitle = "계정";
				
				System.out.println("1:"+showPage);
				System.out.println("2:"+allSum);
				
				model.addAttribute("pageTitle",pageTitle);
				model.addAttribute("pointHistory",showPage);
				model.addAttribute("startpage",startpage);
				model.addAttribute("endpage",endpage);
				model.addAttribute("tempendpage",tempendpage);
				model.addAttribute("page",page);
				model.addAttribute("allCnt",allCnt);
				model.addAttribute("allSum",allSum);
				model.addAttribute("prev",prev);
				model.addAttribute("next",next);
				model.addAttribute("point1",member.getPoint());
		return "member.profile.point";
	}
	
	@GetMapping("review")
	public String review(Principal principal, Model model, @RequestParam(value="p" ,defaultValue="1") int page, @RequestParam(value="optionValue", defaultValue="0")Integer selector, Review review) {
		
		/*Timestamp time = null;
		Date date = new Date(time.getTime());
		SimpleDateFormat sdf= new SimpleDateFormat("yy/MM/dd ");
		String conver_time =  (sdf.format(date));*/
		
		//System.out.println("selectornum: " + selector);
		List<ReviewView> showPage = reviewDao.getListById(principal.getName(),page, selector);		
		//System.out.println(showPage.get(0).getWriter_id());
		int allCnt = reviewDao.getAllCntById(principal.getName(),selector);
		
		//System.out.println("now Page: " + page);
		//System.out.println("total page: " +allCnt );
		
		int num=5; //화면에 보여질 페이지 번호의 갯수
		
		//끝 페이지 번호
		int endpage;
		endpage = (int)(Math.ceil((double)page/(double)num)*(double)num);
		//System.out.println("endpage: " +endpage);
		
		//시작페이지번호
		int startpage= (endpage-num);
		//System.out.println("startpage: "+startpage);
		
		//마지막 페이지 번호
		int tempendpage = (int)(Math.ceil((double)allCnt/(double)num));
		//System.out.println("tempendpage: " +tempendpage);
		if (endpage > tempendpage) {
			endpage = tempendpage;
			//System.out.println("endpage2:" + endpage);
		}
		
		//이전버튼 생성 여부
		boolean prev = startpage == 0 ? false:true;
		//System.out.println("prevbutton 여부: " + prev);
		//다음버튼 생성 여부
		boolean next = endpage * 5 >= allCnt ? false:true;
		//System.out.println("nextbutton 여부: " + next);
		String pageTitle = "후기";
		
		model.addAttribute("pageTitle",pageTitle);
		model.addAttribute("review",showPage);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("tempendpage",tempendpage);
		model.addAttribute("page",page);
		model.addAttribute("allCnt",allCnt);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		//model.addAttribute("conver_time",conver_time);
		
		return "member.review.list";
	}

	
	@GetMapping("my_bookmarks")
	public String bookmarks(Principal principal, Model model, String category) {
		
		String id = principal.getName();
		List<Like> list = likeDao.select(id);
		List likeList = new ArrayList();
		
		for(Like li : list) {
			List<ProductView> likeProduct = productDao.getLikeView(li.getProduct_no());

			if(likeProduct.get(0).getTitle().length() >= 27) {
				ProductView pv = new ProductView();
				String title = likeProduct.get(0).getTitle().substring(0,27)+"...";
				likeProduct.get(0).setTitle(title);
	
			}
			
			likeList.add(likeProduct.get(0));
		}
		
		List<ParentCategorySY> PC_list = categoryDao.getParentCntList(id);
		
		model.addAttribute("likeList",likeList);
		model.addAttribute("PC_list",PC_list);

		return "member.bookmarks";
	}
	
	
	@RequestMapping("my_bookmarks_ajax")
	@ResponseBody
	public String subQna(Principal principal, String category) {
		System.out.println("sadadas");
		String id = principal.getName();
		List<Like> list = likeDao.select(id);
		
		List likeList = new ArrayList();
		 
		for(Like li : list) {
			List<ProductView> likeProduct = productDao.getLikeView(li.getProduct_no());

			if(category.equals("전체카테고리"))
				likeList.add(likeProduct.get(0));
			else if(!category.equals("전체카테고리"))
				if(likeProduct.get(0).getParentCategory().equals(category))
					likeList.add(likeProduct.get(0));

			System.out.println(likeProduct.get(0));
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(likeList);
		
		return json;
	}
	
	@GetMapping("{no}/like")
	@ResponseBody
	public String like(@PathVariable("no") Integer no, Principal principal) {
		Like like = new Like();
		like.setMember_id(principal.getName());
		like.setProduct_no(no);
		likeDao.insert(like);
		
		return "ok";
	}
	@GetMapping("{no}/delike")
	@ResponseBody
	public String delike(@PathVariable("no") Integer no, Principal principal) {
		Like like = new Like();
		like.setMember_id(principal.getName());
		like.setProduct_no(no);
		likeDao.delete(like);
		
		return "ok";
	}	
	
	 
	 @PostMapping("skill-send")
	 @ResponseBody
	 public String skillSend(Principal principal,String newSkill, Skill skill) {
		// System.out.println("'principal.getName()'"+principal.getName());
		 skill.setMemberId(principal.getName());
		 skill.setName(newSkill);
		 System.out.println("'newSkill': " + skill.getName());
		 int skillInsert = skillDao.insert(skill);
		 return newSkill;
	 }
	 
	 @PostMapping("delete-tech")
	 @ResponseBody
	 public String deleteTech(Principal principal, String deltech, Skill skill) {
		 skill.setMemberId(principal.getName());
		 skill.setName(deltech);
		 System.out.println("'delTech': "+skill.getName());
		 System.out.println("'delTech': "+skill.getMemberId());
		 
		 int skillDel = skillDao.skillDele(skill);
		 return deltech;
	 }
	 
	 @PostMapping("chgState")
	 @ResponseBody
	 public String chgState(Principal principal, String chgState, History history, int num) {
		 history.setSeller_id(principal.getName());
		 System.out.println(principal.getName());
		 System.out.println("chgState: " + history.getSeller_id());
		 history.setState(chgState);
		 history.setNo(num);
		 System.out.println(history.getNo());
		 int changeState = historyDao.chgState(history);
		 return chgState;
	 }

}
