package com.admin.service;

import java.util.List;
import java.util.Map;

public interface MasterService {

	int getProductsListTotal(Map<String, Object> map);

	List<Map<String, Object>> getProductsList(Map<String, Object> param);

	void productsDelete(String no);

	void productswriteAction(Map<String, Object> param);

	int idDuplication(String id);

	void accountWriteAction(Map<String, Object> param);

	List<Map<String, Object>> getAccountsList(Map<String, Object> param);

	int getAccountListTotal(Map<String, Object> map);

	void accountDelete(String no);

	Map<String, Object> accountUpdate(String no);

	void accountUpdateAction(Map<String, Object> param);

	List<Map<String, Object>> getManufacturerList(Map<String, Object> param);

	List<Map<String, Object>> getautomobile(String num);

	void manuDelete(String no);

	void autoDelete(String no);

	void vehicleManuWriteAction(String manufacturer);

	void vehicleAutoWriteAction(Map<String, Object> map);

	int manuDuplication(String manufacturer);

	int autoDuplication(String name);

	List<Map<String, Object>> getFranchiseList(Map<String, Object> param);

	List<Map<String, Object>> reservationDetail(Map<String, Object> param);

	int reservationDetailTotal(Map<String, Object> map);

	List<Map<String, Object>> salesDetail(Map<String, Object> param);

	int salesDetailTotal(Map<String, Object> map);

	List<Map<String, Object>> customerDetail(Map<String, Object> param);

	int customerDetailTotal(Map<String, Object> map);

	List<Map<String, Object>> dayDetail(Map<String, Object> param);

	List<Map<String, Object>> monthDetail(Map<String, Object> map);

	List<Map<String, Object>> statisticsDetail(Map<String, Object> param);

	List<Map<String, Object>> getAreaList(Map<String, Object> map);

	List<Map<String, Object>> getfranchise(String area);
	
	//2016-01-11 reservationDeatail를 Calendar를 사용함으로써 추가
	List<Map<String, Object>> getCalendarList(Map<String, Object> param);

	Map<String, Object> dayTotal(Map<String, Object> map);

	Map<String, Object> monthTotal(Map<String, Object> map);

	Map<String, Object> getReserveInfobynum(Map<String, Object> param);

	void reserveUpdate(Map<String, Object> param);

	List<Map<String, Object>> down(Map<String, Object> param);

	void clientUpdateAction(Map<String, Object> param);

}
