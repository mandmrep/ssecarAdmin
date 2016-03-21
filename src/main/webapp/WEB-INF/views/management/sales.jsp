<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>매출관리(서비스)</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				
				<section class="panel">

					<div class="panel-body">
						<form action="/management/sales" method="post">
							<div id="search_div">
								<select name="qnalist" class="search_qna" style="width: 100px;" required="required">
									<option value="">선택하세요</option>
									<option value="name">고객명</option>
								</select>
								<input type="text" id="search" name="search" size="30" class="search_qna" required="required">
								<button type="submit" class="search_qna">검색</button>
							</div>
						</form>
						<table id="salesTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th>#</th>
									<th><i class="icon_calendar"></i> 고객명</th>
									<th><i class="icon_calendar"></i> 날짜</th>
									<th><i class="icon_calendar"></i> 서비스명</th>
									<th><i class="icon_mail_alt"></i> 카드</th>
									<th><i class="icon_mail_alt"></i> 현금</th>
									<th><i class="icon_mail_alt"></i> 기타(소셜/쿠폰)</th>
									<th><i class="icon_mail_alt"></i>합계</th>
									<th><i class="icon_mail_alt"></i> 비고</th>
									<th><i class="icon_cogs"></i> 수정/삭제</th>
								</tr>

								<c:forEach var="sale" items="${sales}">
									<tr>
										<td>${sale.num}</td>
										<td>${sale.name}</td>
										<td>${sale.date}</td>
										<td>${sale.service}</td>
										<td>${sale.card}</td>
										<td>${sale.cash}</td>
										<td>${sale.etc}</td>
										<td>${sale.total}</td>
										<td><a href="#" data-toggle="tooltip" title="${sale.memo}">비고</a></td>
										<td>
											<div class="btn-group">
												<a class="btn btn-primary" href="/management/salesUpdate/${sale.num}"><i class="icon_plus_alt2"></i></a>
												<a class="btn btn-danger" href="javascript:del(${sale.num},'sales');"><i class="icon_close_alt2"></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>


					</div>
				</section>
				
				<div>
					<a class="btn btn-danger btn-lg" href="/management/saleswrite" style="float: right; margin-top: -15px;">등록</a>
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

$("#salesTable > tr > td:eq(7)").tooltip();

function del(idx,path){
	var letitgo = confirm('삭제하시겠습니까?');
	if(letitgo){
		window.location = '/management/salesDelete?num='+idx+'&path='+path;	
	}
}

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/management/sales');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var qnalist = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(qnalist).append(search);
    $form.submit();
}
</script>