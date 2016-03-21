package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.admin.dto.FranchiseVo;
import com.admin.service.FranchiseService;
import com.admin.util.Utilities;

@Controller
@RequestMapping(value = "/franchise")
public class FranchiseController {
	
	private static final Logger logger = LoggerFactory.getLogger(FranchiseController.class);
	
	@Autowired
	private FranchiseService franchiseService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpServletRequest request) {
		logger.info("franchise");
		
		//검색값
		String name = request.getParameter("name");
		String serviceNo = request.getParameter("serviceNo");
		String PaginationNum = request.getParameter("PaginationNum");
		
		try {
			if(name != null){
				name = java.net.URLDecoder.decode(name, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//총 리스트 수 구하기
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("serviceNo", serviceNo);
		
		int  LocationListTotal = franchiseService.getLocationListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,LocationListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> list = franchiseService.getLocationList(param);
		model.addAttribute("franchiseList", list);
		model.addAttribute("paramInfo", param);
		
		return "franchise/franchise";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String franchisepost(Locale locale, Model model,HttpServletRequest request) {
		logger.info("franchise");
		
		//검색값
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String PaginationNum = request.getParameter("PaginationNum");
		
		//총 리스트 수 구하기
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		int  LocationListTotal = franchiseService.getLocationListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,LocationListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> list = franchiseService.getLocationList(param);
		model.addAttribute("franchiseList", list);
		model.addAttribute("paramInfo", param);
		
		return "franchise/franchise";
	}
	
	
	@RequestMapping(value = "/registform", method = RequestMethod.GET)
	public String registform(Locale locale, Model model,HttpServletRequest request) {
		logger.info("registform");
		
		return "franchise/registform";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(HttpServletRequest request,FranchiseVo franchiseVo,MultipartRequest mhsq) throws IllegalStateException, IOException {
		logger.info("regist");
		
		//*** 다중 파일업로드 ***//
		
		//디렉토리 존재하지 않을경우 디렉토리 생성
    	String defaultPath = request.getSession().getServletContext().getRealPath("/")+"resources/upload/franchise/";
        File folderPath = new File(defaultPath);
		if(!folderPath.exists()) {
			folderPath.mkdirs();
		}
		
		Iterator<String> fileIter = mhsq.getFileNames();
		String realpath = "http://www.ssecarsteam.com/resources/upload/franchise/";
		String next = "";
		while (fileIter.hasNext()) {
			next = (String)fileIter.next();
			MultipartFile mFile = mhsq.getFile(next);
			
			if (mFile.getSize() > 0) {
				// 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mFile.getOriginalFilename(); 
                // 저장되는 파일 이름
                String saveFileName = genId + "." + originalfileName;
                
                String savePath = defaultPath + saveFileName; // 저장 될 파일 경로
				
                mFile.transferTo(new File(savePath)); // 파일 저장
                
                if(next.equals("imga")){
                	franchiseVo.setImg1( realpath + saveFileName);
                }else if(next.equals("imgb")){
                	franchiseVo.setImg2(realpath + saveFileName);
                }else if(next.equals("imgc")){
                	franchiseVo.setImg3(realpath + saveFileName);
                }else if(next.equals("imgd")){
                	franchiseVo.setImg4(realpath + saveFileName);
                }
			}

		}

		//가맹점 등록
		franchiseService.regist(franchiseVo);
		
		//서비스 등록
		String[] service = request.getParameterValues("service");
		int serviceTotal = Integer.parseInt(request.getParameter("serviceTotal"));
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("storeNo", franchiseVo.getFno());
		
		for(int k=1; k <= serviceTotal ; k++){
			map.put("serviceNo", k );
			franchiseService.serviceRegist(map);
		}
		
		map.put("action", "y" );
		if(service != null && service.length > 0){
			for( int i=0 ; i<service.length ; i++ ){
				map.put("serviceNo", service[i] );
				franchiseService.setService(map);
			}
		}

		return "redirect:/franchise/main";
	}
	
	
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String delete(Locale locale, Model model,@PathVariable String no) {
		logger.info("delete");
		
		franchiseService.delete(no);
		
		return "redirect:/franchise/main";
	}
	
	@RequestMapping(value = "/update/{no}", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model,@PathVariable String no) {
		logger.info("updateForm");
		
		Map<String,Object> map = franchiseService.updateForm(no);
		List<String> service = franchiseService.getService(no);
		model.addAttribute("franchise", map);
		model.addAttribute("service", service);
		
		return "franchise/updateForm";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request,MultipartRequest mhsq) throws IllegalStateException, IOException {
		logger.info("update");
		
		Map<String,Object> map = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			map.put(name, request.getParameter(name));
		}
		//*** 다중 파일업로드 ***//
		
		//디렉토리 존재하지 않을경우 디렉토리 생성
    	String defaultPath = request.getSession().getServletContext().getRealPath("/")+"resources/upload/franchise/";
        File folderPath = new File(defaultPath);
		if(!folderPath.exists()) {
			folderPath.mkdirs();
		}
		
		Iterator<String> fileIter = mhsq.getFileNames();
		String realpath = "http://www.ssecarsteam.com/resources/upload/franchise/";
		String next = "";
		while (fileIter.hasNext()) {
			next = (String)fileIter.next();
			MultipartFile mFile = mhsq.getFile(next);
			
			if (mFile.getSize() > 0) {
				// 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mFile.getOriginalFilename();
                // 저장되는 파일 이름
                String saveFileName = genId + "." + originalfileName;
                
                String savePath = defaultPath + saveFileName; // 저장 될 파일 경로
				
                mFile.transferTo(new File(savePath)); // 파일 저장
                
                if(next.equals("imga")){
                	map.put("img1", realpath + saveFileName);
                }else if(next.equals("imgb")){
                	map.put("img2", realpath + saveFileName);
                }else if(next.equals("imgc")){
                	map.put("img3", realpath + saveFileName);
                }else if(next.equals("imgd")){
                	map.put("img4", realpath + saveFileName);
                }
			}
		}
		
		franchiseService.update(map);
		
		int len = 0;
		String[] service = request.getParameterValues("service");
		if(service != null){
			len=service.length;
		}else{
			len=0;
		}
		
		map.put("storeNo", request.getParameter("fno"));
		int serviceTotal = Integer.parseInt(request.getParameter("serviceTotal"));
		
		
		map.put("action", "n" );
		for(int k=1; k <= serviceTotal ; k++){
			map.put("serviceNo", k );
			franchiseService.setService(map);
		}
		
		map.put("action", "y" );
		for( int i=0 ; i<len ; i++ ){
			map.put("serviceNo", service[i] );
			franchiseService.setService(map);
		}

		return "redirect:/franchise/main";
	}
	
}
