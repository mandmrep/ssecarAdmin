package com.admin.action;

import java.util.Enumeration;
import java.util.GregorianCalendar;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.dto.UserVo;
import com.admin.service.ManagementService;
import com.admin.service.MasterService;
import com.admin.util.Utilities;

@Controller
@RequestMapping(value="/management")
public class ManagementController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@Autowired
	private ManagementService managementService;
	
	@Autowired
	private MasterService masterService;
			
	@RequestMapping(value="/reservation", method = RequestMethod.GET)
	public String main(Locale locale,Model model,HttpServletRequest request){
		logger.info("main");
		
		String PaginationNum = request.getParameter("PaginationNum");
		Map <String,Object> map = new HashMap<String,Object>();
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			map.put("store", user.getFno());
		}
		
		int CustomerListTotal = managementService.getReservationListTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,CustomerListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> reservationlist = managementService.getReservationList(param);
		model.addAttribute("reservationList", reservationlist);
		model.addAttribute("paramInfo", param);
		
		return "management/reservation";		
	}
	
	@RequestMapping(value="/reservation", method = RequestMethod.POST)
	public String reservationpost(Locale locale,Model model,HttpServletRequest request){
		logger.info("reservationpost");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
		String PaginationNum = request.getParameter("PaginationNum");
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			map.put("store", user.getFno());
		}
		
		int CustomerListTotal = managementService.getReservationListTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,CustomerListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> reservationlist = managementService.getReservationList(param);
		model.addAttribute("reservationList", reservationlist);
		model.addAttribute("paramInfo", param);
		
		return "management/reservation";		
	}
	
	@RequestMapping(value="/getReservationList")
	@ResponseBody
	public List<Map<String,Object>> getReservationList(){
		Map <String,Object> param = new HashMap<String,Object>();
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		param.put("store", user.getFno());	
		List<Map<String,Object>> reservationlist = managementService.getReservationList(param);
		
		return reservationlist;
	}
	
	@RequestMapping(value="/reserveform")
	public String reserveform(Model model,HttpServletRequest request){
		logger.info("reserveform");
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		List<Map<String,Object>> products = managementService.getProductsList();
		List<Map<String,Object>> manufacturer = managementService.getManufacturerList();
		
		if(num!=null){model.addAttribute("num", num);}
		if(name!=null){model.addAttribute("name", name);}
		model.addAttribute("products", products);
		model.addAttribute("manufacturer", manufacturer);
		
		return "management/reserveform";		
	}
	
	@RequestMapping(value="/customer", method = RequestMethod.GET)
	public String customer(Model model,HttpServletRequest request){
		logger.info("customer");
		
		Map <String,Object> param = new HashMap<String,Object>();
		param.put("PaginationNum", request.getParameter("PaginationNum") );
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			param.put("username", user.getUsername());
			param.put("store", user.getFno());
		}
		
		int CustomerListTotal = managementService.getCustomerListTotal(param);
		
		//페이징
		Utilities util = new Utilities();
		param.putAll( util.pagination(10,CustomerListTotal,(String)param.get("PaginationNum")) );
		
		List<Map<String,Object>> customerlist = managementService.getCustomerList(param);
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("paramInfo", param);
		
		return "management/customer";		
	}
	
	@RequestMapping(value="/customer", method = RequestMethod.POST)
	public String search(Model model,HttpServletRequest request){
		logger.info("search");
		
		Map <String,Object> param = new HashMap<String,Object>();
		param.put("PaginationNum", request.getParameter("PaginationNum") );
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			param.put("username", user.getUsername());
			param.put("store", user.getFno());
		}
		
		int CustomerListTotal = managementService.getCustomerListTotal(param);
		
		//페이징
		Utilities util = new Utilities();
		param.putAll( util.pagination(10,CustomerListTotal,(String)param.get("PaginationNum")) );
		
		List<Map<String,Object>> customerlist = managementService.getCustomerList(param);
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("paramInfo", param);
		
		return "management/customer";		
	}
	
	
	@RequestMapping(value="/customerDelete", method = RequestMethod.POST)
	public String customerDelete(Model model,HttpServletRequest request){
		logger.info("customerDelete");
		
		String idx = request.getParameter("idx");
		
		managementService.customerDelete(idx);
		
		return "redirect:/management/customer";
	}
	
	
	

	
	
	
	@RequestMapping(value="/reserve", method = RequestMethod.POST)
	public String reserve(Model model,HttpServletRequest request){
		logger.info("reserve");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		param.put("store", user.getFno() );
		
		managementService.reservationRegist(param);
		return "redirect:/management/reservation";		
	}
	
	@RequestMapping(value="/getautomobile", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> getautomobile(Model model,HttpServletRequest request){
		logger.info("getautomobile");
		
		int manufacturer = Integer.parseInt( request.getParameter("manufacturer") );
		List<Map<String,Object>> list = managementService.getAutomobileList(manufacturer);
		
		
		return list;		
	}
	
	@RequestMapping(value="/duplicate", method = RequestMethod.POST)
	@ResponseBody
	public int duplicate(Model model,HttpServletRequest request){
		logger.info("duplicate");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("time", time);
		param.put("date", date);
		param.put("store", user.getFno());
		
		int num = managementService.duplicateReservation(param);
		
		return num;		
	}
	
	@RequestMapping(value="/reservationdelete", method = RequestMethod.POST)
	public String reservationdelete(Model model,HttpServletRequest request){
		logger.info("reservationdelete");
		String idx = request.getParameter("idx");
		
		managementService.reservationdelete(idx);
		
		return "redirect:/management/reservation";		
	}
	
	@RequestMapping(value="/reservationupdateform", method = RequestMethod.POST)
	public String reservationupdateform(Model model,HttpServletRequest request){
		logger.info("reservationupdateform");
		String idx = request.getParameter("idx");
		
		List<Map<String,Object>> products = managementService.getProductsList();
		List<Map<String,Object>> manufacturer = managementService.getManufacturerList();
		Map<String,Object> list = managementService.reservationupdateform(idx);
		
		model.addAttribute("updateInfo", list);
		model.addAttribute("products", products);
		model.addAttribute("manufacturer", manufacturer);
		
		return "management/reservationupdateform";		
	}
	
	@RequestMapping(value="/reserveUpdate", method = RequestMethod.POST)
	public String reserveUpdate(Model model,HttpServletRequest request){
		logger.info("reserveUpdate");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		managementService.reserveUpdate(param);
		return "redirect:/management/reservation";		
	}
	
	@RequestMapping(value="/sales", method = {RequestMethod.GET,RequestMethod.POST})
	public String sales(Model model,HttpServletRequest request){
		logger.info("sales");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("PaginationNum", request.getParameter("PaginationNum"));
		map.put("fno", user.getFno());
		map.put("division", request.getParameter("division") );
		
		 String qnalist = request.getParameter("qnalist");
		 if(qnalist !=null){
			 map.put("qnalist", request.getParameter("qnalist") );
			 map.put("search",request.getParameter("search"));
		 }
		
		
		int SalesListTotal = managementService.getSalesListTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,SalesListTotal,"1");
		param.putAll(map);
		
		List<Map<String,Object>> sales = managementService.getSalesList(param);
		model.addAttribute("sales", sales);
		model.addAttribute("paramInfo", param);
		
		return "management/sales";
	}
	
	@RequestMapping(value="/saleswrite", method = RequestMethod.GET)
	public String salesform(Model model,HttpServletRequest request){
		logger.info("saleswrite");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		Map<String,Object> list = managementService.getFranchiseList(user.getFno());
		model.addAttribute("franchise", list);
		
		return "management/saleswrite";
	}
	
	@RequestMapping(value="/saleswriteAction", method = RequestMethod.POST)
	public String saleswriteAction(Model model,HttpServletRequest request){
		logger.info("saleswriteAction");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		param.put("fno", user.getFno());
		managementService.saleswriteAction(param);
		
		String division = (String)param.get("division");
		String path = "";
		
		if( division.equals("서비스") ){
			path = "/management/sales";
		}else if( division.equals("제품") ){
			path="/management/products";
		}
		
		return "redirect:"+path;
	}
	
	@RequestMapping(value="/getCustomer", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> getCustomer(HttpServletRequest request){
		logger.info("getCustomer");
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", user.getFno());
		map.put("division", request.getParameter("division"));
		map.put("search", request.getParameter("search"));
		
		List<Map<String,Object>> list = managementService.getCustomer(map);
		
		return list;
	}
	
	@RequestMapping(value="/getService", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> getService(HttpServletRequest request){
		logger.info("getService");
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("division", request.getParameter("division"));
		
		List<Map<String,Object>> list = managementService.getService(map);
		
		return list;
	}
	
	@RequestMapping(value="/products", method = RequestMethod.GET)
	public String products( Model model , HttpServletRequest request ){
		logger.info("products");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("PaginationNum", request.getParameter("PaginationNum"));
		map.put("fno", user.getFno());
		
		int SalesProductsList = managementService.getSalesProductsListTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,SalesProductsList,"1");
		param.putAll(map);

		List<Map<String,Object>> products = managementService.getSalesProductsList(param);
		model.addAttribute("products", products);
		model.addAttribute("paramInfo", param);
		
		return "management/products";
	}
	
	@RequestMapping(value="/products", method = RequestMethod.POST)
	public String productspost( Model model , HttpServletRequest request ){
		logger.info("productspost");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//parameter
		String PaginationNum = request.getParameter("PaginationNum");
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("fno", user.getFno());
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		int SalesProductsList = managementService.getSalesProductsListTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,SalesProductsList,PaginationNum);
		param.putAll(map);

		List<Map<String,Object>> products = managementService.getSalesProductsList(param);
		model.addAttribute("products", products);
		model.addAttribute("paramInfo", param);
		
		return "management/products";
	}
	
	@RequestMapping(value="/salesDelete")
	public String salesDelete(HttpServletRequest request){
		logger.info("salesDelete");
		
		String num = request.getParameter("num");
		String path = request.getParameter("path");
		managementService.salesDelete(num);
		
		return "redirect:/management/"+path;
	}
	
	@RequestMapping(value="/salesUpdate/{no}", method = RequestMethod.GET)
	public String salesUpdate(Model model,@PathVariable String no){
		logger.info("salesUpdate");
		
		Map<String,Object> sales = managementService.salesUpdate(no);
		model.addAttribute("sales", sales);
		
		return "management/salesUpdate";
	}
	
	@RequestMapping(value="/salesUpdateAction",method= RequestMethod.POST)
	public String salesUpdateAction(Model model,HttpServletRequest request){
		logger.info("salesUpdateAction");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		managementService.salesUpdateAction(param);
		
		String path = (String)param.get("division");
		if(path.equals("서비스")){
			path = "sales";
		}else if(path.equals("제품")){
			path = "products";
		}
		
		return "redirect:/management/"+path;
	}
	
	@RequestMapping(value="/day",method= {RequestMethod.GET,RequestMethod.POST})
	public String day(Model model,HttpServletRequest request){
		logger.info("day");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		String fname = request.getParameter("fname");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String division = request.getParameter("division");
		
		//현재 년월 구하기
		GregorianCalendar today = new GregorianCalendar ();

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", user.getFno());
		map.put("fname", fname);
		
		if(year == null || year.equals("") ){
			int year_gre = today.get ( today.YEAR );
			map.put("year", year_gre);
		}else{
			map.put("year", year);
		}
		
		if(month == null || month.equals("")){
			int month_gre = today.get ( today.MONTH ) + 1;
			map.put("month", month_gre);
		}else{
			map.put("month", month);
		}
		if(division !=null && !division.equals("")){
			map.put("division", division);
		}
		
		
		List<Map<String,Object>> days = managementService.getDaySalesList(map);
		Map<String, Object> dayTotal = masterService.dayTotal(map);
		model.addAttribute("dayList", days);
		model.addAttribute("dayTotal", dayTotal);
		model.addAttribute("paramInfo", map);
		return "management/day";
	}
	
	@RequestMapping(value="/getDay",method= RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> getDay(Model model,HttpServletRequest request){
		logger.info("getDay");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//현재 년월 구하기
		GregorianCalendar today = new GregorianCalendar ( );
		int year = today.get ( today.YEAR );
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("fno", user.getFno());
		param.put("month", request.getParameter("month"));
		param.put("year", request.getParameter("year")); // 2106-01-11 추가
		param.put("division", request.getParameter("division"));
		
		List<Map<String,Object>> list = managementService.getDayJson(param);
		
		return list;
	}
	
	@RequestMapping(value="/month",method= {RequestMethod.GET,RequestMethod.POST})
	public String month(Model model,HttpServletRequest request){
		logger.info("month");

		String year = request.getParameter("year");
		String division = request.getParameter("division");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		Map<String,Object> param = new HashMap<String, Object>();
		param.put("fno", user.getFno());
		if(year == null || year.equals("") ){
			GregorianCalendar today = new GregorianCalendar ();
			int year_gre = today.get ( today.YEAR );
			param.put("year", year_gre);
		}else{
			param.put("year", year);
		}
		if(division !=null && !division.equals("")){param.put("division", division);}
		
		//List<Map<String,Object>> years = managementService.getYearList(param);
		//model.addAttribute("years", years);
		List<Map<String,Object>> yearSales = managementService.getYearSalesList(param);
		Map<String, Object> monthTotal = masterService.monthTotal(param);
		model.addAttribute("monthTotal", monthTotal);
		model.addAttribute("yearSales", yearSales);
		model.addAttribute("paramInfo", param);
		return "management/month";
	}
	
	@RequestMapping(value="/monthAjax",method= RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> monthPost(Model model,HttpServletRequest request){
		logger.info("monthPost");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("fno", user.getFno());
		param.put("year", request.getParameter("year"));
		param.put("division", request.getParameter("division"));
		
		List<Map<String,Object>> years = managementService.getYearSalesList(param);

		return years;
	}
	
	@RequestMapping(value="/client",method=RequestMethod.GET)
	public String client(Model model,HttpServletRequest request){
		logger.info("client");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String PaginationNum = request.getParameter("PaginationNum");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", user.getFno());
		
		int ClientsListTotal = managementService.getClientsListTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,ClientsListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> clients = managementService.getClientsList(param);
		model.addAttribute("clients", clients);
		model.addAttribute("paramInfo", param);
		
		return "management/client";
	}
	
	@RequestMapping(value="/client",method=RequestMethod.POST)
	public String clientPost(Model model,HttpServletRequest request){
		logger.info("clientPost");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String PaginationNum = request.getParameter("PaginationNum");
		String division = request.getParameter("division");
		String search = request.getParameter("search");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", user.getFno());
		map.put("division", division);
		map.put("search", search);
		
		int ClientsListTotal = managementService.getClientsListTotal(map);
		
		//페이징
		Utilities util = new Utilities(); 
		Map<String,Object> param =util.pagination(10,ClientsListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> clients = managementService.getClientsList(param);
		model.addAttribute("clients", clients);
		model.addAttribute("paramInfo", param);
		
		return "management/client";
	}
	
	@RequestMapping(value="/client/{no}",method=RequestMethod.GET)
	public String client(Model model,@PathVariable String no,HttpServletRequest request){
		logger.info("clientdetail");
		String PaginationNum = request.getParameter("PaginationNum");
		int ClientSalesListTotal = managementService.getClientSalesListTotal(no);
		
		//페이징
		Utilities util = new Utilities(); 
		Map<String,Object> param =util.pagination(10,ClientSalesListTotal,PaginationNum);
		param.put("num", no);
		
		Map<String,Object> clientDetail = managementService.getClientDetail(no);
		List<Map<String,Object>> clientSales = managementService.getClientSalesList(param);
		
		model.addAttribute("clientDetail", clientDetail);
		model.addAttribute("clientSales", clientSales);
		model.addAttribute("paramInfo", param);
		
		return "management/clientDetail";
	}
	
	@RequestMapping(value="/client/{no}",method=RequestMethod.POST)
	public String clientpost(Model model,@PathVariable String no,HttpServletRequest request){
		logger.info("clientpost");
		String PaginationNum = request.getParameter("PaginationNum");
		int ClientSalesListTotal = managementService.getClientSalesListTotal(no);
		
		//페이징
		Utilities util = new Utilities(); 
		Map<String,Object> param =util.pagination(10,ClientSalesListTotal,PaginationNum);
		param.put("num", no);
		
		Map<String,Object> clientDetail = managementService.getClientDetail(no);
		List<Map<String,Object>> clientSales = managementService.getClientSalesList(param);
		
		model.addAttribute("clientDetail", clientDetail);
		model.addAttribute("clientSales", clientSales);
		model.addAttribute("paramInfo", param);
		
		return "management/clientDetail";
	}
	
	@RequestMapping(value="/clientWrite",method=RequestMethod.GET)
	public String clientWrite(Model model){
		logger.info("clientWrite");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String,Object> franchise = managementService.getFranchiseList(user.getFno());
		List<Map<String,Object>> manufacturers = managementService.getManufacturerList();
		model.addAttribute("franchise", franchise);
		model.addAttribute("manufacturers", manufacturers);
		
		return "management/clientWrite";
	}
	
	@RequestMapping(value="/clientwriteAction",method=RequestMethod.POST)
	public String clientwriteAction(HttpServletRequest request){
		logger.info("clientwriteAction");
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		param.put("fno", user.getFno());
		managementService.clientwriteAction(param);
		
		return "redirect:/management/client";
	}
	
	@RequestMapping(value="/clientDelete/{no}",method=RequestMethod.GET)
	public String clientDelete(HttpServletRequest request,@PathVariable String no){
		logger.info("clientDelete");
		
		managementService.clientDelete(no);
		
		return "redirect:/management/client";
	}
	
	@RequestMapping(value="/clientUpdate/{no}",method=RequestMethod.GET)
	public String clientUpdate(Model model,HttpServletRequest request,@PathVariable String no){
		logger.info("clientUpdate");
		
		Map<String,Object> client = managementService.getClientInfo(no);
		List<Map<String,Object>> manufacturers = managementService.getManufacturerList();
		
		model.addAttribute("client", client);
		model.addAttribute("manufacturers", manufacturers);
		
		return "management/clientUpdate";
	}
	
	@RequestMapping(value="/clientUpdateAction",method=RequestMethod.POST)
	public String clientUpdateAction(HttpServletRequest request){
		logger.info("clientUpdateAction");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		managementService.clientUpdateAction(param);
		
		return "redirect:/management/client";
	}
	
	@RequestMapping(value="/calendar",method=RequestMethod.GET)
	public String calendar(HttpServletRequest request){
		logger.info("calendar");
		
		return "management/calendar";
	}
	
	@RequestMapping(value="/calendarAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> calendar(Model model,HttpServletRequest request){
		logger.info("calendarAjax");
		
		Map <String,Object> param = new HashMap<String,Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
			
		}
		
		//로그인정보
		UserVo user =  (UserVo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if( !user.getAuthorities().toString().equals("[ROLE_ADMIN]") ){
			param.put("store", user.getFno());
		}
		
		List<Map<String,Object>> list = managementService.getCalendarList(param);
		return list;		
	}
}
