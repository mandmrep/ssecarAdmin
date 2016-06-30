package com.admin.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.admin.dto.UserVo;
import com.admin.service.EventService;
import com.admin.util.Utilities;


@Controller
@RequestMapping(value="/event")
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpServletRequest request) {
		logger.info("event");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String,Object> info = new HashMap<String, Object>();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			info.put("username", user.getUsername());
		}
		
		//페이지네이션
		String PaginationNum = request.getParameter("PaginationNum");
		//총 리스트 수 구하기
		int EventListTotal = eventService.getEventListTotal(info);
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,EventListTotal,PaginationNum);
		param.putAll(info);
		
		//list가져오기
		List<Map<String,Object>> list = eventService.getEventList(param);
		model.addAttribute("EventList", list);
		model.addAttribute("paramInfo", param);

		return "event/event";
	}
	
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String search(Locale locale, Model model,HttpServletRequest request) {
		logger.info("search");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		
		Map<String,Object> info = new HashMap<String, Object>();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			info.put("username", user.getUsername());
		}
		if(qnalist != null && !qnalist.equals("")){
			info.put("qnalist", qnalist);
			info.put("search", search);
		}
		//페이지네이션
		String PaginationNum = request.getParameter("PaginationNum");
		//총 리스트 수 구하기
		int EventListTotal = eventService.getEventListTotal(info);
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,EventListTotal,PaginationNum);
		param.putAll(info);
		
		//list가져오기
		List<Map<String,Object>> list = eventService.getEventList(param);
		model.addAttribute("EventList", list);
		model.addAttribute("paramInfo", param);
 
		return "event/event";
	}
	
	@RequestMapping(value="/detail/{no}", method = RequestMethod.GET)
	public String detail(Locale locale, Model model,@PathVariable String no) {
		logger.info("detail");
		
		Map<String,Object> eventDetail = eventService.eventDetail(no);
		model.addAttribute("event", eventDetail);
		
		return "event/detail";
	}
	
	@RequestMapping(value="/registform", method = RequestMethod.GET)
	public String registform(Locale locale, Model model,HttpServletRequest request) {
		logger.info("registform");
		
		return "event/registform";
	}
	
	@RequestMapping(value="/eventWrite", method=RequestMethod.POST )
    public String eventWrite(HttpServletRequest request,@RequestParam("file") MultipartFile file){
		logger.info("eventWrite");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//이벤트 정보		
    	String title = request.getParameter("title");
    	String subtitle = request.getParameter("subtitle");
    	String content = request.getParameter("content");
    	String date = request.getParameter("date");
    	
    	Map<String,Object> param = new HashMap<String, Object>();
    	param.put("username", user.getUsername());
    	param.put("title", title);
    	param.put("subtitle", subtitle);
    	param.put("content", content);
    	param.put("startDate", date.substring(0, 10));
    	param.put("endDate", date.substring(13, 23));
    	param.put("writer", user.getName());
    	
    	String fileName = null;
        try {
            fileName = file.getOriginalFilename();
            byte[] bytes = file.getBytes();
            
            //File fileImg = new File(path + fileName);
            String defaultPath = request.getSession().getServletContext().getRealPath("/")+"resources/upload/event/";
            
            //디렉토리 존재하지 않을경우 디렉토리 생성
            File folderPath = new File(defaultPath);
			if(!folderPath.exists()) {
				folderPath.mkdirs();
			}
			
            BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(defaultPath+fileName));
            buffStream.write(bytes);
            buffStream.close();
            
            param.put("thumbnail", "http://www.ssecarsteam.com/resources/upload/event/" + fileName);
        } catch (IOException e) {
            
        }
    	
    	eventService.eventWrite(param);
    	
    	return "redirect:/event/main";
    }
	
	@RequestMapping(value="/updateForm/{no}", method = RequestMethod.GET)
	public String modifyform(Locale locale, Model model,@PathVariable String no) {
		logger.info("updateForm");
		
		Map<String,Object> map = eventService.eventDetail(no);
		model.addAttribute("event", map);
		
		return "event/updateForm";
	}

	@RequestMapping(value = "/eventUpdate", method = RequestMethod.POST)
	public String eventModifyAction(HttpServletRequest request, Model model,@RequestParam("file") MultipartFile file) {
		logger.info("eventUpdate");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		String date = request.getParameter("date");
		param.put("startDate", date.substring(0, 10));
    	param.put("endDate", date.substring(13, 23));
    	
    	if (file != null) {
    		
            try {
            	String defaultPath = request.getSession().getServletContext().getRealPath("/")+"resources/upload/event/";
            	String fileName = file.getOriginalFilename();
                
                File temp = new File(defaultPath + request.getParameter("thumbnail"));
                temp.delete();
                
                byte[] bytes = file.getBytes();
                BufferedOutputStream buffStream = 
                        new BufferedOutputStream(new FileOutputStream(new File(defaultPath + fileName)));
                buffStream.write(bytes);
                buffStream.close();
                
                param.put("thumbnail", "http://www.ssecarsteam.com/resources/upload/event/" + fileName );
            } catch (Exception e) {

            }
    		
    	}
    	
    	eventService.eventModifyAction(param);
    	
		return "redirect:/event/main"; 
    }
	
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String eventDelete(Locale locale, Model model,@PathVariable String no) {
		logger.info("eventDelete");
		
		eventService.eventDelete(no);
		
		return "redirect:/event/main";
	}

}
