package com.admin.service;

import java.util.List;
import java.util.Map;

public interface EventService {

	List<Map<String, Object>> getEventList(Map<String, Object> param);

	int getEventListTotal(Map<String, Object> info);

	void eventWrite(Map<String, Object> param);

	Map<String, Object> eventDetail(String no);

	void eventModifyAction(Map<String, Object> param);

	void eventDelete(String no);

}
