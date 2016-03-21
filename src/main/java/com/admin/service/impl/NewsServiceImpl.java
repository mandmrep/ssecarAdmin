package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.NewsDao;
import com.admin.service.NewsService;


@Service("NewsService")
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDao newsDao;
	
	@Override
	public List<Map<String, Object>> getNewsList(Map<String, Object> param) {
		
		return newsDao.getNewsList(param);
	}

	@Override
	public int getNewsListTotal(Map<String,Object> map) {
		
		return newsDao.getNewsListTotal(map);
	}

	@Override
	public void newsWrite(Map<String, Object> map) {
		
		newsDao.newsWrite(map);
	}

	@Override
	public void newsDelete(String no) {
		
		newsDao.newsDelete(no);
	}

	@Override
	public Map<String, Object> newsDetail(String no) {
		
		return newsDao.newsDetail(no);
	}

	@Override
	public void updateAction(Map<String, Object> map) {
		
		newsDao.updateAction(map);
	}
	
	
}
