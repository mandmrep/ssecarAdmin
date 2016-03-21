package com.admin.util;

import java.util.HashMap;
import java.util.Map;

public class Utilities {
	public Map<String,Object> pagination(int perpage,int listTotal,String PaginationNum){	//한 화면에 글개수,리스트의 총개수  and 페이지 넘버
		
		int pageCount = 0;		// DB에의LIMIT을 위한  값
		int countperPage = perpage;	// 페이지 당 보여줄 글의 개수
		int PageCnt = 0;	// PaginationNum
		
		//페이네이션 값이 있다면 값 세팅
		if( PaginationNum !=null && PaginationNum !=""){	 
			PageCnt = Integer.parseInt(PaginationNum)-1;
			pageCount = PageCnt*countperPage;
		}else{
			PaginationNum = "1";
		}
		
		//페이지네이션 개수 ( 총 리스트 수 / 페이지 당 리스트갯수 )
		int paginationTotal = listTotal/countperPage;
		
		if(listTotal%countperPage != 0){
			paginationTotal++;
		}
		
		//화면에 보여질 페이지네이션 개수
		int paginationCnt = 10;
		int pagingTotal = paginationTotal/paginationCnt;
		int pagingCnt = Integer.parseInt(PaginationNum);
		
		if(paginationTotal%paginationCnt != 0){
			pagingTotal++;
		}
		
		int i = 1;
		while(i<pagingTotal){
			if(pagingCnt > (i*paginationCnt)){
				i++;
			}else{break;}
		}
		
		int startPage = (i-1)*paginationCnt +1;
		int endPage = i*paginationCnt;
		
		if(paginationTotal < endPage){
			endPage = paginationTotal;
		}
		
		// 페이지네이션 정보
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("pageCount", pageCount);
		param.put("countperPage", countperPage);
		param.put("PaginationNum", PaginationNum);
		param.put("paginationTotal", paginationTotal );
		param.put("startPage", startPage);
		param.put("endPage", endPage);
		return param;
	}
	
public Map<String,Object> pagination(int perPage,Map<String,Object> map){	//한 화면에 글개수,리스트의 총개수와 페이지 넘버는 맵으로
		
		int pageCount = 0;		// DB에의LIMIT을 위한  값
		int countperPage = perPage;	// 페이지 당 보여줄 글의 개수
		
		//페이네이션 값이 있다면 값 세팅
		if( map.get("PaginationNum") !=null && map.get("PaginationNum") !=""){	 
			int idx = Integer.parseInt( (String)map.get("PaginationNum") )-1;
			pageCount = idx*countperPage;
		}else{
			map.put("PaginationNum", "1");
		}
		
		//페이지네이션 개수 ( 총 리스트 수 / 페이지 당 리스트갯수 )
		int paginationTotal = (Integer)map.get("listTotal")/countperPage;
		
		if((Integer)map.get("listTotal")%countperPage != 0){
			paginationTotal++;
		}
		
		// 페이지네이션 정보
		map.put("pageCount", pageCount);
		map.put("countperPage", countperPage);
		map.put("paginationTotal", paginationTotal );
				
		return map;
	}
}
