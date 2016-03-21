package com.admin.action;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.dto.UserVo;
import com.admin.service.NanoService;
import com.admin.util.Utilities;

@Controller
@RequestMapping(value="/nano")
public class NanoController {
	private static final Logger logger = LoggerFactory.getLogger(NanoController.class);
	
	@Autowired
	private NanoService nanoService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpServletRequest request) {
		logger.info("nano");
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//페이지 넘버
		String PaginationNum = request.getParameter("PaginationNum");
		Map<String,Object> map = new HashMap<String,Object>();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			map.put("fno", user.getFno());
		}
		//총 리스트 수 구하기
		int RecruitListTotal = nanoService.getNanoListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,RecruitListTotal,PaginationNum);
		param.putAll(map);
		
		//list가져오기
		List<Map<String,Object>> list =nanoService.getNanoList(param);
		model.addAttribute("nanoList", list);
		model.addAttribute("paramInfo", param);
		
		return "nano/nano";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String nanopost(Locale locale, Model model,HttpServletRequest request) {
		logger.info("nanopost");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String PaginationNum = request.getParameter("PaginationNum");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("qnalist", qnalist);
		map.put("search", search);
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			map.put("fno", user.getFno());
		}
		//총 리스트 수 구하기
		int RecruitListTotal = nanoService.getNanoListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,RecruitListTotal,PaginationNum);
		param.putAll(map);
		
		//list가져오기
		List<Map<String,Object>> list =nanoService.getNanoList(param);
		model.addAttribute("nanoList", list);
		model.addAttribute("paramInfo", param);
		
		return "nano/nano";
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public String registForm(Model model) {
		logger.info("registForm");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String,Object> registForm = nanoService.registForm(user.getFno());
		List<Map<String,Object>> manufacturer = nanoService.getManufacturerList();
		
		model.addAttribute("registForm", registForm);
		model.addAttribute("manufacturer", manufacturer);
		
		return "nano/registForm";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(Locale locale, Model model,HttpServletRequest request) {
		logger.info("regist");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
		Map<String,Object> map = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			map.put(name, request.getParameter(name));
		}
		map.put("fno", user.getFno());
		nanoService.regist(map);
		
		return "redirect:/nano/main";
	}
	
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String delete(@PathVariable String no) {
		logger.info("delete");
		
		nanoService.delete(no);
		
		return "redirect:/nano/main";
	}
	
	@RequestMapping(value = "/updateForm/{no}", method = RequestMethod.GET)
	public String updateForm(Model model,@PathVariable String no) {
		logger.info("updateForm");
		List<Map<String,Object>> manufacturer = nanoService.getManufacturerList();
		Map<String,Object> map = nanoService.updateForm(no);
		
		model.addAttribute("nano", map);
		model.addAttribute("manufacturer", manufacturer);
		
		return "nano/updateForm";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model,HttpServletRequest request) {
		logger.info("update");
	
		Map<String,Object> map = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			map.put(name, request.getParameter(name));
		}
		
		nanoService.update(map);
		
		return "redirect:/nano/main";
	}
}
