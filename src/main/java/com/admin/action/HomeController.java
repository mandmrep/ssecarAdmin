package com.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.service.NoticeService;
import com.admin.util.Utilities;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home!");
		
		//페이지 넘버
		String PaginationNum = request.getParameter("PaginationNum");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		//총 리스트 수 구하기
		int NoticeListTotal = noticeService.getNoticeListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,NoticeListTotal,PaginationNum);
		
		//list가져오기
		List<Map<String,Object>> list = noticeService.getNoticeList(param);
		model.addAttribute("NoticeList", list);
		model.addAttribute("paramInfo", param);
		
		return "index";
	}
	
	@RequestMapping(value = "/detail/{no}", method = RequestMethod.GET)
	public String detail(Locale locale, Model model,@PathVariable String no) {
		logger.info("detail");
		
		Map<String,Object> map = noticeService.noticeDetail(no);
		model.addAttribute("notice", map);
		
		return "noticeDetail";
	}
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public String favicon() {
		
		return "redirect:/";
	}
	
}
