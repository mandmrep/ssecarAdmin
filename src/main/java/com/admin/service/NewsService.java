package com.admin.service;

import java.util.List;
import java.util.Map;


public interface NewsService {

	List<Map<String, Object>> getNewsList(Map<String, Object> param);

	int getNewsListTotal(Map<String,Object> map);

	void newsWrite(Map<String, Object> map);

	void newsDelete(String no);

	Map<String, Object> newsDetail(String no);

	void updateAction(Map<String, Object> map);

}
