package com.admin.service;

import java.util.List;
import java.util.Map;

public interface RecruitService {

	List<Map<String, Object>> getRecruitList(Map<String, Object> param);

	int getRecruitListTotal(Map<String,Object> map);

	Map<String, Object> RecruitDetail(String no);

	void recruitDelete(String no);

	void updateOpenYn(String no);

}
