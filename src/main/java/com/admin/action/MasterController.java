package com.admin.action;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.Request;
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

@RequestMapping(value="/master")
@Controller
public class MasterController {
	
	private static final Logger logger = LoggerFactory.getLogger(MasterController.class);
	
	@Autowired
	private MasterService masterService;
	
	@Autowired
	private ManagementService managementService;
			
	@RequestMapping(value="/products", method = RequestMethod.GET)
	public String products(Locale locale,Model model,HttpServletRequest request){
		logger.info("products");
		
		String PaginationNum = request.getParameter("PaginationNum");
		Map <String,Object> map = new HashMap<String,Object>();
		
		int productsListTotal = masterService.getProductsListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,productsListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> productsList = masterService.getProductsList(param);
		model.addAttribute("productsList", productsList);
		model.addAttribute("paramInfo", param);
		
		return "master/products";		
	}
	
	@RequestMapping(value="/products", method = RequestMethod.POST)
	public String productspost(Model model,HttpServletRequest request){
		logger.info("productspost");
		
		String PaginationNum = request.getParameter("PaginationNum");
		String division = request.getParameter("division");
		String search = request.getParameter("search");

		Map <String,Object> map = new HashMap<String,Object>();
		map.put("division", division);
		map.put("search", search);
		
		int productsListTotal = masterService.getProductsListTotal(map);
		
		//�럹�씠吏�
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,productsListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> productsList = masterService.getProductsList(param);
		model.addAttribute("productsList", productsList);
		model.addAttribute("paramInfo", param);
		
		return "master/products";		
	}
	
	@RequestMapping(value="/productsDelete/{no}", method = RequestMethod.GET)
	public String productsDelete(HttpServletRequest request,@PathVariable String no){
		logger.info("productsDelete");
		
		masterService.productsDelete(no);
		
		return "redirect:/master/products";
	}
	
	@RequestMapping(value="/productsWrite", method = RequestMethod.GET)
	public String productsWrite(){
		logger.info("productsWrite");
		
		return "master/productsWrite";
	}
	
	@RequestMapping(value="/productswriteAction", method = RequestMethod.POST)
	public String productswriteAction(HttpServletRequest request){
		logger.info("productswriteAction");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		masterService.productswriteAction(param);
		
		return "redirect:/master/products";
	}
	
	@RequestMapping(value="/account", method=RequestMethod.GET)
	public String account(Model model,HttpServletRequest request){
		logger.info("account");
		
		String PaginationNum = request.getParameter("PaginationNum");
		Map <String,Object> map = new HashMap<String,Object>();
		
		int AccountListTotal = masterService.getAccountListTotal(map);
		
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,AccountListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> accountsList = masterService.getAccountsList(param);
		model.addAttribute("accountsList", accountsList);
		model.addAttribute("paramInfo", param);
		
		return "master/account";
	}

	@RequestMapping(value="/account", method=RequestMethod.POST)
	public String accountpost(Model model,HttpServletRequest request){
		logger.info("accountpost");
		
		String PaginationNum = request.getParameter("PaginationNum");
		String division = request.getParameter("division");
		String search = request.getParameter("search");
		
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("division", division);
		map.put("search", search);
		
		int AccountListTotal = masterService.getAccountListTotal(map);
		
		//�럹�씠吏�
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,AccountListTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> accountsList = masterService.getAccountsList(param);
		model.addAttribute("accountsList", accountsList);
		model.addAttribute("paramInfo", param);
		
		return "master/account";
	}
	
	@RequestMapping(value="/getfranchise",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> getfranchise(HttpServletRequest request){
		logger.info("getfranchise");
		
		String area = request.getParameter("area");
		List<Map<String,Object>> list = masterService.getfranchise(area);
		
		return list;
	}
	
	@RequestMapping(value="/accountWrite", method=RequestMethod.GET)
	public String accountWrite(Model model){
		logger.info("accountWrite");
		
		Map <String,Object> map = new HashMap<String,Object>();
		List<Map<String,Object>> areas = masterService.getAreaList(map);
		model.addAttribute("areas", areas);
		
		return "master/accountWrite";
	}
	
	@RequestMapping(value="/idDuplication",method=RequestMethod.POST)
	@ResponseBody
	public String idDuplication(HttpServletRequest request){
		logger.info("idDuplication");
		
		String id = request.getParameter("id");
		int no = masterService.idDuplication(id);
		
		String result = "";
		if(no == 0){
			result = "ok";
		}else{
			result = "notok";
		}
		return result;
	}
	
	@RequestMapping(value="/accountWriteAction", method=RequestMethod.POST)
	public String accountWriteAction(HttpServletRequest request){
		logger.info("accountWriteAction");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		masterService.accountWriteAction(param);
		
		return "redirect:/master/account";
	}
	
	@RequestMapping(value="/accountDelete/{username}",method=RequestMethod.GET)
	public String accountDelete(@PathVariable String username){
		logger.info("accountWriteAction");
		
		masterService.accountDelete(username);
		
		return "redirect:/master/account";
	}
	
	@RequestMapping(value="/accountUpdate/{no}",method=RequestMethod.GET)
	public String accountUpdate(Model model,@PathVariable String no){
		logger.info("accountUpdate");
		
		Map<String,Object> account = masterService.accountUpdate(no);
		model.addAttribute("account", account);
		
		return "master/accountUpdate";
	}
	
	@RequestMapping(value="/accountUpdateAction",method=RequestMethod.POST)
	public String accountUpdateAction(HttpServletRequest request){
		logger.info("accountUpdateAction");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		masterService.accountUpdateAction(param);
		
		return "redirect:/master/account";
	}
	
	@RequestMapping(value="/vehicle",method=RequestMethod.GET)
	public String vehicle(Model model){
		logger.info("vehicle");
		Map<String,Object> param = new HashMap<String, Object>();
		List<Map<String,Object>> manufacturerList = masterService.getManufacturerList(param);
		model.addAttribute("manufacturerList", manufacturerList);
		
		return "master/vehicle";
	}
	
	@RequestMapping(value="/getautomobile",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> getautomobile(HttpServletRequest request){
		logger.info("getautomobile");
		
		String num = request.getParameter("num");

		return masterService.getautomobile(num);
	}
	
	@RequestMapping(value="/manuDelete/{no}",method=RequestMethod.GET)
	public String manuDelete(@PathVariable String no){
		logger.info("manuDelete");
		
		masterService.manuDelete(no);
		
		return "redirect:/master/vehicle";
	}
	
	@RequestMapping(value="/autoDelete/{no}",method=RequestMethod.GET)
	public String autoDelete(@PathVariable String no){
		logger.info("autoDelete");
		
		masterService.autoDelete(no);
		
		return "redirect:/master/vehicle";
	}
	
	@RequestMapping(value="/vehicleManuWrite",method=RequestMethod.GET)
	public String vehicleManuWrite(){
		logger.info("vehicleManuWrite");
		
		return "master/vehicleManuWrite";
	}
	
	@RequestMapping(value="/vehicleAutoWrite",method=RequestMethod.GET)
	public String vehicleAutoWrite(Model model){
		logger.info("vehicleAutoWrite");
		
		Map<String,Object> param = new HashMap<String, Object>();
		List<Map<String,Object>> manufacturerList = masterService.getManufacturerList(param);
		model.addAttribute("manufacturerList", manufacturerList);
		
		return "master/vehicleAutoWrite";
	}

	@RequestMapping(value="/vehicleManuWriteAction",method=RequestMethod.POST)
	public String vehicleManuWriteAction(HttpServletRequest request){
		logger.info("vehicleAutoWrite");
		
		String manufacturer = request.getParameter("manufacturer");
		masterService.vehicleManuWriteAction(manufacturer);
		
		return "redirect:/master/vehicle";
	}
	
	@RequestMapping(value="/vehicleAutoWriteAction",method=RequestMethod.POST)
	public String vehicleAutoWriteAction(HttpServletRequest request){
		logger.info("vehicleAutoWriteAction");
		
		String manufacturer = request.getParameter("manufacturer");
		String name = request.getParameter("name");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("manufacturer", manufacturer);
		map.put("name", name);
		
		masterService.vehicleAutoWriteAction(map);
		
		return "redirect:/master/vehicle";
	}
	
	@RequestMapping(value="/manuDuplication",method=RequestMethod.POST)
	@ResponseBody
	public int manuDuplication(HttpServletRequest request){
		logger.info("manuDuplication");
		
		String manufacturer = request.getParameter("manufacturer");
		int cnt =  masterService.manuDuplication(manufacturer);
		
		return cnt;
	}
	
	@RequestMapping(value="/autoDuplication",method=RequestMethod.POST)
	@ResponseBody
	public int autoDuplication(HttpServletRequest request){
		logger.info("autoDuplication");
		
		String name = request.getParameter("name");
		int cnt =  masterService.autoDuplication(name);
		
		return cnt;
	}
	
	@RequestMapping(value="/reservation",method=RequestMethod.GET)
	public String reservation(Model model,HttpServletRequest request){
		logger.info("reservation");
		
		Map<String,Object> param = new HashMap<String, Object>();
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/reservation";
	}
	
	@RequestMapping(value="/reservation",method=RequestMethod.POST)
	public String reservationpost(Model model,HttpServletRequest request){
		logger.info("reservationpost");
		
		String name = request.getParameter("name");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("name", name);
		
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/reservation";
	}
	
	// 2016-01-11 reservationDeatail를 Calendar를 사용함으로써 추가 
	@RequestMapping(value="/reservationDetail",method = {RequestMethod.GET, RequestMethod.POST})
	public String reservationDetail(Model model,HttpServletRequest request){
		logger.info("reservationDetail");
		
		model.addAttribute("fname", request.getParameter("fname") );
		model.addAttribute("fno", request.getParameter("fno") );
		return "master/reservationDetail";
	}
	
	// 2016-01-11 reservationDeatail를 Calendar를 사용함으로써 추가 
	@RequestMapping(value="/calendarAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> calendar(Model model,HttpServletRequest request){
		logger.info("calendarAjax");

		Map<String,Object> param = new HashMap<String, Object>();		
		Enumeration<String> em =  request.getParameterNames();
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		List<Map<String,Object>> list = masterService.getCalendarList(param);
		
		return list;		
	}
	
	
	/* 2015-01-11 
	 * reservationDetail 백업. 원래 예약내역을 출력하는 Logic이었으나, Calendar를 출력하는 Logic으로 변경하여 본 내용을 백업함.
	 * 예약내역을 출력하는 화면은 reservationDetail_back.jsp에 저장함. */
	
	@RequestMapping(value="/reservationDetail2",method=RequestMethod.POST)
	public String reservationDetail2(Model model,HttpServletRequest request){
		logger.info("reservationDetail");
		
		String PaginationNum = request.getParameter("PaginationNum");
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		
		String fno = request.getParameter("fno");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", fno);
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		int reservationDetailTotal = masterService.reservationDetailTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,reservationDetailTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> reservationList = masterService.reservationDetail(param);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("paramInfo", param);
		
		return "master/reservationDetail";
	}
	
	@RequestMapping(value="/sales",method=RequestMethod.GET)
	public String sales(Model model,HttpServletRequest request){
		logger.info("sales");
		Map<String,Object> param = new HashMap<String, Object>();
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/sales";
	}
	
	@RequestMapping(value="/sales",method=RequestMethod.POST)
	public String salespost(Model model,HttpServletRequest request){
		logger.info("sales");
		
		String name = request.getParameter("name");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("name", name);
		
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/sales";
	}
	
	@RequestMapping(value="/salesDetail",method={RequestMethod.GET,RequestMethod.POST})
	public String salesDetail(Model model,HttpServletRequest request){
		logger.info("salesDetail");
		
		String PaginationNum = request.getParameter("PaginationNum");
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String fno = request.getParameter("fno");
		String division = request.getParameter("division");
		String fname = request.getParameter("fname");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", fno);
		map.put("qnalist", qnalist);
		map.put("search", search);
		map.put("division", division);
		map.put("fname", fname);
		int salesDetailTotal = masterService.salesDetailTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,salesDetailTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> salesList = masterService.salesDetail(param);
		model.addAttribute("salesList", salesList);
		model.addAttribute("paramInfo", param);
		
		return "master/salesDetail";
	}
	
	@RequestMapping(value="/customer",method=RequestMethod.GET)
	public String customer(Model model,HttpServletRequest request){
		logger.info("customer");
		
		return "master/customer";
	}
	
	@RequestMapping(value="/customer",method=RequestMethod.POST)
	public String customerpost(Model model,HttpServletRequest request){
		logger.info("customer");
		
		String name = request.getParameter("name");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("name", name);
		
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/customer";
	}
	
	@RequestMapping(value="/customerDetail",method={RequestMethod.GET,RequestMethod.POST})
	public String customerDetail(Model model,HttpServletRequest request){
		logger.info("customerDetail");
		
		String PaginationNum = request.getParameter("PaginationNum");
		String qnalist = request.getParameter("qnalist");
		String search = request.getParameter("search");
		String fno = request.getParameter("fno");
		
		Map<String,Object> map = new HashMap<String, Object>();
		if(fno !=null){
			map.put("fno", fno);
		}
		
		map.put("qnalist", qnalist);
		map.put("search", search);
		
		int customerDetailTotal = masterService.customerDetailTotal(map);
		
		//페이징
		Utilities util = new Utilities();
		Map<String,Object> param =util.pagination(10,customerDetailTotal,PaginationNum);
		param.putAll(map);
		
		List<Map<String,Object>> customerlist = masterService.customerDetail(param);
		model.addAttribute("clientDetail", customerlist);
		model.addAttribute("paramInfo", param);
		
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/customerDetail";
	}
	
	@RequestMapping(value="/day",method = {RequestMethod.GET, RequestMethod.POST})
	public String daypost(Model model,HttpServletRequest request){
		logger.info("day");
		
		String name = request.getParameter("name");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("name", name);
		
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/day";
	}
	
	@RequestMapping(value="/dayDetail",method={RequestMethod.GET, RequestMethod.POST})
	public String dayDetail(Model model,HttpServletRequest request) throws UnsupportedEncodingException{
		logger.info("dayDetail");
		
		String fno = request.getParameter("fno");
		String fname = request.getParameter("fname");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String division = request.getParameter("division");
		System.out.println(fname);
		//현재 년월 구하기
		GregorianCalendar today = new GregorianCalendar ();

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", fno);
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
		
		List<Map<String,Object>> dayList = masterService.dayDetail(map);
		Map<String, Object> dayTotal = masterService.dayTotal(map);
		model.addAttribute("dayList", dayList);
		model.addAttribute("dayTotal", dayTotal);
		model.addAttribute("paramInfo", map);
		
		return "master/dayDetail";
	}
	
	@RequestMapping(value="/month",method = {RequestMethod.GET, RequestMethod.POST})
	public String monthpost(Model model,HttpServletRequest request){
		logger.info("month");
		
		String name = request.getParameter("name");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("name", name);
		
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/month";
	}
	
	@RequestMapping(value="/monthDetail",method={RequestMethod.GET, RequestMethod.POST})
	public String monthDetail(Model model,HttpServletRequest request){
		logger.info("monthDetail");
		
		String fno = request.getParameter("fno");
		String fname = request.getParameter("fname");
		String year = request.getParameter("year");
		String division = request.getParameter("division");
		
		//현재 년월 구하기
		GregorianCalendar today = new GregorianCalendar ( );
		int year_gre = today.get ( today.YEAR );

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", fno);
		map.put("fname", fname);
		map.put("year", year);
		if(year == null || year.equals("") ){
			map.put("year", year_gre);
		}else{
			map.put("year", year);
		}
		
		if(division !=null && !division.equals("")){
			map.put("division", division);
		}
		List<Map<String,Object>> monthList = masterService.monthDetail(map);
		Map<String, Object> monthTotal = masterService.monthTotal(map);
		model.addAttribute("monthList", monthList);
		model.addAttribute("paramInfo", map);
		model.addAttribute("monthTotal", monthTotal);
		
		return "master/monthDetail";
	}
	
	@RequestMapping(value="/statistics",method=RequestMethod.GET)
	public String statistics(Model model,HttpServletRequest request){
		logger.info("statistics");
		
		Map<String,Object> param = new HashMap<String, Object>();
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		return "master/statistics";
	}
	
	@RequestMapping(value="/statistics",method={RequestMethod.POST})
	@ResponseBody
	public List<Map<String,Object>> statisticspost(HttpServletRequest request){
		logger.info("statisticspost");
		
		String name = request.getParameter("name");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("name", name);
		
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		
		return franchiseList;
	}
	
	@RequestMapping(value="/statisticsDetail",method=RequestMethod.POST)
	public String statisticsDetail(Model model,HttpServletRequest request){
		logger.info("statisticsDetail");
		
		String path = request.getParameter("path");
		String fno = request.getParameter("fno");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("path", path);
		
		if(fno !=null && !fno.equals("")){
			param.put("fno", fno);
		}
		
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		
		List<Map<String,Object>> result = masterService.statisticsDetail(param);
		model.addAttribute("result", result);
		
		return "master/statisticsDetail";
	}
	
	@RequestMapping(value="/reserveform",method={RequestMethod.GET,RequestMethod.POST})
	public String reserveform(Model model,HttpServletRequest request){
		logger.info("reserveform");
		
		List<Map<String,Object>> products = managementService.getProductsList();
		List<Map<String,Object>> manufacturer = managementService.getManufacturerList();
		
		model.addAttribute("products", products);
		model.addAttribute("manufacturer", manufacturer);
		model.addAttribute("date", request.getParameter("dt"));
		model.addAttribute("time", request.getParameter("time"));
		model.addAttribute("fno", request.getParameter("fno"));
		model.addAttribute("tel", request.getParameter("tel"));
		
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		if(num !=null){model.addAttribute("num", request.getParameter("num"));}
		if(name !=null){model.addAttribute("name", request.getParameter("name"));}

		return "master/reserveform";		
	}
	
	@RequestMapping(value="/updateform")
	public String updateform(Model model,HttpServletRequest request){
		logger.info("updateform");
		
		List<Map<String,Object>> products = managementService.getProductsList();
		List<Map<String,Object>> manufacturer = managementService.getManufacturerList();
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		Map<String,Object> reserveInfo = masterService.getReserveInfobynum(param);
		model.addAttribute("reserveInfo", reserveInfo);
		model.addAttribute("products", products);
		model.addAttribute("manufacturer", manufacturer);
		model.addAttribute("fno", request.getParameter("fno"));
		return "master/updateform";		
	}
	
	@RequestMapping(value="/duplicate", method = RequestMethod.POST)
	@ResponseBody
	public int duplicate(Model model,HttpServletRequest request){
		logger.info("duplicate");
		
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		String fno = request.getParameter("fno");
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("time", time);
		param.put("date", date);
		param.put("store", fno);
		
		int num = managementService.duplicateReservation(param);
		
		return num;		
	}
	
	@RequestMapping(value="/reserve", method = RequestMethod.POST)
	public String reserve(Model model,HttpServletRequest request){
		logger.info("reserve");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		param.put("store", request.getParameter("fno") );
		
		managementService.reservationRegist(param);
		return "redirect:/master/reservationDetail?fno="+request.getParameter("fno");		
	}
	
	@RequestMapping(value="/getCustomer", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> getCustomer(HttpServletRequest request){
		logger.info("getCustomer");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fno", request.getParameter("fno"));
		map.put("division", request.getParameter("division"));
		map.put("search", request.getParameter("search"));
		
		List<Map<String,Object>> list = managementService.getCustomer(map);
		
		return list;
	}
	
	@RequestMapping(value="/customerInfo/{no}",method=RequestMethod.GET)
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
		
		return "master/customerInfo";
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
		
		masterService.reserveUpdate(param);
		return "redirect:/master/reservationDetail?fno="+request.getParameter("fno");		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/down", method = RequestMethod.GET)
	public String down(HttpServletRequest request,Model model){
		logger.info("down");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		List<Map<String,Object>> list = masterService.down(param);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		return "master/down";
	}
	
	@RequestMapping(value="/customerUpdate/{no}",method=RequestMethod.GET)
	public String customerUpdate(Model model,HttpServletRequest request,@PathVariable String no){
		logger.info("customerUpdate");
		
		Map<String,Object> client = managementService.getClientInfo(no);
		List<Map<String,Object>> manufacturers = managementService.getManufacturerList();
		Map<String,Object> param =new HashMap<String,Object>();
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		model.addAttribute("client", client);
		model.addAttribute("manufacturers", manufacturers);
		
		return "master/customerUpdate";
	}
	
	@RequestMapping(value="/customerWrite",method=RequestMethod.GET)
	public String clientWrite(Model model){
		logger.info("customerWrite");
		
		Map<String,Object> param =new HashMap<String,Object>();
		List<Map<String,Object>> franchiseList = masterService.getFranchiseList(param);
		model.addAttribute("franchiseList", franchiseList);
		
		List<Map<String,Object>> manufacturers = managementService.getManufacturerList();
		model.addAttribute("manufacturers", manufacturers);
		
		return "master/customerWrite";
	}
	
	@RequestMapping(value="/customerwriteAction",method=RequestMethod.POST)
	public String clientwriteAction(HttpServletRequest request){
		logger.info("customerwriteAction");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}

		managementService.clientwriteAction(param);
		
		return "redirect:/master/customerDetail";
	}
	
	@RequestMapping(value="/customerUpdateAction",method=RequestMethod.POST)
	public String clientUpdateAction(HttpServletRequest request){
		logger.info("customerUpdateAction");
		
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		
		masterService.clientUpdateAction(param);
		
		return "redirect:/master/customerDetail";
	}
	
	@RequestMapping(value="/customerDelete/{no}",method=RequestMethod.GET)
	public String clientDelete(HttpServletRequest request,@PathVariable String no){
		logger.info("customerDelete");
		
		managementService.clientDelete(no);
		
		return "redirect:/master/customerDetail";
	}
	
	@RequestMapping(value="/reservationList/{no}", method = {RequestMethod.GET,RequestMethod.POST})
	public String reservationList(Locale locale,Model model,HttpServletRequest request,@PathVariable String no){
		logger.info("reservationList");
		
		String PaginationNum = request.getParameter("PaginationNum");
		if(PaginationNum==null){PaginationNum = "1";}
		Map <String,Object> param = new HashMap<String,Object>();
		param.put("PaginationNum", PaginationNum );

		param.put("store", no);
		int CustomerListTotal = managementService.getCustomerListTotal(param);
		
		//페이징
		Utilities util = new Utilities();
		param.putAll( util.pagination(10,CustomerListTotal,(String)param.get("PaginationNum")) );
		
		List<Map<String,Object>> customerlist = managementService.getCustomerList(param);
		model.addAttribute("customerlist", customerlist);
		model.addAttribute("paramInfo", param);
		
		return "master/reservationList";		
	}
	
}
