<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<li><i class="fa fa-home"></i>${paramInfo.fname} 일매출관리</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form action="/master/salesDetail" method="post">
						<input type="hidden" name="fno" value="${ paramInfo.fno }">
						<div class="btn-group" role="group" aria-label="..." style="margin: 10px 10px 10px; ">
							  <button type="button" class="btn btn-default active">일매출</button>
							  <button type="button" class="btn btn-default" onclick="location.href='/master/day';">월매출</button>
							  <button type="button" class="btn btn-default" onclick="location.href='/master/month';">연매출</button>
						</div>
						<div id="search_div">
							<select name="division" class="search_qna" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="서비스" <c:if test='${paramInfo.division eq "서비스"}'> selected="selected"</c:if>>서비스</option>
								<option value="제품"   <c:if test='${paramInfo.division eq "제품"}'> selected="selected"</c:if>>제품</option>
							</select>
							<select name="qnalist" class="search_qna" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="name" <c:if test='${paramInfo.qnalist eq "name"}'> selected="selected"</c:if>>고객명</option>
								<option value="customernum" <c:if test='${paramInfo.qnalist eq "customernum"}'> selected="selected"</c:if>>고객no</option>
							</select>
							<input type="text" id="search" name="search" size="30" class="search_qna" value="${paramInfo.search}">
							<button type="submit" class="search_qna">검색</button>
						</div>
					</form>
					<div id="search_div">
						<input type="text" id="start" name="start" size="15" class="search_qna">
						<input type="text" id="end" name="end" size="15" class="search_qna">
						<button type="button" class="search_qna" onclick="down()">다운로드</button>
					</div>
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th>총No</th>
								<th>고객No</th>
								<th><i class="icon_calendar"></i> 고객명</th>
								<th><i class="icon_calendar"></i> 날짜</th>
								<th><i class="icon_calendar"></i> 구분</th>
								<th><i class="icon_calendar"></i> 제품명</th>
								<th><i class="icon_mail_alt"></i> 카드</th>
								<th><i class="icon_mail_alt"></i> 현금</th>
								<th><i class="icon_mail_alt"></i> 소셜</th>
								<th><i class="icon_mail_alt"></i> 쿠폰</th>
								<th><i class="icon_mail_alt"></i> 합계</th>
								<th><i class="icon_mail_alt"></i> 비고</th>
							</tr>
	
							<c:forEach var="sale" items="${salesList}">
								<tr style="cursor:pointer;">
									<td>${sale.num}</td>
									<td>${sale.customernum}</td>
									<td>${sale.name}</td>
									<td>${sale.date}</td>
									<td>${sale.division}</td>
									<td>${sale.service}</td>
									<td>${sale.card}</td>
									<td>${sale.cash}</td>
									<td>${sale.social}</td>
									<td>${sale.coupon}</td>
									<td>${sale.card+sale.cash+sale.coupon}</td>
									<td><a data-toggle="tooltip" title="${sale.memo}">비고</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</section>
				
				<div>
					
					<nav>
						<ul class="pagination">

							<li>
								<c:if test="${paramInfo.PaginationNum ne  '1'}">
									<a href="javascript:pagination(${paramInfo.PaginationNum-1});" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</c:if>
							</li>

							<c:forEach var="idx" begin="${paramInfo.startPage}" end="${paramInfo.endPage}">
								<c:choose>
									<c:when test="${idx == paramInfo.PaginationNum}">
										<li class="active"><a
											href='javascript:pagination(${idx});'>${idx}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href='javascript:pagination(${idx});'>${idx}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<li>
								<c:if test="${paramInfo.PaginationNum ne  paramInfo.paginationTotal}">
									<a href="javascript:pagination(${paramInfo.PaginationNum+1});" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
								</c:if>
							</li>

						</ul>
					</nav>
				</div>
			</div>
		</div>
		<hr>
	</section>
</section>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script>
//datepicker
$('#start,#end').daterangepicker(singleoption);

$("#customerTable > tr > td:eq(11)").tooltip();

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

function down(){
	location.href="/master/down?start="+$('#start').val()+"&end="+$('#end').val()+"&fno=${paramInfo.fno}";
}
</script>