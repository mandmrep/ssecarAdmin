package com.admin.service;

import java.util.List;
import java.util.Map;


public interface NoticeService {

	List<Map<String, Object>> getNoticeList(Map<String, Object> param);

	int getNoticeListTotal(Map<String,Object> map);

	Map<String, Object> noticeDetail(String no);

	void noticeWrite(Map<String, Object> map);

	void noticeDelete(String no);

	void noticeModify(Map<String, Object> map);

}
