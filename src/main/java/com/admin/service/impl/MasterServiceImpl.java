package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.MasterDao;
import com.admin.service.MasterService;

@Service("MasterService")
public class MasterServiceImpl implements MasterService{

	@Autowired
	private MasterDao masterDao;
	
	@Override
	public int getProductsListTotal(Map<String, Object> map) {
		
		return masterDao.getProductsListTotal(map);
	}

	@Override
	public List<Map<String, Object>> getProductsList(Map<String, Object> param) {
		
		return masterDao.getProductsList(param);
	}

	@Override
	public void productsDelete(String no) {
		masterDao.productsDelete(no);
	}

	@Override
	public void productswriteAction(Map<String, Object> param) {
		masterDao.productswriteAction(param);
		
	}

	@Override
	public int idDuplication(String id) {
		
		return masterDao.idDuplication(id);
	}

	@Override
	public void accountWriteAction(Map<String, Object> param) {
		
		masterDao.accountWriteAction(param);
		masterDao.roleWriteAction(param);
	}

	@Override
	public List<Map<String, Object>> getAccountsList(Map<String, Object> param) {
		
		return masterDao.getAccountsList(param);
	}

	@Override
	public int getAccountListTotal(Map<String, Object> map) {
		
		return masterDao.getAccountListTotal(map);
	}

	@Override
	public void accountDelete(String username) {
		
		masterDao.accountDelete(username);
		masterDao.roleDelete(username);
	}

	@Override
	public Map<String, Object> accountUpdate(String no) {
		
		return masterDao.accountUpdate(no);
	}

	@Override
	public void accountUpdateAction(Map<String, Object> param) {
		
		masterDao.accountUpdateAction(param);
	}

	@Override
	public List<Map<String, Object>> getManufacturerList(Map<String, Object> param) {

		return masterDao.getManufacturerList(param);
	}

	@Override
	public List<Map<String, Object>> getautomobile(String num) {
		
		return masterDao.getautomobile(num);
	}

	@Override
	public void manuDelete(String no) {
		
		masterDao.manuDelete(no);
	}

	@Override
	public void autoDelete(String no) {
		
		masterDao.autoDelete(no);
	}

	@Override
	public void vehicleManuWriteAction(String manufacturer) {
		
		masterDao.vehicleManuWriteAction(manufacturer);
	}

	@Override
	public void vehicleAutoWriteAction(Map<String, Object> map) {
		
		masterDao.vehicleAutoWriteAction(map);
	}

	@Override
	public int manuDuplication(String manufacturer) {
		
		return masterDao.manuDuplication(manufacturer);
	}
	
	@Override
	public int autoDuplication(String name) {
		
		return masterDao.autoDuplication(name);
	}

	@Override
	public List<Map<String, Object>> getFranchiseList(Map<String, Object> param) {
		
		return masterDao.getFranchiseList(param);
	}

	@Override
	public List<Map<String, Object>> reservationDetail(Map<String, Object> param) {
		
		return masterDao.reservationDetail(param);
	}

	@Override
	public int reservationDetailTotal(Map<String, Object> map) {
		
		return masterDao.reservationDetailTotal(map);
	}

	@Override
	public List<Map<String, Object>> salesDetail(Map<String, Object> param) {
		
		return masterDao.salesDetail(param);
	}

	@Override
	public int salesDetailTotal(Map<String, Object> map) {
		
		return masterDao.salesDetailTotal(map);
	}

	@Override
	public List<Map<String, Object>> customerDetail(Map<String, Object> param) {
		
		return masterDao.customerDetail(param);
	}

	@Override
	public int customerDetailTotal(Map<String, Object> map) {
		
		return masterDao.customerDetailTotal(map);
	}

	@Override
	public List<Map<String, Object>> dayDetail(Map<String, Object> param) {
		
		return masterDao.dayDetail(param);
	}

	@Override
	public List<Map<String, Object>> monthDetail(Map<String, Object> map) {
		
		return masterDao.monthDetail(map);
	}

	@Override
	public List<Map<String, Object>> statisticsDetail(Map<String, Object> param) {
		String path = (String)param.get("path");
		
		List<Map<String, Object>> result = null;
		if(path.equals("customer")){
			result = masterDao.statisticsCustomerDetail(param);
		}else if( path.equals("reservation") ){
			result = masterDao.statisticsDetail(param);
		}
		
		return result;
	}

	@Override
	public List<Map<String, Object>> getAreaList(Map<String, Object> map) {
		
		return masterDao.getAreaList(map);
	}

	@Override
	public List<Map<String, Object>> getfranchise(String area) {
		
		return masterDao.getfranchise(area);
	}
	
	//2016-01-11 reservationDeatail를 Calendar를 사용함으로써 추가
	@Override
	public List<Map<String, Object>> getCalendarList(Map<String, Object> param) {
		
		return masterDao.getCalendarList(param);
	}

	@Override
	public Map<String, Object> dayTotal(Map<String, Object> map) {
		
		return masterDao.dayTotal(map);
	}

	@Override
	public Map<String, Object> monthTotal(Map<String, Object> map) {
		
		return masterDao.monthTotal(map);
	}

	@Override
	public Map<String, Object> getReserveInfobynum(Map<String, Object> param) {
		
		return masterDao.getReserveInfobynum(param);
	}

	@Override
	public void reserveUpdate(Map<String, Object> param) {
		
		masterDao.reserveUpdate(param);
	}

	@Override
	public List<Map<String, Object>> down(Map<String, Object> param) {
		
		return masterDao.down(param);
	}

	@Override
	public void clientUpdateAction(Map<String, Object> param) {
		
		masterDao.clientUpdateAction(param);
	}
	
}
