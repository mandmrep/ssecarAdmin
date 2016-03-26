<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> master메뉴
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>${paramInfo.fname} 월매출관리</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form id="sForm" action="/master/dayDetail" method="post">
						<input type="hidden" name="fno" value="${ paramInfo.fno }">
						<input type="hidden" name="fname" value="${ paramInfo.fname }">
						<input type="hidden" id="division" name="division" value="${ paramInfo.division }">
						<div class="btn-group" role="group" aria-label="..." style="margin: 10px 10px 10px; ">
							  <button type="button" class="btn btn-default" onclick="detail('${paramInfo.fno}','${paramInfo.fname}','salesDetail')">일매출</button>
							  <button type="button" class="btn btn-default active">월매출</button>
							  <button type="button" class="btn btn-default" onclick="detail('${paramInfo.fno}','${paramInfo.fname}','monthDetail')">연매출</button>
						</div>
						<div class="btn-group" role="group" aria-label="..." style="margin: 10px 10px 10px; ">
							  <button type="button" class="btn btn-default <c:if test='${empty paramInfo.division}'> active</c:if>" onclick="div('')">전 체</button>
							  <button type="button" class="btn btn-default <c:if test='${paramInfo.division eq "서비스"}'> active</c:if>" onclick="div('서비스')">서비스</button>
							  <button type="button" class="btn btn-default <c:if test='${paramInfo.division eq "제품"}'> active</c:if>" onclick="div('제품')">제품</button>
						</div>
						<div id="search_div" >
							<select name="year" class="search_qna" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="2015" <c:if test='${paramInfo.year eq "2015"}'> selected="selected"</c:if>>2015</option>
								<option value="2016" <c:if test='${paramInfo.year eq "2016"}'> selected="selected"</c:if>>2016</option>
								<option value="2017" <c:if test='${paramInfo.year eq "2017"}'> selected="selected"</c:if>>2017</option>
								<option value="2018" <c:if test='${paramInfo.year eq "2018"}'> selected="selected"</c:if>>2018</option>
								<option value="2019" <c:if test='${paramInfo.year eq "2019"}'> selected="selected"</c:if>>2019</option>
								<option value="2020" <c:if test='${paramInfo.year eq "2020"}'> selected="selected"</c:if>>2020</option>
								<option value="2021" <c:if test='${paramInfo.year eq "2021"}'> selected="selected"</c:if>>2021</option>
								<option value="2022" <c:if test='${paramInfo.year eq "2022"}'> selected="selected"</c:if>>2022</option>
								<option value="2023" <c:if test='${paramInfo.year eq "2023"}'> selected="selected"</c:if>>2023</option>
								<option value="2024" <c:if test='${paramInfo.year eq "2024"}'> selected="selected"</c:if>>2024</option>
								<option value="2025" <c:if test='${paramInfo.year eq "2025"}'> selected="selected"</c:if>>2025</option>
								<option value="2026" <c:if test='${paramInfo.year eq "2026"}'> selected="selected"</c:if>>2026</option>
							</select>
							<select name="month" class="search_qna" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="1" <c:if test='${paramInfo.month eq "1"}'> selected="selected"</c:if>>1</option>
								<option value="2" <c:if test='${paramInfo.month eq "2"}'> selected="selected"</c:if>>2</option>
								<option value="3" <c:if test='${paramInfo.month eq "3"}'> selected="selected"</c:if>>3</option>
								<option value="4" <c:if test='${paramInfo.month eq "4"}'> selected="selected"</c:if>>4</option>
								<option value="5" <c:if test='${paramInfo.month eq "5"}'> selected="selected"</c:if>>5</option>
								<option value="6" <c:if test='${paramInfo.month eq "6"}'> selected="selected"</c:if>>6</option>
								<option value="7" <c:if test='${paramInfo.month eq "7"}'> selected="selected"</c:if>>7</option>
								<option value="8" <c:if test='${paramInfo.month eq "8"}'> selected="selected"</c:if>>8</option>
								<option value="9" <c:if test='${paramInfo.month eq "9"}'> selected="selected"</c:if>>9</option>
								<option value="10" <c:if test='${paramInfo.month eq "10"}'> selected="selected"</c:if>>10</option>
								<option value="11" <c:if test='${paramInfo.month eq "11"}'> selected="selected"</c:if>>11</option>
								<option value="12" <c:if test='${paramInfo.month eq "12"}'> selected="selected"</c:if>>12</option>
							</select>
							<!-- <select name="division" class="search_qna" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="서비스">서비스</option>
								<option value="제품">제품</option>
							</select> -->
							<button type="submit" class="search_qna">검색</button>
						</div>
					</form>
					
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_calendar"></i> 일자</th>
								<th><i class="icon_calendar"></i> 일별No</th>
								<th><i class="icon_calendar"></i> 카드</th>
								<th><i class="icon_calendar"></i> 현금</th>
								<th><i class="icon_calendar"></i> 온라인</th>
								<th><i class="icon_calendar"></i> 소셜</th>
								<th><i class="icon_calendar"></i> 쿠폰</th>
								<th><i class="icon_mail_alt"></i>일 합계</th>
							</tr>
							<c:if test="${fn:length(dayList) ne 0}">
								<c:forEach var="day" items="${dayList}">
									<tr>
										<td>${day.date}</td>
										<td>${day.cnt}</td>
										<td>${day.card}</td>
										<td>${day.cash}</td>
										<td>${day.online}</td>
										<td>${day.social}</td>
										<td>${day.coupon}</td>
										<td>${day.total}</td>
									</tr>
								</c:forEach>
								<tr>
									<td>합계</td>
									<td></td>
									<td>${dayTotal.card}</td>
									<td>${dayTotal.cash}</td>
									<td>${dayTotal.online}</td>
									<td>${dayTotal.social}</td>
									<td>${dayTotal.coupon}</td>
									<td>${dayTotal.total}</td>
								</tr>
								<tr>
									<td>총계</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="font-size: 20px;">${dayTotal.alltotal}</td>
								</tr>
							</c:if>
							<c:if test="${fn:length(dayList) eq 0}"><tr><td>데이터가 없습니다.</td></tr></c:if>
							
						</tbody>
					</table>
				</section>

			</div>
		</div>
		<hr>
	</section>
</section>
<script>
$("#customerTable > tr > td:eq(7)").tooltip();

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/master/salesDetail');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var fno = $('<input type="hidden" name="fno" value="${paramInfo.fno}">');
    var qnalist = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var division = $('<input type="hidden" name="division" value="${paramInfo.division}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(qnalist).append(search).append(fno).append(division);
    $form.submit();
}

function detail(idx,nm,url){
	var $form = $('<form></form>');
	$form.attr('action', '/master/'+url);
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var idx = $('<input type="hidden" name="fno" value="'+idx+'">');
    var name = $('<input type="hidden" name="fname" value="'+nm+'">');
    $form.append(idx).append(name);
    $form.submit();
}

function div(val){
	$('#division').val(val);
	$('#sForm').submit();
}
</script>