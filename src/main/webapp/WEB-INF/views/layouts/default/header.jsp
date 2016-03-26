<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<header class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
	</div>	
	<a href="/" class="logo">SHK GROUP <span class="lite"> ADMIN SYSTEM</span></a>
	<div class="top-nav notification-row" style="margin-top: 17px;">
		<sec:authentication property="principal.name"/>님이 로그인 하셨습니다.
		<a href="/j_spring_security_logout" class="btn btn-sm btn-primary" style="margin-bottom: 5px;">로그아웃</a>
    </div>
</header>

<!--sidebar start-->
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<li>
				<a href="/"><i class="icon_house_alt"></i><span>HOME</span></a>
			</li>
			
			<sec:authorize access="hasAnyAuthority('ROLE_SSECARS','ROLE_ADMIN','ROLE_MOBIL')">
			<li class="sub-menu">
				<a href="#"><i class="icon_document_alt"></i><span>게시판 관리</span><span class="menu-arrow arrow_carrot-right"></span></a>
				<ul class="sub">
					<sec:authorize access="hasAuthority('ROLE_ADMIN')">
						<li><a href="/franchise/main">가맹점 관리</a></li>
						<li><a href="/notice/main">공지사항 관리</a></li>
						<li><a href="/news/main">보도자료 관리</a></li>
						<li><a href="/recruit/main">채용관리</a></li>
					</sec:authorize>
					
						<li><a href="/event/main">이벤트 관리</a></li>
						<li><a href="/qna/main">문의사항관리</a></li>
					<sec:authorize access="hasAnyAuthority('ROLE_SSECARS','ROLE_MOBIL')">
						<li><a href="/management/customer">예약 게시판</a></li>
					</sec:authorize>
				</ul>
			</li>
			</sec:authorize>
			
			<sec:authorize access="hasAnyAuthority('ROLE_SSECARS','ROLE_MOBIL')">
			<li class="sub-menu">
				<a href="javascript:;"> <i class="icon_desktop"></i> <span>관리시스템</span> <span class="menu-arrow arrow_carrot-right"></span></a>
				<ul class="sub">
					<li><a href="/management/reservation">예약관리</a></li>
					<li><a href="/management/calendar">예약관리(캘린더)</a></li>
					<li><a href="/management/sales">매출관리(서비스)</a></li>
					<li><a href="/management/products">매출관리(제품)</a></li>
					<li><a href="/management/day">일매출조회</a></li>
					<li><a href="/management/month">월매출조회</a></li>
					<li><a href="/management/client">고객관리</a></li>
				</ul>
			</li>
			</sec:authorize>
			
			
			<li class="sub-menu">
				<a href="javascript:;" class=""> <i class="icon_desktop"></i> <span>NANO Quatz</span> <span class="menu-arrow arrow_carrot-right"></span></a>
				<ul class="sub">
					<li><a class="" href="/nano/main">나노쿼츠 관리</a></li>
				</ul>
			</li>

			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
			<li class="sub-menu">
				<a href="javascript:;"> <i class="icon_desktop"></i> <span>마스터 메뉴</span> <span class="menu-arrow arrow_carrot-right"></span></a>
				<ul class="sub">
					<li><a href="/master/products">상품관리</a></li>
					<li><a href="/master/account">계정관리</a></li>
					<li><a href="/master/vehicle">차종관리</a></li>
					<li><a href="/master/reservation">예약관리</a></li>
					<li><a href="/master/sales">매출관리</a></li>
					<li><a href="/master/customerDetail">고객관리</a></li>
					<!-- <li><a href="/master/day">월매출관리</a></li>
					<li><a href="/master/month">연매출조회</a></li> -->
					<li><a href="/master/statistics">통계조회</a></li>
				</ul>
			</li>
			</sec:authorize>
			
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->