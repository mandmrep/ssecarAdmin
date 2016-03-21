package com.admin.service;

import java.util.List;
import java.util.Map;

import com.admin.dto.FranchiseVo;


public interface FranchiseService {

	int getLocationListTotal(Map<String, Object> map);

	List<Map<String, Object>> getLocationList(Map<String, Object> param);

	int regist(FranchiseVo franchiseVo);

	void delete(String no);

	Map<String, Object> updateForm(String no);

	void update(Map<String, Object> map);

	void serviceRegist(Map<String, Object> map);

	void setService(Map<String, Object> map);

	List<String> getService(String no);

}
