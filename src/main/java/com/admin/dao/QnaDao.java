package com.admin.dao;

import java.util.List;
import java.util.Map;

public interface QnaDao {

	List<Map<String, Object>> getQnaList(Map<String, Object> param);

	int getQnaListTotal(Map<String, Object> map);

	Map<String, Object> qnaDetail(String no);

	void qnaDelete(String no);

	void updateOpenYn(String no);

}
