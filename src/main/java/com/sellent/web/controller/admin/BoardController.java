package com.sellent.web.controller.admin;

import java.text.SimpleDateFormat; 
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sellent.web.dao.AdminProductDao;
import com.sellent.web.dao.CategoryDao;
import com.sellent.web.entity.AdminPaging;
import com.sellent.web.entity.AdminProductView;
import com.sellent.web.entity.CategoryView;
import com.sellent.web.entity.ParentCategory;
import com.sellent.web.entity.Qna;
import com.sellent.web.entity.Review;
import com.sellent.web.entity.ReviewView;
import com.sellent.web.entity.SubCategory;
import com.sellent.web.service.AdminProductService;
import com.sellent.web.service.AdminQnaService;
import com.sellent.web.service.AdminReviewService;
import com.sellent.web.service.CategoryService;
import com.google.gson.Gson;

@Controller("adminBoard")
@RequestMapping("/admin/board/")
public class BoardController {
	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private AdminProductService adminProductService;

	@Autowired
	private AdminReviewService adminReviewService;

	@Autowired
	private AdminQnaService adminQnaService;

	// list
	@GetMapping("category")
	public String category(
			@RequestParam(name = "parent", defaultValue = "") String parent,
			@RequestParam(name = "sub", defaultValue = "") String sub,
			@RequestParam(name = "page", defaultValue = "1") int page, 
			Model model) {

		int cnt = categoryService.getCategoryCnt(parent, sub);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<CategoryView> viewList = categoryService.getViewList(page, parent, sub, paging);
		List<ParentCategory> parentList = categoryService.getParentList();
		List<SubCategory> subList = categoryService.getSubList();

		model.addAttribute("viewList", viewList);
		model.addAttribute("parentList", parentList);
		model.addAttribute("subList", subList);
		model.addAttribute("paging", paging);
		model.addAttribute("parent", parent);
		model.addAttribute("sub", sub);

		return "admin.board.category";
	}

	@GetMapping("categoryModal")
	@ResponseBody
	public String categoryModal() {

		List<ParentCategory> parentList = categoryService.getParentList();
		List<SubCategory> subList = categoryService.getSubList();

		List list = new ArrayList();
		list.add(parentList);
		list.add(subList);

		Gson gson = new Gson();
		String parent = gson.toJson(list);

		return parent;

	}

	@PostMapping("parentInsert")
	@ResponseBody
	public String parentInsert(String parentValue) {

		int result = categoryService.insertParent(parentValue);

		return "ok";
	}

	@PostMapping("parentDelete")
	@ResponseBody
	public String parentDelete(String parentLabel) {

		int result = categoryService.deleteParent(parentLabel);

		return "ok";
	}

	@PostMapping("subInsert")
	@ResponseBody
	public String subInsert(String parentValue, String subValue) {

		int result = categoryService.insertSub(parentValue, subValue);

		return "ok";
	}

	@PostMapping("subDelete")
	@ResponseBody
	public String subDelete(String parentLabel, String subLabel) {

		int result = categoryService.deleteSub(parentLabel, subLabel);

		return "ok";
	}

	@PostMapping("categoryUpdate")
	@ResponseBody
	public String categoryUpdate(String parentBefore, String subBefore, String subAfter) {

		int result = categoryService.update(parentBefore, subBefore, subAfter);
		String dd;
		if (result != 0) {
			dd = "ok";
		} else {
			dd = "no";
		}

		return dd;
	}

	@GetMapping("board")
	public String board(@RequestParam(name = "parent", defaultValue = "") String parent,
			@RequestParam(name = "sub", defaultValue = "") String sub,
			@RequestParam(name = "sale", defaultValue = "2") int sale,
			@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "condition", defaultValue = "") String condition,
			@RequestParam(name = "text", defaultValue = "") String text,
			@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
		int cnt = adminProductService.getBoardCnt(parent, sub, sale, startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<AdminProductView> list = adminProductService.getBoard(parent, sub, sale, startDate, endDate, condition,
				text, paging);
		List<ParentCategory> parentList = categoryService.getParentList();
		List<SubCategory> subList = categoryService.getSubList();

		String query = "?parent=" + parent + "&sub=" + sub + "&sale=" + sale + "&startDate=" + startDate + "&endDate="
				+ endDate + "&condition=" + condition + "&text=" + text;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		model.addAttribute("parentList", parentList);
		model.addAttribute("subList", subList);

		return "admin.board.board";
	}

	@PostMapping("boardRemove")
	@ResponseBody
	public String boardRemove(@RequestParam(name = "arr") ArrayList<Integer> arr) {

		for (int i = 0; i < arr.size(); i++) {

			int result = adminProductService.delete(arr.get(i));
		}
		return "ok";
	}

	@GetMapping("sale")
	public String sale(@RequestParam(name = "approval", defaultValue = "") String approval,
			@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "condition", defaultValue = "") String condition,
			@RequestParam(name = "text", defaultValue = "") String text,
			@RequestParam(name = "page", defaultValue = "1") int page, Model model) {

		int cnt = adminProductService.getSaleCnt(approval, startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<AdminProductView> list = adminProductService.getSale(approval, startDate, endDate, condition, text,
				paging);
		String query = "?approval=" + approval + "&startDate=" + startDate + "&endDate=" + endDate + "&condition="
				+ condition + "&text=" + text;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);

		return "admin.board.sale";
	}

	@PostMapping("saleApproval")
	@ResponseBody
	public String saleApproval(String approval, int no, Model model) {

		int result = adminProductService.update(approval, no);

		return "ok";
	}

	@PostMapping("saleRemove")
	@ResponseBody
	public String saleRemove(@RequestParam(name = "arr") ArrayList<Integer> arr) {

		for (int i = 0; i < arr.size(); i++) {

			int result = adminProductService.delete(arr.get(i));
		}
		return "ok";
	}

	@GetMapping("comment")
	public String comment(@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "condition", defaultValue = "") String condition,
			@RequestParam(name = "text", defaultValue = "") String text,
			@RequestParam(name = "page", defaultValue = "1") int page, Model model) {

		int cnt = adminReviewService.getReviewCnt(startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<ReviewView> list = adminReviewService.getReviewView(startDate, endDate, condition, text, paging);
		String query = "?&startDate=" + startDate + "&endDate=" + endDate + "&condition=" + condition + "&text=" + text;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);

		return "admin.board.comment";
	}

	@PostMapping("commentRemove")
	@ResponseBody
	public String commentRemove(@RequestParam(name = "arr") ArrayList<Integer> arr) {

		for (int i = 0; i < arr.size(); i++) {

			int result = adminReviewService.delete(arr.get(i));
		}
		return "ok";
	}

	@GetMapping("consult")
	public String consult(@RequestParam(name = "state", defaultValue = "") String state,
			@RequestParam(name = "startDate", defaultValue = "") String startDate,
			@RequestParam(name = "endDate", defaultValue = "") String endDate,
			@RequestParam(name = "condition", defaultValue = "") String condition,
			@RequestParam(name = "text", defaultValue = "") String text,
			@RequestParam(name = "page", defaultValue = "1") int page, Model model) {

		int cnt = adminQnaService.getQnaCnt(state, startDate, endDate, condition, text);
		AdminPaging paging = new AdminPaging();
		paging.setTotalCount(cnt);
		paging.setPage(page);

		List<Qna> list = adminQnaService.getQna(state, startDate, endDate, condition, text, paging);
		String query = "?&state=" + state + "&startDate=" + startDate + "&endDate=" + endDate + "&condition="
				+ condition + "&text=" + text;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);

		return "admin.board.consult";
	}

	@PostMapping("consultRemove")
	@ResponseBody
	public String consultRemove(@RequestParam(name = "arr") ArrayList<Integer> arr) {

		for (int i = 0; i < arr.size(); i++) {

			int result = adminQnaService.delete(arr.get(i));
		}
		return "ok";
	}

	@PostMapping("consultState")
	@ResponseBody
	public String consultState(int state, int no, Model model) {

		int result = adminQnaService.update(state, no);

		return "ok";
	}

	@PostMapping("email-send")
	@ResponseBody
	public String emailSend(
			String title,
			String email,
			String content) throws MessagingException {
		
		String checkId = UUID.randomUUID().toString();
		
		//메시지 타입 설정(문자 이외에 이미지,동영상 가능)
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setFrom("asg0828@naver.com");		// SMTP에 등록한 자신의 아이디
		helper.setTo(email);
		helper.setText(content);
		helper.setSubject(title);
		
		javaMailSender.send(message);
		
		return checkId;
	}
	
	

}
