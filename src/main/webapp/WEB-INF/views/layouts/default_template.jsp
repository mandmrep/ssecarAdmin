<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<tiles:insertAttribute name="meta" />
		<title><tiles:getAsString name="title"/></title>
	</head>
	<body>
		<section id="container">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="body" />
		</section>
	</body>
</html>