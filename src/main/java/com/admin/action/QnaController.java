package com.admin.action;

import java.util.HashMap;
import java.util.List;
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
import com.admin.service.QnaService;
import com.admin.util.Utilities;


@Controller
@RequestMapping(value="/qna")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value="/main",method = RequestMethod.GET)
	public String main(Model model,HttpServletRequest request){
		logger.info("qna");
		
		//정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String PaginationNum = request.getParameter("PaginationNum");
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		
		Map<String,Object> map = new HashMap<String, Object>();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			map.put("fno", user.getFno());
		}
		if(qnalist != null && !qnalist.equals("")){
			map.put("qnalist", qnalist);
			map.put("search", search);
		}
		
		int QnaListTotal = qnaService.getQnaListTotal(map);
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,QnaListTotal,PaginationNum);
		param.putAll(map);
		
		//list가져오기
		List<Map<String,Object>> list =qnaService.getQnaList(param);
		model.addAttribute("qnaList", list);
		model.addAttribute("paramInfo", param);
		
		return "qna/qna";
	}
	
	@RequestMapping(value="/main",method = RequestMethod.POST)
	public String search(Model model,HttpServletRequest request){
		logger.info("search");
		
		//정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String PaginationNum = request.getParameter("PaginationNum");
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		if(qnalist != null && !qnalist.equals("")){
			map.put("qnalist", qnalist);
			map.put("search", search);
		}
		
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			map.put("username", user.getUsername());
		}
		
		//총 리스트 수 구하기
		int QnaListTotal = qnaService.getQnaListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,QnaListTotal,PaginationNum);
		param.putAll(map);
		
		//list가져오기
		List<Map<String,Object>> list =qnaService.getQnaList(param);
		model.addAttribute("qnaList", list);
		model.addAttribute("paramInfo", param);
		
		return "qna/qna";
	}
	
	@RequestMapping(value="/detail/{no}")
	public String detail(Model model,@PathVariable String no){
		
		Map<String,Object> map = qnaService.qnaDetail(no);
		qnaService.updateOpenYn(no);
		model.addAttribute("qna", map);
		
		return "qna/detail";
	}
	
	@RequestMapping(value="/delete/{no}")
	public String delete(Model model,@PathVariable String no){
		
		qnaService.qnaDelete(no);
		
		return "redirect:/qna/main";
	}
}
