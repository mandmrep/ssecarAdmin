package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.NanoDao;
import com.admin.service.NanoService;

@Service("NanoService")
public class NanoServiceImpl implements NanoService{

	@Autowired
	private NanoDao nanoDao;
	
	@Override
	public List<Map<String, Object>> getNanoList(Map<String, Object> param) {
		
		return nanoDao.getNanoList(param);
	}

	@Override
	public int getNanoListTotal(Map<String,Object> map) {
		
		return nanoDao.getNanoListTotal(map);
	}
	
	@Override
	public void regist(Map<String, Object> map) {
		
		nanoDao.regist(map);
	}

	@Override
	public void delete(String no) {
		
		nanoDao.delete(no);
	}

	@Override
	public Map<String, Object> updateForm(String no) {
		
		return nanoDao.updateForm(no);
	}

	@Override
	public void update(Map<String, Object> map) {
		
		nanoDao.update(map);
	}

	@Override
	public Map<String, Object> registForm(int fno) {
		
		return nanoDao.registForm(fno);
	}

	@Override
	public List<Map<String, Object>> getManufacturerList() {
		
		return nanoDao.getManufacturerList();
	}
}
