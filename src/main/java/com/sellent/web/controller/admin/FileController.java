package com.sellent.web.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/file/")
public class FileController {
	
	@GetMapping("page")
	public String page() {
		return "admin.file.page";
	}
	
	@GetMapping("upload")
	public String upload(MultipartHttpServletRequest multipartHttpServletRequest) throws IllegalStateException, IOException {
		
		// 파일 경로
		String filePath = "F:\\sellent\\admin\\";
		
		// 파라미터명이 files인 파일을 가져온다 -> List형태로 담는다
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
		
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
		
		return "redirect:./page";
	}

//	
//	@GetMapping("download")
//	public String download(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//		
//        String path = "F:\\sellent\\admin\\";
//        String filename = req.getParameter("fileName");
//        
//        File file = new File(path + filename);
//        resp.setContentType("aplication/download");
//        resp.setContentLengthLong(file.length());
//        
//        filename = URLEncoder.encode(filename, "utf-8").replace("+", "%20").replace("(", "%28").replace(")", "%29");
//        
//        resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
//        
//        OutputStream out = resp.getOutputStream();
//        FileInputStream fis = null;
//        
//        try {
//            int temp;
//            fis = new FileInputStream(file);
//            while((temp = fis.read()) != -1) {
//                out.write(temp);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if(fis != null) {
//                try {
//                    fis.close();
//                } catch (Exception e2) {
//                    e2.printStackTrace();
//                }
//            }
//        }
//		return "redirect:./page";
//	}
}
