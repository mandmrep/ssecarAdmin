package com.admin.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.admin.service.NewsService;
import com.admin.util.Utilities;

@Controller
@RequestMapping(value="/news")
public class NewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpServletRequest request) {
		logger.info("news");
		
		//페이지 넘버
		String PaginationNum = request.getParameter("PaginationNum");
		Map<String,Object> map = new HashMap<String,Object>();
		//총 리스트 수 구하기
		int NewsListTotal = newsService.getNewsListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,NewsListTotal,PaginationNum);
		
		//list가져오기
		List<Map<String,Object>> list = newsService.getNewsList(param);
		model.addAttribute("NewsList", list);
		model.addAttribute("paramInfo", param);
		
		return "news/news";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String newspost(Locale locale, Model model,HttpServletRequest request) {
		logger.info("newspost");
		
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String PaginationNum = request.getParameter("PaginationNum");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		//총 리스트 수 구하기
		int NewsListTotal = newsService.getNewsListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,NewsListTotal,PaginationNum);
		param.putAll(map);
		
		//list가져오기
		List<Map<String,Object>> list = newsService.getNewsList(param);
		model.addAttribute("NewsList", list);
		model.addAttribute("paramInfo", param);
		
		return "news/news";
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public String registForm(Locale locale, Model model,HttpServletRequest request) {
		logger.info("registForm");
		
		return "news/registform";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(Locale locale, Model model,HttpServletRequest request,@RequestParam("file") MultipartFile file) {
		logger.info("regist");
		
		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		String content = request.getParameter("content");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("subtitle", subtitle);
    	
    	String fileName = null;
        try {
            fileName = file.getOriginalFilename();
            byte[] bytes = file.getBytes();
            
            //File fileImg = new File(path + fileName);
            String defaultPath = request.getSession().getServletContext().getRealPath("/")+"resources/upload/news/";
            
            //디렉토리 존재하지 않을경우 디렉토리 생성
            File folderPath = new File(defaultPath);
			if(!folderPath.exists()) {
				folderPath.mkdirs();
			}
			 
			//파일저장
            BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(defaultPath+fileName));
            buffStream.write(bytes);
            buffStream.close();
            
            map.put("thumbnail", "http://www.ssecarsteam.com/resources/upload/news/" + fileName);
        } catch (IOException e) {
            
        }
		newsService.newsWrite(map);
		
		return "redirect:/news/main";
	}
	
	@RequestMapping(value="/delete/{no}")
	public String delete(Locale locale, Model model,@PathVariable String no) {
		logger.info("delete");
		
		newsService.newsDelete(no);
		
		return "redirect:/news/main";
	}
	
	@RequestMapping(value="/newsDetail/{no}")
	public String newsDetail(Model model,@PathVariable String no) {
		logger.info("newsDetail");
		
		Map<String,Object> news = newsService.newsDetail(no);
		model.addAttribute("news", news);
		
		return "news/newsDetail";
	}
	
	@RequestMapping(value="/update/{no}")
	public String update(Model model,@PathVariable String no) {
		logger.info("update");
		
		Map<String,Object> news = newsService.newsDetail(no);
		model.addAttribute("news", news);
		
		return "news/updateform";
	}
	
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public String updateAction(Locale locale, Model model,HttpServletRequest request,@RequestParam("file") MultipartFile file) {
		logger.info("updateAction");
		
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		String content = request.getParameter("content");
		String thumbnail = request.getParameter("thumbnail");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("title", title);
		map.put("content", content);
		map.put("subtitle", subtitle);
    	
    	String fileName = null;
    	if(file.getSize() > 0 ){
    		try {
                fileName = file.getOriginalFilename();
                byte[] bytes = file.getBytes();
                
                //File fileImg = new File(path + fileName);
                String defaultPath = request.getSession().getServletContext().getRealPath("/")+"resources/upload/news/";
                
                //디렉토리 존재하지 않을경우 디렉토리 생성
                File folderPath = new File(defaultPath);
    			if(!folderPath.exists()) {
    				folderPath.mkdirs();
    			}
    			 
    			//파일저장
                BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(defaultPath+fileName));
                buffStream.write(bytes);
                buffStream.close();
                
                map.put("thumbnail", "http://www.ssecarsteam.com/resources/upload/news/" + fileName);
            } catch (IOException e) {
                
            }
    	}else{
    		map.put("thumbnail" , thumbnail);
    	}
        
		newsService.updateAction(map);
		
		return "redirect:/news/main";
	}
}
