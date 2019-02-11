package com.sellent.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.dao.ProductDao;
import com.sellent.web.entity.Product;
import com.sellent.web.entity.ProductFile;
import com.sellent.web.service.ProductService;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductService productService;
	
	
	
	@GetMapping("list")
	public String list() {
		
		return "category.list";
	}
	
	@GetMapping("{no}")
	public String detail(@PathVariable("no") Integer no, Model model) {
		String root = "/sellent/upload/";
		Map<String, Object> product = productService.getProductByNo(no);
		
		Product pp = (Product)product.get("product");
		List<ProductFile> pf = (List<ProductFile>)product.get("files");
		
		if(pp != null) 
			model.addAttribute("product", pp);
		if(pf.size() != 0) {
			model.addAttribute("files", pf);
			model.addAttribute("root", root);
			model.addAttribute("thumbnail", pf.get(0).getSaveName());
		}
		
		return "category.detail";
	}
	
	@GetMapping("reg")
	public String reg() {
		return "category.reg";
	}
	
	private ArrayList<ProductFile> tempFiles;
	
	@PostMapping("reg")
	public String reg(Product product) {
		
		product.setWriterId("khh111");
		
		System.out.println(product);
		productService.insert(product, tempFiles);
		
		return "redirect:list";
	}
	
	@PostMapping("imageUp")
	@ResponseBody
	public String imageUp(@RequestParam("img") ArrayList<MultipartFile> files) throws IOException {
		tempFiles = new ArrayList<ProductFile>();
        String root = "E:\\sellent\\upload\\";
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
}
