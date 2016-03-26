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

	List<Map<String, Object>> getNoticeList2(Map<String, Object> param);

	int getNoticeListTotal2(Map<String, Object> map);

	void noticeWrite2(Map<String, Object> map);

	Map<String, Object> noticeDetail2(String no);

	void noticeModify2(Map<String, Object> map);

	void noticeDelete2(String no);

}
