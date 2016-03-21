package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.RecruitDao;
import com.admin.service.RecruitService;

@Service("RecruitService")
public class RecruitServiceImpl implements RecruitService{

	@Autowired
	private RecruitDao recruitDao;
	
	@Override
	public List<Map<String, Object>> getRecruitList(Map<String,Object> param) {
		
		return recruitDao.getRecruitList(param);
	}

	@Override
	public int getRecruitListTotal(Map<String,Object> map) {
		
		return recruitDao.getRecruitListTotal(map);
	}

	@Override
	public Map<String, Object> RecruitDetail(String no) {
		
		return recruitDao.RecruitDetail(no);
	}

	@Override
	public void recruitDelete(String no) {
		
		recruitDao.recruitDelete(no);
	}

	@Override
	public void updateOpenYn(String no) {
		
		recruitDao.updateOpenYn(no);
	}

}
