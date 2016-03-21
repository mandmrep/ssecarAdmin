<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	//******************************MS excel******************************
	// MS excel로 다운로드/실행, filename에 저장될 파일명을 적어준다.
	response.setHeader("Content-Disposition", "attachment;filename=download.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

	// ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
	//  response.setContentType("application/vnd.ms-excel");
	//*********************************************************************

	//******************************MS word********************************
	// MS word로 다운로드/실행, filename에 저장될 파일명을 적어준다.
	//  response.setHeader("Content-Disposition", "attachment;filename=member.doc");
	//  response.setHeader("Content-Description", "JSP Generated Data");

	// ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
	//  response.setContentType("application/vnd.ms-word");
	//*********************************************************************

	//******************************한글(hwp)********************************
	// 한글(hwp)로 다운로드/실행, filename에 저장될 파일명을 적어준다.
	//  response.setHeader("Content-Disposition", "attachment;filename=member.hwp");
	//  response.setHeader("Content-Description", "JSP Generated Data");

	// ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
	//  response.setContentType("application/hwp");
	//*********************************************************************
%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
	<tiles:insertAttribute name="body" />
</body>
</html>