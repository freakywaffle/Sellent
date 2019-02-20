package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.sellent.web.dao.CategoryDao;
import com.sellent.web.dao.HistoryDao;
import com.sellent.web.dao.LikeDao;
import com.sellent.web.dao.PointHistoryDao;
import com.sellent.web.dao.ProductDao;
import com.sellent.web.dao.ProductFileDao;
import com.sellent.web.dao.ReviewDao;
import com.sellent.web.entity.History;
import com.sellent.web.entity.Like;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.ProductView;
import com.sellent.web.entity.ReviewView;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.ProductService;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private LikeDao likeDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private HistoryDao historyDao;
	
	@Autowired
	private PointHistoryDao pointHistoryDao;
	
	
	@GetMapping("{category}")
	public String list(@PathVariable("category") String category, 
			@RequestParam(value="sub",defaultValue="") String sub,
			Principal principal, 
			Model model) {
		System.out.println(category);
		
		List<ProductView> plist = productDao.getList(category, sub, 0, 7);
		model.addAttribute("plist", plist);
		if(principal != null) {
			List<Like> llist = likeDao.getListById(principal.getName());
			model.addAttribute("llist", llist);
		}
		
		model.addAttribute("subCtList", categoryDao.getSubListByParent(category));
		
		
		return "category.list";
	}
	
	
	@GetMapping("search")
	public String search(String keyword, 
			ArrayList<ParentCategory> categoryList,
			Principal principal, 
			Model model){
		
		
		List<ProductView> plist = productDao.getListBySearch(keyword, categoryList,-1, 0, 7);
		
		model.addAttribute("plist", plist);
		if(principal != null) {
			List<Like> llist = likeDao.getListById(principal.getName());
			model.addAttribute("llist", llist);
		}
		
		List<ProductView> allList = productDao.getListBySearchAll(keyword, categoryList, -1);
		List<String> sideList = new ArrayList<String>();
		
		for(ProductView pv: allList) {
			if(!sideList.contains(pv.getParentCategory())) {
				sideList.add(pv.getParentCategory());
			}
		}
		
		model.addAttribute("sideList", sideList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("allCnt", allList.size());
		return "category.search";
	}
	
	
	@GetMapping("{category}/{no}")
	public String detail(@PathVariable("no") Integer no, Model model, Principal principal){
		
		Map<String, Object> product = productService.getProductByNo(no);
		List<ReviewView> reviews = reviewDao.getListByProductNo(no, 10);
		
		
		if(principal != null) {
			Like like = new Like();
			like.setMember_id(principal.getName());
			like.setProduct_no(no);
			int affected = likeDao.hasLike(like);
			if(affected != 0)
				product.put("like", true);
			
			int affected2 = historyDao.hasBuy(principal.getName(), no);
			if(affected2 != 0)
				model.addAttribute("buyed", "true");
		}	
		
		model.addAttribute("map", product);
		if(reviews.size()!=0)
			model.addAttribute("reviews", reviews);
		
		return "category.detail";
	}
	
	
	@GetMapping("reg")
	public String reg(Model model) {
		
		List<ParentCategory> p_Category = categoryDao.getParentList();
		List<SubCategory> s_Category = categoryDao.getSubList();
		
		List parentCategory = new ArrayList();
		List subCategory = new ArrayList();
		
		for(int i=0; i<p_Category.size(); i++) {
			parentCategory.add(p_Category.get(i));
		}
		for(int i=0; i<s_Category.size(); i++) {
			subCategory.add(s_Category.get(i));
		}
		System.out.println(parentCategory);
		System.out.println(subCategory);
		model.addAttribute("parentCategory", parentCategory);
		model.addAttribute("subCategory", subCategory);
		return "category.reg";
	}
	
	private ArrayList<ProductFile> tempFiles;
	
	@PostMapping("reg")
	public String reg(Product product, Principal principal) {
		
		product.setWriterId(principal.getName());
		System.out.println(product);
		productService.insert(product, tempFiles);
		
		return "redirect:"+product.getParentCategory();
	}
	
	
	@GetMapping("{category}/{no}/delete")
	@ResponseBody
	public String delete(@PathVariable("no") Integer no) {
		
		productDao.delete(no);
		
		return "";
	}
	
	@PostMapping("imageUp")
	@ResponseBody
	public String imageUp(@RequestParam("img") ArrayList<MultipartFile> files) throws IOException {
		tempFiles = new ArrayList<ProductFile>();
        String root = "F:\\sellent\\upload\\";
        int recentNo = productDao.getRecentlyNo()+1;
        String path = root+recentNo;
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }

		for(MultipartFile file : files) {
			
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			String fileName = file.getOriginalFilename();
			String saveName = now + "_" + file.getOriginalFilename();
			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveName);
			fos.write(data);
			fos.close();
			
			ProductFile pf = new ProductFile();
			pf.setName(fileName);
			pf.setSaveName(saveName);
			pf.setProductNo(recentNo);
			
			tempFiles.add(pf);
		}
		
		return "ok";
	}
	
	@PostMapping("{category}/{no}/review")
	@ResponseBody
	public String review(@PathVariable("no") Integer no, String json, Principal principal) {
		productService.regReview(no, json, principal);
		List<ReviewView> reviews = reviewDao.getListByProductNo(no, 10);
		String jsonArr = "{\"reviews\":["; 
		for(int i = 0; i<reviews.size();i++) {
			jsonArr+=reviews.get(i).toString();
			if(i != reviews.size()-1)
				jsonArr+=",";
		}
		jsonArr += "]";
		
		ProductView product = productDao.get(no);
		
		jsonArr += ", \"reviewCnt\":"+product.getReviewCnt();
		jsonArr += ", \"avgStarPoint\":"+product.getAvgStarPoint()+"}";
		
		
		int update = pointHistoryDao.update_sy(product.getWriterId(),50);
		
		System.out.println(jsonArr);
		return jsonArr;
	}
	
	@GetMapping("{category}/{no}/moreReview")
	@ResponseBody
	public String moreReview(@PathVariable("no") Integer no, @RequestParam int cnt) {
		List<ReviewView> reviews = reviewDao.getListByProductNo(no, cnt);
		String jsonArr = "{\"reviews\":["; 
		for(int i = 0; i<reviews.size();i++) {
			jsonArr+=reviews.get(i).toString();
			if(i != reviews.size()-1)
				jsonArr+=",";
		}
		jsonArr += "]";
		
		jsonArr += ", \"reviewCnt\":"+productDao.get(no).getReviewCnt()+"}";
		return jsonArr;
	}
	
	@GetMapping("{category}/{no}/like")
	@ResponseBody
	public String like(@PathVariable("no") Integer no, Principal principal) {
		Like like = new Like();
		like.setMember_id(principal.getName());
		like.setProduct_no(no);
		likeDao.insert(like);
		return "";
	}
	@GetMapping("{category}/{no}/delike")
	@ResponseBody
	public String delike(@PathVariable("no") Integer no, Principal principal) {
		Like like = new Like();
		like.setMember_id(principal.getName());
		like.setProduct_no(no);
		likeDao.delete(like);
		return "";
	}
	
	@GetMapping("{category}/{no}/buy")
	@ResponseBody
	public String buy(@PathVariable("no") Integer no, Principal principal, String seller) {
		String id = principal.getName();
		
		History history = new History();
		history.setBuyer_id(id);
		history.setSeller_id(seller);
		history.setProduct_no(no);
		
		historyDao.insert(history);
		
		return "";
	}
	@GetMapping("{category}/{no}/cancelBuy")
	@ResponseBody
	public String cancelBuy(@PathVariable("no") Integer no, Principal principal, String seller) {
		String id = principal.getName();
		System.out.println(id);
		System.out.println(no);
		History history = new History();
		history.setBuyer_id(id);
		history.setProduct_no(no);
		
		historyDao.delete(history);
		
		return "";
	}
	
	
	@PostMapping("{category}/moreCategory")
	@ResponseBody
	public String moreCategory(int cnt, 
			@PathVariable("category") String parent,
			String query,
			String sellChk,
			Principal principal){
		
		JsonParser parser = new JsonParser();
		JsonElement jsonQuery = parser.parse(query);
		JsonElement jsonSellChk = parser.parse(sellChk);
		
		String sub = "";
		int yes = 0;
		int no = 0;
		
		if(jsonQuery.getAsJsonObject().get("sub") != null) {
			sub = jsonQuery.getAsJsonObject().get("sub").getAsString();
		}
		if(jsonSellChk.getAsJsonObject().get("yes") != null) {
			yes = jsonSellChk.getAsJsonObject().get("yes").getAsInt();
		}
		if(jsonSellChk.getAsJsonObject().get("no") != null) {
			no = jsonSellChk.getAsJsonObject().get("no").getAsInt();
		}
		
		int sell_chk = -1;
		
		if(yes==0 && no==1) {
			sell_chk = 0;
		}else if(yes==1 && no==0) {
			sell_chk = 1;
		}
		
		
		Gson gson = new Gson();
		Map<String, Object> temp = new HashMap<>();
		
		System.out.println("parent"+parent);
		System.out.println("sub"+sub);
		
		List<ProductView> morelist = productDao.getListByFilter(parent, sub, sell_chk, cnt, 7);
		int allCnt = productDao.getAllCnt();
		if(principal != null) {
			List<Like> llist = likeDao.getListById(principal.getName());
			temp.put("llist", llist);
		}
		
		
		
		temp.put("morelist", morelist);
		temp.put("allCnt", allCnt);
		
		String json = gson.toJson(temp);
		
		System.out.println(json);
		
		
		return json;
	}
	
	@PostMapping("{category}/filter")
	@ResponseBody
	public String filter(
			@PathVariable("category") String parent,
			String query,
			String sellChk,
			Principal principal) {
		Map<String, Object> temp = new HashMap<>();
		
		if(principal != null) {
			List<Like> llist = likeDao.getListById(principal.getName());
			temp.put("llist", llist);
		}
		
		JsonParser parser = new JsonParser();
		JsonElement jsonQuery = parser.parse(query);
		JsonElement jsonSellChk = parser.parse(sellChk);
		
		
		String keyword = "";
		String sub = "";
		int yes = 0;
		int no = 0;
		
		if(jsonQuery.getAsJsonObject().get("sub") != null) {
			sub = jsonQuery.getAsJsonObject().get("sub").getAsString();
		}
		if(jsonQuery.getAsJsonObject().get("keyword") != null) {
			keyword = jsonQuery.getAsJsonObject().get("keyword").getAsString();
		}
		if(jsonSellChk.getAsJsonObject().get("yes") != null) {
			yes = jsonSellChk.getAsJsonObject().get("yes").getAsInt();
		}
		if(jsonSellChk.getAsJsonObject().get("no") != null) {
			no = jsonSellChk.getAsJsonObject().get("no").getAsInt();
		}
		
		int sell_chk = -1;
		
		if(yes==0 && no==1) {
			sell_chk = 0;
		}else if(yes==1 && no==0) {
			sell_chk = 1;
		}
		
		System.out.println(sub);
		System.out.println(keyword);
		System.out.println(sell_chk);
		
		List<ProductView> plist = productDao.getListByFilter(parent, sub, sell_chk, 0, 7);
		
		temp.put("plist", plist);
		
		
		int allCnt = productDao.getAllCnt();
		temp.put("allCnt", allCnt);
		
		
		Gson gson = new Gson();
		String json = gson.toJson(temp);
		
		
		return json;
	}
	
	@PostMapping("search/parentFilter")
	@ResponseBody
	public String parentFilter(
			String keyword,
			String sellChk,
			String parents,
			Principal principal) {
		Map<String, Object> temp = new HashMap<>();
		
		if(principal != null) {
			List<Like> llist = likeDao.getListById(principal.getName());
			temp.put("llist", llist);
		}
		
		JsonParser parser = new JsonParser();
		JsonElement jsonSellChk = parser.parse(sellChk);
		JsonElement jsonParents = parser.parse(parents);
		
		int yes = 0;
		int no = 0;
		
		if(jsonSellChk.getAsJsonObject().get("yes") != null) {
			yes = jsonSellChk.getAsJsonObject().get("yes").getAsInt();
		}
		if(jsonSellChk.getAsJsonObject().get("no") != null) {
			no = jsonSellChk.getAsJsonObject().get("no").getAsInt();
		}
		
		int sell_chk = -1;
		
		if(yes==0 && no==1) {
			sell_chk = 0;
		}else if(yes==1 && no==0) {
			sell_chk = 1;
		}
		
		
		
		List<ParentCategory> parentList = new ArrayList<ParentCategory>();
		
		
		if(jsonParents!=null) {
			JsonArray parentArr = jsonParents.getAsJsonArray();
			for(int i=0;i<parentArr.size();i++) {
				System.out.println(i+"번쨰: "+parentArr.get(i));
				if(!String.valueOf(parentArr.get(i)).equals("null")) {
					String parent = parentArr.get(i).getAsString();
					parentList.add(new ParentCategory(parent));
					System.out.println(parent);
					
				}
			}
		}
		
		
		List<ProductView> plist = productDao.getListBySearch(keyword, parentList, sell_chk, 0, 7);
		List<ProductView> pAll = productDao.getListBySearchAll(keyword, parentList, sell_chk);
		temp.put("plist", plist);
		
		
		System.out.println(keyword);
		System.out.println(sell_chk);
		
		temp.put("allCnt", pAll.size());
		
		Gson gson = new Gson();
		String json = gson.toJson(temp);
		
		
		return json;
	}
	
	@PostMapping("search/moreSearch")
	@ResponseBody
	public String moreSearch(int cnt,
			String keyword,
			String sellChk,
			String parents,
			Principal principal) {
		Map<String, Object> temp = new HashMap<>();
		
		if(principal != null) {
			List<Like> llist = likeDao.getListById(principal.getName());
			temp.put("llist", llist);
		}
		
		JsonParser parser = new JsonParser();
		JsonElement jsonSellChk = parser.parse(sellChk);
		JsonElement jsonParents = parser.parse(parents);
		
		int yes = 0;
		int no = 0;
		
		if(jsonSellChk.getAsJsonObject().get("yes") != null) {
			yes = jsonSellChk.getAsJsonObject().get("yes").getAsInt();
		}
		if(jsonSellChk.getAsJsonObject().get("no") != null) {
			no = jsonSellChk.getAsJsonObject().get("no").getAsInt();
		}
		
		int sell_chk = -1;
		
		if(yes==0 && no==1) {
			sell_chk = 0;
		}else if(yes==1 && no==0) {
			sell_chk = 1;
		}
		
		List<ParentCategory> parentList = new ArrayList<ParentCategory>();
		
		if(jsonParents!=null) {
			JsonArray parentArr = jsonParents.getAsJsonArray();
			for(int i=0;i<parentArr.size();i++) {
				System.out.println(i+"번쨰: "+parentArr.get(i));
				if(!String.valueOf(parentArr.get(i)).equals("null")) {
					String parent = parentArr.get(i).getAsString();
					parentList.add(new ParentCategory(parent));
					System.out.println(parent);
					
				}
			}
		}
		List<ProductView> plist = productDao.getListBySearch(keyword, parentList, sell_chk, cnt, 7);
		List<ProductView> pAll = productDao.getListBySearchAll(keyword, parentList, sell_chk);
		temp.put("plist", plist);
		
		System.out.println(keyword);
		System.out.println(sell_chk);
		
		temp.put("allCnt", pAll.size());
		
		Gson gson = new Gson();
		String json = gson.toJson(temp);
		
		
		return json;
	}
	
	
	
}
