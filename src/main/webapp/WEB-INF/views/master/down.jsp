<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table border="1">
	<tr>
		<td>총No</td>
		<td>고객No</td>
		<td><i class="icon_calendar"></i> 고객명</td>
		<td><i class="icon_calendar"></i> 날짜</td>
		<td><i class="icon_calendar"></i> 구분</td>
		<td><i class="icon_calendar"></i> 제품명</td>
		<td><i class="icon_mail_alt"></i> 카드</td>
		<td><i class="icon_mail_alt"></i> 현금</td>
		<td><i class="icon_mail_alt"></i> 소셜</td>
		<td><i class="icon_mail_alt"></i> 쿠폰</td>
		<td><i class="icon_mail_alt"></i> 합계</td>
		<td><i class="icon_mail_alt"></i> 비고</td>
	</tr>
	<c:forEach var="i" items="${list}">
		<tr>
			<td>${i.num}</td>
			<td>${i.customernum}</td>
			<td>${i.name}</td>
			<td>${i.date}</td>
			<td>${i.division}</td>
			<td>${i.service}</td>
			<td>${i.card}</td>
			<td>${i.cash}</td>
			<td>${i.social}</td>
			<td>${i.coupon}</td>
			<td>${i.card+i.cash+i.coupon}</td>
			<td>${i.memo}</td>
		</tr>
	</c:forEach>
</table>