package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.FranchiseDao;
import com.admin.dto.FranchiseVo;
import com.admin.service.FranchiseService;

@Service("FranchiseService")
public class FranchiseServiceImpl implements FranchiseService{

	@Autowired
	private FranchiseDao franchiseDao; 
	
	@Override
	public int getLocationListTotal(Map<String, Object> map) {
		
		return franchiseDao.getLocationListTotal(map);
	}

	@Override
	public List<Map<String, Object>> getLocationList(Map<String, Object> param) {
		
		return franchiseDao.getLocationList(param);
	}

	@Override
	public int regist(FranchiseVo franchiseVo) {
		
		return franchiseDao.regist(franchiseVo);
	}

	@Override
	public void delete(String no) {

		franchiseDao.delete(no);
		franchiseDao.serviceDelete(no);
	}

	@Override
	public Map<String, Object> updateForm(String no) {
		
		return franchiseDao.updateForm(no);
	}

	@Override
	public void update(Map<String, Object> map) {
		
		franchiseDao.update(map);
	}

	@Override
	public void serviceRegist(Map<String, Object> map) {

		franchiseDao.serviceRegist(map);
	}

	@Override
	public void setService(Map<String, Object> map) {
		
		franchiseDao.setService(map);
	}

	@Override
	public List<String> getService(String no) {
		
		return franchiseDao.getService(no);
	}

}
