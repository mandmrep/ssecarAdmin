package com.admin.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.admin.service.NoticeService;
import com.admin.util.Utilities;
import com.admin.dto.PhotoVo;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpServletRequest request) {
		logger.info("notice");
		
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
		
		return "notice/notice";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String noticepost(Locale locale, Model model,HttpServletRequest request) {
		logger.info("noticepost");
		
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String PaginationNum = request.getParameter("PaginationNum");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		//총 리스트 수 구하기
		int NoticeListTotal = noticeService.getNoticeListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param = util.pagination(10,NoticeListTotal,PaginationNum);
		param.putAll(map);

		//list가져오기
		List<Map<String,Object>> list = noticeService.getNoticeList(param);
		model.addAttribute("NoticeList", list);
		model.addAttribute("paramInfo", param);
		
		return "notice/notice";
	}
	
	@RequestMapping(value = "/detail/{no}", method = RequestMethod.GET)
	public String detail(Locale locale, Model model,@PathVariable String no) {
		logger.info("detail");
		
		Map<String,Object> map = noticeService.noticeDetail(no);
		model.addAttribute("notice", map);
		
		return "notice/detail";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(Locale locale, Model model) {
		logger.info("writeForm");
		
		return "notice/writeForm";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Locale locale, Model model,HttpServletRequest request) {
		logger.info("write");
		
		Map<String,Object> map = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			map.put(name, request.getParameter(name));
		}
		
		noticeService.noticeWrite(map);
		
		return "redirect:/notice/main";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Locale locale, Model model,HttpServletRequest request) {
		logger.info("modify");
		
		Map<String,Object> map = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			map.put(name, request.getParameter(name));
		}
		
		noticeService.noticeModify(map);
		
		return "redirect:/notice/main";
	}
	
	@RequestMapping(value = "/modifyForm/{no}", method = RequestMethod.GET)
	public String modifyForm(Locale locale, Model model,@PathVariable String no) {
		logger.info("detail");
		
		Map<String,Object> map = noticeService.noticeDetail(no);
		model.addAttribute("notice", map);
		
		return "notice/modify";
	}
	
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String delete(Locale locale, Model model,@PathVariable String no) {
		logger.info("delete");
		
		noticeService.noticeDelete(no);
		
		return "redirect:/notice/main";
	}
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	@ResponseBody
	public String uploadImage(Locale locale, Model model,@RequestParam("file") MultipartFile f) throws IllegalStateException, IOException {
		logger.info("uploadImage");
		
		if(!f.isEmpty()){
			File file = new File("C:/workspace/ssecarAdmin/src/main/webapp/resources/upload/notice/",f.getOriginalFilename());
			f.transferTo(file);
		}
		
		String imgpath="/resources/upload/notice/"+f.getOriginalFilename();
		
		return imgpath;
	}
	
	// 단일파일업로드
		@RequestMapping("/photoUpload")
		public String photoUpload(HttpServletRequest request, PhotoVo vo){
			logger.info("photoUpload");
			
			String callback = vo.getCallback();
			String callback_func = vo.getCallback_func();
			String file_result = "";
			try {
				if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
					//파일이 존재하면
					String original_name = vo.getFiledata().getOriginalFilename();
					String ext = original_name.substring(original_name.lastIndexOf(".")+1);
					//파일 기본경로
					String defaultPath = request.getSession().getServletContext().getRealPath("/");
					//파일 기본경로 _ 상세경로
					String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;
					File file = new File(path);
					System.out.println("path:"+path);
					//디렉토리 존재하지 않을경우 디렉토리 생성
					if(!file.exists()) {
						file.mkdirs();
					}
					//서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
					String realname = UUID.randomUUID().toString() + "." + ext;
					///////////////// 서버에 파일쓰기 ///////////////// 
					vo.getFiledata().transferTo(new File(path+realname));
					file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
				}else{
					file_result += "&errstr=error";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:" + callback + "?callback_func="+callback_func+file_result;
		}
		
		//다중파일업로드
		@RequestMapping(value="/multiplePhotoUpload",method = RequestMethod.POST)
		public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
			logger.info("multiplePhotoUpload");
			
			try {
				//파일정보
				String sFileInfo = "";
				//파일명을 받는다 - 일반 원본파일명
				String filename = request.getHeader("file-name");
				//파일 확장자
				String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
				//확장자를소문자로 변경
				filename_ext = filename_ext.toLowerCase();
				//파일 기본경로
				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
				//파일 기본경로 _ 상세경로
				String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
				File file = new File(filePath);
				if(!file.exists()) {
					file.mkdirs();
				}
				String realFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
				String rlFileNm = filePath + realFileNm;
				
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream is = request.getInputStream();
				OutputStream os=new FileOutputStream(rlFileNm);
				int numRead;
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = is.read(b,0,b.length)) != -1){
					os.write(b,0,numRead);
				}
				if(is != null) {
					is.close();
				}
				os.flush();
				os.close();
				///////////////// 서버에 파일쓰기 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ filename;
				sFileInfo += "&sFileURL="+"http://www.ssecarsteam.com/resources/photo_upload/"+realFileNm;
				PrintWriter print = response.getWriter();
				print.print(sFileInfo);
				print.flush();
				print.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
