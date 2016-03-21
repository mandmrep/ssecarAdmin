package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.EventDao;
import com.admin.service.EventService;

@Service("EventService")
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDao eventDao;

	@Override
	public List<Map<String, Object>> getEventList(Map<String, Object> param) {
		
		return eventDao.getEventList(param);
	}

	@Override
	public int getEventListTotal( Map<String, Object> info ) {
		
		return eventDao.getEventListTotal(info);
	}

	@Override
	public void eventWrite(Map<String, Object> param) {
		
		eventDao.eventWrite(param);
	}

	@Override
	public Map<String, Object> eventDetail(String no) {
		
		return eventDao.eventDetail(no);
	}

	@Override
	public void eventModifyAction(Map<String, Object> param) {
		
		eventDao.eventModifyAction(param);
	}

	@Override
	public void eventDelete(String no) {
		
		eventDao.eventDelete(no);
	} 
	
	
}
