package com.admin.dao;

import java.util.List;
import java.util.Map;

public interface NewsDao {

	List<Map<String, Object>> getNewsList(Map<String, Object> param);

	int getNewsListTotal(Map<String,Object> map);

	void newsWrite(Map<String, Object> map);

	void newsDelete(String no);

	Map<String, Object> newsDetail(String no);

	void updateAction(Map<String, Object> map);

}