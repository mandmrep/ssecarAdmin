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
					<i class="fa fa-laptop"></i> 관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>예약관리</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form action="/management/reservation" method="post">
						<div id="search_div" >
							<select name="qnalist" class="search_qna" style="width: 100px;" required="required">
								<option value="">선택하세요</option>
								<option value="name">고객명</option>
							</select>
							<input type="text" id="search" name="search" size="30" class="search_qna" required="required">
							<button type="submit" class="search_qna">검색</button>
						</div>
					</form>
					
					<table class="table table-advance">
						<tbody>
							<tr>
								<th>#</th>
								<th><i class="icon_calendar"></i> 예약일</th>
								<th><i class="icon_calendar"></i> 예약시간</th>
								<th><i class="icon_profile"></i> 고객명</th>
								<th><i class="icon_mobile"></i> 전화번호</th>
								<th><i class="icon_pin_alt"></i> 차종</th>
								<th><i class="icon_pin_alt"></i>서비스명</th>
								<th><i class="icon_pin_alt"></i> 비고</th>
								<th><i class="icon_cogs"></i> 수정/삭제</th>
							</tr>

							<c:forEach var="reservation" items="${reservationList}">
								<tr <c:if test="${reservation.openyn eq 'y'}">style="background-color:#e5f6ff;"</c:if>>
									<td>${reservation.num}</td>
									<td>${reservation.date}</td>
									<td>${reservation.start}</td>
									<td>${reservation.name}</td>
									<td>${reservation.tel}</td>
									<td>${reservation.vehicle}</td>
									<td>${reservation.service}</td>
									<td><a href="#" data-toggle="tooltip" title="${reservation.memo}">비고</a></td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="javascript:update(${reservation.num});"><i class="icon_plus_alt2"></i></a> 
											<a class="btn btn-danger" href="javascript:del(${reservation.num});"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<table id="list"></table>
					<div id="pager"></div>
				</section>
				
				<div>
					<a class="btn btn-danger btn-lg" href="/management/reserveform" style="float: right; margin-top: -15px;">등록</a>
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
		
	</section>
</section>
<script>
$("#customerTable > tr > td:eq(7)").tooltip();

function del(idx){
	var letitgo = confirm('삭제하시겠습니까?')
	if(letitgo){
		var $form = $('<form></form>');
		$form.attr('action', '/management/reservationdelete');
	    $form.attr('method', 'post');
	    $form.appendTo('body');
	    
	    var idx = $('<input type="hidden" name="idx" value="'+idx+'">');
	    $form.append(idx);
	    $form.submit();
	
	}
}

function update(idx){
	var $form = $('<form></form>');
	$form.attr('action', '/management/reservationupdateform');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var idx = $('<input type="hidden" name="idx" value="'+idx+'">');
    $form.append(idx);
    $form.submit();
}

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/management/reservation');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var qnalist = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(qnalist).append(search);
    $form.submit();
}
</script>