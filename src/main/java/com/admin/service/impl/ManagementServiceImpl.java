package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.ManagementDao;
import com.admin.service.ManagementService;

@Service("ManagementService")
public class ManagementServiceImpl implements ManagementService{

	@Autowired
	private ManagementDao managementDao; 
	
	@Override
	public List<Map<String, Object>> getCustomerList(Map<String, Object> param) {
		
		return managementDao.getCustomerList(param);
	}

	@Override
	public int getCustomerListTotal(Map<String, Object> param) {
		
		return managementDao.getCustomerListTotal(param);
	}
	
	@Override
	public void customerDelete(String idx) {
		
	     managementDao.customerDelete(idx);
	}
	
	@Override
	public void reservationRegist(Map<String, Object> param) {
		managementDao.reservationRegist(param);
		
	}

	@Override
	public List<Map<String, Object>> getReservationList(Map<String, Object> param) {
		
		return managementDao.getReservationList(param);
	}

	@Override
	public int getReservationListTotal(Map<String, Object> param) {
		
		return managementDao.getReservationListTotal(param);
	}

	@Override
	public List<Map<String, Object>> getCalendarList(Map<String, Object> param) {
		
		return managementDao.getCalendarList(param);
	}

	@Override
	public List<Map<String, Object>> getProductsList() {
		
		return managementDao.getProductsList();
	}

	@Override
	public List<Map<String, Object>> getManufacturerList() {
		
		return managementDao.getManufacturerList();
	}

	@Override
	public List<Map<String, Object>> getAutomobileList(int manufacturer) {

		return managementDao.getAutomobileList(manufacturer);
	}

	@Override
	public int duplicateReservation(Map<String, Object> param) {
		
		return managementDao.duplicateReservation(param);
	}

	@Override
	public void reservationdelete(String idx) {
		
		managementDao.reservationdelete(idx);
	}

	@Override
	public Map<String, Object> reservationupdateform(String idx) {
		
		return managementDao.reservationupdateform(idx);
	}

	@Override
	public void reserveUpdate(Map<String, Object> param) {
		managementDao.reserveUpdate(param);
	}

	@Override
	public List<Map<String, Object>> getCustomer(Map<String, Object> map) {
		
		return managementDao.getCustomer(map);
	}

	@Override
	public List<Map<String, Object>> getService(Map<String, Object> map) {
		
		return managementDao.getService(map);
	}

	@Override
	public void saleswriteAction(Map<String, Object> param) {
		
		managementDao.saleswriteAction(param);
	}

	@Override
	public Map<String, Object> getFranchiseList(int fno) {
		
		return managementDao.getFranchiseList(fno);
	}

	@Override
	public List<Map<String, Object>> getSalesList(Map<String, Object> param) {
		
		return managementDao.getSalesList(param);
	}

	@Override
	public int getSalesListTotal(Map<String, Object> map) {
		
		return managementDao.getSalesListTotal(map);
	}

	@Override
	public List<Map<String, Object>> getSalesProductsList(Map<String, Object> param) {
		
		return managementDao.getSalesProductsList(param);
	}

	@Override
	public int getSalesProductsListTotal(Map<String, Object> map) {
		
		return managementDao.getSalesProductsListTotal(map);
	}

	@Override
	public void salesDelete(String num) {
		
		managementDao.salesDelete(num);
	}

	@Override
	public Map<String, Object> salesUpdate(String no) {
		
		return managementDao.salesUpdate(no);
	}

	@Override
	public void salesUpdateAction(Map<String, Object> param) {
		
		managementDao.salesUpdateAction(param);
	}

	@Override
	public List<Map<String, Object>> getDaySalesList(Map<String, Object> param) {
		
		return managementDao.getDaySalesList(param);
	}

	@Override
	public List<Map<String, Object>> getDayJson(Map<String, Object> param) {
		
		return managementDao.getDayJson(param);
	}

	@Override
	public List<Map<String, Object>> getYearSalesList(Map<String, Object> param) {
		
		return managementDao.getYearSalesList(param);
	}

	@Override
	public List<Map<String, Object>> getYearList(Map<String, Object> param) {
		
		return managementDao.getYearList(param);
	}

	@Override
	public List<Map<String, Object>> getClientsList(Map<String, Object> param) {
		
		return managementDao.getClientsList(param);
	}

	@Override
	public int getClientsListTotal(Map<String, Object> map) {
		
		return managementDao.getClientsListTotal(map);
	}

	@Override
	public Map<String, Object> getClientDetail(String no) {
		
		return managementDao.getClientDetail(no);
	}

	@Override
	public void clientwriteAction(Map<String, Object> param) {
		
		managementDao.clientwriteAction(param);
	}

	@Override
	public void clientDelete(String no) {
		
		managementDao.clientDelete(no);
	}

	@Override
	public Map<String, Object> getClientInfo(String no) {
		
		return managementDao.getClientInfo(no);
	}

	@Override
	public void clientUpdateAction(Map<String, Object> param) {
		
		managementDao.clientUpdateAction(param);
	}

	@Override
	public List<Map<String, Object>> getClientSalesList(Map<String,Object> param) {

		return managementDao.getClientSalesList(param);
	}

	@Override
	public int getClientSalesListTotal(String no) {
		
		return managementDao.getClientSalesListTotal(no);
	}

	@Override
	public Map<String, Object> getCustomerInfo(String cno) {
		return managementDao.getCustomerInfo(cno);
	}

	@Override
	public void confirmRequest(Map<String, Object> param) {
		managementDao.confirmRequest(param);
	}

	@Override
	public int carNo(Map<String, Object> param) {
		
		return managementDao.carNo(param);
	}

}
