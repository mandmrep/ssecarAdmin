package com.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dao.QnaDao;
import com.admin.service.QnaService;

@Service("QnaService")
public class QnaServiceImpl implements QnaService{

		@Autowired
		private QnaDao qnadao;

		@Override
		public List<Map<String, Object>> getQnaList(Map<String, Object> param) {
			
			return qnadao.getQnaList(param);
		}

		@Override
		public int getQnaListTotal(Map<String, Object> map) {
			
			return qnadao.getQnaListTotal(map);
		}

		@Override
		public Map<String, Object> qnaDetail(String no) {
			
			return qnadao.qnaDetail(no);
		}

		@Override
		public void qnaDelete(String no) {
			
			qnadao.qnaDelete(no);
		}

		@Override
		public void updateOpenYn(String no) {
			qnadao.updateOpenYn(no);
		}
		
		
}
