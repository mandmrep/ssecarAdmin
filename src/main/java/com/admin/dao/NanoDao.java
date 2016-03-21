package com.admin.dao;

import java.util.List;
import java.util.Map;

public interface NanoDao {

	void regist(Map<String, Object> map);

	List<Map<String, Object>> getNanoList(Map<String, Object> param);

	int getNanoListTotal(Map<String,Object> map);

	void delete(String no);

	Map<String, Object> updateForm(String no);

	void update(Map<String, Object> map);

	Map<String, Object> registForm(int fno);

	List<Map<String, Object>> getManufacturerList();

}
