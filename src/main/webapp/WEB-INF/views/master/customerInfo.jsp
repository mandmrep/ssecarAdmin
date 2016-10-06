<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
strong{
	padding-right: 30px;
}
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>관리 시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>고객 상세내용</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-heading" style="text-align: right;">작성일:${clientDetail.regdate}</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-3">
								<p><strong>고객번호</strong>${clientDetail.num}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>고객명</strong>${clientDetail.name}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>차종</strong>${clientDetail.vehicle}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>차량번호</strong>${clientDetail.carnumber}</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3">
								<p><strong>등록일</strong>${clientDetail.birthday}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>연락처</strong>${clientDetail.tel}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>색상</strong>${clientDetail.color}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>방문동기</strong>${clientDetail.motivation}</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12">
								<p><strong>등록지점</strong><br>${clientDetail.store}</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12">
								<p><strong>관리자메모</strong><br>${clientDetail.memo}</p>
							</div>
						</div>
						
						

					</div>
					<div class="panel-footer" style="text-align: right;">
						<form id="reform" action="/master/reserveform" method="post">
							<input type="hidden" name="num" value="${clientDetail.num}"/>
							<input type="hidden" name="name" value="${clientDetail.name}"/>
							<input type="hidden" name="fno" value="${clientDetail.fno}"/>
							<input type="hidden" name="tel" value="${clientDetail.tel}"/>
						</form>
						<a class="btn btn-lg btn-danger" href="javascript:goReserve();">예약</a>
						<a class="btn btn-lg btn-primary" href="javascript:history.back();">목록</a>
					</div>
				</section>

			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
						<table id="clientTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th>예약No</th>
									<th><i class="icon_calendar"></i> 방문일자</th>
									<th><i class="icon_calendar"></i> 서비스/제품명</th>
									<th><i class="icon_calendar"></i> 방문지점</th>
									<th><i class="icon_profile"></i> 카드</th>
									<th><i class="icon_mobile"></i> 현금</th>
									<th><i class="icon_mobile"></i>온라인</th>
									<th><i class="icon_mobile"></i>소셜</th>
									<th><i class="icon_mobile"></i>쿠폰</th>
									<th><i class="icon_pin_alt"></i>합계</th>
									<th><i class="icon_pin_alt"></i>비고</th>
								</tr>

								<c:forEach var="clientSale" items="${clientSales}">
									<tr>
										<td>${clientSale.num}</td>
										<td>${clientSale.date}</td>
										<td>${clientSale.name}</td>
										<td>${clientSale.fname}</td>
										<td>${clientSale.card}</td>
										<td>${clientSale.cash}</td>
										<td>${clientSale.online}</td>
										<td>${clientSale.social}</td>
										<td>${clientSale.coupon}</td>
										<td>${clientSale.total}</td>
										<td><a href="#" data-toggle="tooltip" title="${clientSale.memo}">비고</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
				<div>
					<nav>
						<ul class="pagination">

							<li><c:if test="${paramInfo.PaginationNum ne  '1'}">
									<a href="javascript:pagination(${paramInfo.PaginationNum-1});"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
								</c:if></li>

							<c:forEach var="idx" begin="${paramInfo.startPage}"
								end="${paramInfo.endPage}">
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

							<li><c:if test="${paramInfo.PaginationNum ne  paramInfo.paginationTotal}">
									<a href="javascript:pagination(${paramInfo.PaginationNum+1});" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
								</c:if></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
$("#clientTable > tr > td:eq(8)").tooltip();

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/management/client/${clientDetail.num}');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum);
    $form.submit();
}

function goReserve(){
	$('#reform').submit();
	//GET방식 한글 파라미터 넘기기 인코딩	/master/reserveform?name='+encodeURI(name, 'UTF-8')
}
</script>