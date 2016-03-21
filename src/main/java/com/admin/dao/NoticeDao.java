package com.admin.dao;

import java.util.List;
import java.util.Map;

public interface NoticeDao {

	List<Map<String, Object>> getNoticeList(Map<String, Object> param);

	int getNoticeListTotal(Map<String,Object> map);

	Map<String, Object> noticeDetail(String no);

	void noticeWrite(Map<String, Object> map);

	void noticeDelete(String no);

	void noticeModify(Map<String, Object> map);

}
