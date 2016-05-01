package com.admin.dao;

import java.util.List;
import java.util.Map;

public interface ManagementDao {

	List<Map<String, Object>> getCustomerList(Map<String, Object> param);

	int getCustomerListTotal(Map<String, Object> param);
	
	void customerDelete(String idx);

	void reservationRegist(Map<String, Object> param);

	List<Map<String, Object>> getReservationList(Map<String, Object> param);

	int getReservationListTotal(Map<String, Object> param);

	List<Map<String, Object>> getCalendarList(Map<String, Object> param);

	List<Map<String, Object>> getProductsList();

	List<Map<String, Object>> getManufacturerList();

	List<Map<String, Object>> getAutomobileList(int manufacturer);

	int duplicateReservation(Map<String, Object> param);

	void reservationdelete(String idx);

	Map<String, Object> reservationupdateform(String idx);

	void reserveUpdate(Map<String, Object> param);

	List<Map<String, Object>> getCustomer(Map<String, Object> map);

	List<Map<String, Object>> getService(Map<String, Object> map);

	void saleswriteAction(Map<String, Object> param);

	Map<String, Object> getFranchiseList(int fno);

	List<Map<String, Object>> getSalesList(Map<String, Object> param);

	int getSalesListTotal(Map<String, Object> map);

	List<Map<String, Object>> getSalesProductsList(Map<String, Object> param);

	int getSalesProductsListTotal(Map<String, Object> map);

	void salesDelete(String num);

	Map<String, Object> salesUpdate(String no);

	void salesUpdateAction(Map<String, Object> param);

	List<Map<String, Object>> getDaySalesList(Map<String, Object> param);

	List<Map<String, Object>> getDayJson(Map<String, Object> param);

	List<Map<String, Object>> getYearSalesList(Map<String, Object> param);

	List<Map<String, Object>> getYearList(Map<String, Object> param);

	List<Map<String, Object>> getClientsList(Map<String, Object> param);

	int getClientsListTotal(Map<String, Object> map);

	Map<String, Object> getClientDetail(String no);

	void clientwriteAction(Map<String, Object> param);

	void clientDelete(String no);

	Map<String, Object> getClientInfo(String no);

	void clientUpdateAction(Map<String, Object> param);

	List<Map<String, Object>> getClientSalesList(Map<String,Object> param);

	int getClientSalesListTotal(String no);

	Map<String, Object> getCustomerInfo(String cno);

	void confirmRequest(Map<String, Object> param);

}
