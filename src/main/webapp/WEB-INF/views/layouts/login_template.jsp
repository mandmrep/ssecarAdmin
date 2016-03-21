<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap CSS -->    
	    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	    <!-- bootstrap theme -->
	    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.css" rel="stylesheet">
	    <!--external css-->
	    <!-- font icon -->
	    <link href="${pageContext.request.contextPath}/resources/css/elegant-icons-style.css" rel="stylesheet" />
	    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" />
	    <!-- Custom styles -->
	    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/resources/css/style-responsive.css" rel="stylesheet" />
	    <title><tiles:getAsString name="title"/></title>
	    <script>
	    var mobilewords = new Array('iPad', 'iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SobyEricsson', 'Mobile');
	    var url = "http://www.ssecarsteam.com/m";
	    for (var word in mobilewords) {
	        if (navigator.userAgent.match(mobilewords[word]) != null){
	            location.href = url;
	            break;
	        }
	    }
	    </script>
	</head>
	<body class="login-img3-body">
		<tiles:insertAttribute name="body"/>
	</body>
</html>