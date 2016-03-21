package com.admin.action;

import java.util.HashMap;
import java.util.List;
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

import com.admin.service.RecruitService;
import com.admin.util.Utilities;

@Controller
@RequestMapping(value="/recruit")
public class RecruitController {

private static final Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	@Autowired
	private RecruitService recruitService;
	
	@RequestMapping(value="/main",method = RequestMethod.GET)
	public String main(Model model,HttpServletRequest request){
		logger.info("recruit");
		
		//페이지 넘버
		String PaginationNum = request.getParameter("PaginationNum");
		Map<String,Object> map = new HashMap<String, Object>();
		//총 리스트 수 구하기
		int RecruitListTotal = recruitService.getRecruitListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,RecruitListTotal,PaginationNum);
		
		//list가져오기
		List<Map<String,Object>> list =recruitService.getRecruitList(param);
		model.addAttribute("recruitList", list);
		model.addAttribute("paramInfo", param);
		
		return "recruit/recruit";
	}
	
	@RequestMapping(value="/main",method = RequestMethod.POST)
	public String recruitpost(Model model,HttpServletRequest request){
		logger.info("recruitpost");
		
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String PaginationNum = request.getParameter("PaginationNum");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		//총 리스트 수 구하기
		int RecruitListTotal = recruitService.getRecruitListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,RecruitListTotal,PaginationNum);
		param.putAll(map);
		//list가져오기
		List<Map<String,Object>> list =recruitService.getRecruitList(param);
		model.addAttribute("recruitList", list);
		model.addAttribute("paramInfo", param);
		
		return "recruit/recruit";
	}
	
	@RequestMapping(value="/detail/{no}",method = RequestMethod.GET)
	public String detail(Model model,@PathVariable String no){
		
		
		Map<String,Object> map = recruitService.RecruitDetail(no);
		recruitService.updateOpenYn(no);
		model.addAttribute("recruit", map);
		
		return "recruit/detail";
	}
	
	@RequestMapping(value="/delete/{no}",method = RequestMethod.GET)
	public String delete(Model model,@PathVariable String no){
		
		recruitService.recruitDelete(no);
		
		return "redirect:/recruit/main";
	}
}
