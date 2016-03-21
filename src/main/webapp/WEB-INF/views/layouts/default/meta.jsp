<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %> <%--ContextPath 선언 --%>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- Bootstrap CSS -->    
<link href="<%=cp%>/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="<%=cp%>/resources/css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="<%=cp%>/resources/css/elegant-icons-style.css" rel="stylesheet" />
<link href="<%=cp%>/resources/css/font-awesome.min.css" rel="stylesheet" />    
<!-- full calendar css-->
<link href="<%=cp%>/resources/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
<link href="<%=cp%>/resources/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />

<!-- owl carousel -->
<link rel="stylesheet" href="<%=cp%>/resources/ss/owl.carousel.css" type="text/css">
<link href="<%=cp%>/resources/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet" href="<%=cp%>/resources/css/fullcalendar.css">
<link href="<%=cp%>/resources/css/widgets.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/style.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/style-responsive.css" rel="stylesheet" />
<link href="<%=cp%>/resources/css/xcharts.min.css" rel=" stylesheet">	
<link href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

<!-- javascripts -->
<script src="<%=cp%>/resources/js/jquery.js"></script>
<script src="<%=cp%>/resources/js/jquery-ui-1.10.4.min.js"></script>
<script src="<%=cp%>/resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- bootstrap -->
<script src="<%=cp%>/resources/js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="<%=cp%>/resources/js/jquery.scrollTo.min.js"></script>
<script src="<%=cp%>/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- charts scripts -->
<script src="<%=cp%>/resources/assets/jquery-knob/js/jquery.knob.js"></script>
<script src="<%=cp%>/resources/js/jquery.sparkline.js" type="text/javascript"></script>
<script src="<%=cp%>/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
<script src="<%=cp%>/resources/js/owl.carousel.js" ></script>
<!-- jQuery full calendar -->
<script src="<%=cp%>/resources/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="<%=cp%>/resources/assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
<!--script for this page only-->
<script src="<%=cp%>/resources/js/calendar-custom.js"></script>
<script src="<%=cp%>/resources/js/jquery.rateit.min.js"></script>
<!-- custom select -->
<script src="<%=cp%>/resources/js/jquery.customSelect.min.js" ></script>
<script src="<%=cp%>/resources/assets/chart-master/Chart.js"></script>

<!--custome script for all page-->
<script src="<%=cp%>/resources/js/scripts.js"></script>
<!-- custom script for this page-->
<script src="<%=cp%>/resources/js/sparkline-chart.js"></script>
<script src="<%=cp%>/resources/js/easy-pie-chart.js"></script>
<script src="<%=cp%>/resources/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=cp%>/resources/js/jquery-jvectormap-world-mill-en.js"></script>
<script src="<%=cp%>/resources/js/xcharts.min.js"></script>
<script src="<%=cp%>/resources/js/jquery.autosize.min.js"></script>
<script src="<%=cp%>/resources/js/jquery.placeholder.min.js"></script>
<script src="<%=cp%>/resources/js/gdp-data.js"></script>	
<script src="<%=cp%>/resources/js/morris.min.js"></script>
<script src="<%=cp%>/resources/js/sparklines.js"></script>	
<script src="<%=cp%>/resources/js/charts.js"></script>
<script src="<%=cp%>/resources/js/jquery.slimscroll.min.js"></script>
<style>
.search_qna{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px; 	
}
#search_div{
	float: right;
}
</style>
<script>
var option = {
		showDropdowns: true,
		locale : {
			format : 'YYYY-MM-DD',
			daysOfWeek :["일","월","화","수","목","금","토"],
			monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월 ","10월","11월","12월"]				           
		}
	}
var singleoption = {
		singleDatePicker: true,
		showDropdowns: true,
		locale : {
			format : 'YYYY-MM-DD',
			daysOfWeek :["일","월","화","수","목","금","토"],
			monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월 ","10월","11월","12월"]				           
		}
	}
</script>
