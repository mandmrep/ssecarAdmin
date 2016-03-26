package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.NoticeDao;
import com.admin.service.NoticeService;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<Map<String, Object>> getNoticeList(Map<String, Object> param) {
		
		return noticeDao.getNoticeList(param);
	}

	@Override
	public int getNoticeListTotal(Map<String,Object> map) {
		
		return noticeDao.getNoticeListTotal(map);
	}

	@Override
	public Map<String, Object> noticeDetail(String no) {
		
		return noticeDao.noticeDetail(no);
	}

	@Override
	public void noticeWrite(Map<String, Object> map) {
		
		noticeDao.noticeWrite(map);
	}

	@Override
	public void noticeDelete(String no) {
		
		noticeDao.noticeDelete(no);
	}

	@Override
	public void noticeModify(Map<String, Object> map) {
		
		noticeDao.noticeModify(map);
	}

	@Override
	public List<Map<String, Object>> getNoticeList2(Map<String, Object> param) {
		
		return noticeDao.getNoticeList2(param);
	}

	@Override
	public int getNoticeListTotal2(Map<String, Object> map) {
		
		return noticeDao.getNoticeListTotal2(map);
	}

	@Override
	public void noticeWrite2(Map<String, Object> map) {
		
		noticeDao.noticeWrite2(map);
	}

	@Override
	public Map<String, Object> noticeDetail2(String no) {
		
		return noticeDao.noticeDetail2(no);
	}

	@Override
	public void noticeModify2(Map<String, Object> map) {
		noticeDao.noticeModify2(map);
		
	}

	@Override
	public void noticeDelete2(String no) {
		noticeDao.noticeDelete2(no);
		
	}

}
