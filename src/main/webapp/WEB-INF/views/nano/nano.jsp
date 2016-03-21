<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>Nano-Quartz Serial Register
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>나노 쿼츠 리스트</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<section class="panel">

					<div class="panel-body">
						<form action="/nano/main" method="post">
							<div id="search_div" >
								<select name="qnalist" class="search_qna" style="width: 100px;" required="required">
									<option value="">선택하세요</option>
									<option value="num">고객No</option>
									<option value="number">차량번호</option>
									<option value="serialnumber">시리얼넘버</option>
									<option value="customer">고객명</option>
								</select>
								<input type="text" id="search" name="search" size="30" class="search_qna" required="required">
								<button type="submit" class="search_qna">검색</button>
							</div>
						</form>
						
						<table id="nanoTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th>#</th>
									<th><i class="icon_pin_alt"></i> 시리얼넘버</th>
									<th><i class="icon_calendar"></i> 시공일</th>
									<th><i class="icon_calendar"></i> 시공점</th>
									<th><i class="icon_mail_alt"></i> 고객명</th>
									<th><i class="icon_mail_alt"></i> 전화번호</th>
									<th><i class="icon_mail_alt"></i> 차종</th>
									<th><i class="icon_mail_alt"></i>색상</th>
									<th><i class="icon_mail_alt"></i> 차량번호</th>
									<th><i class="icon_mobile"></i> 비고</th>
									<sec:authorize access="hasAnyAuthority('ROLE_SSECARS','ROLE_SSECAR','ROLE_MOBIL')">									
									<th><i class="icon_cogs"></i> 수정/삭제</th>
									</sec:authorize>
								</tr>
								
								<c:forEach var="nano" items="${nanoList}">
									<tr>
										<td>${nano.num}</td>
										<td>${nano.serialnumber}</td>
										<td>${nano.date}</td>
										<td>${nano.store}</td>
										<td>${nano.customer}</td>
										<td>${nano.tel}</td>
										<td>${nano.car}</td>
										<td>${nano.color}</td>
										<td>${nano.number}</td>
										<td><a href="#" data-toggle="tooltip" title="${nano.memo}">비고</a></td>
										
										<sec:authorize access="hasAnyAuthority('ROLE_SSECARS','ROLE_SSECAR','ROLE_MOBIL')">
										<td>
											<div class="btn-group">
												<a class="btn btn-primary" href="/nano/updateForm/${nano.num}"><i class="icon_plus_alt2"></i></a> 
												<a class="btn btn-danger" href="javascript:del(${nano.num});"><i class="icon_close_alt2"></i></a>
											</div>
										</td>
										</sec:authorize>
										
									</tr>
								</c:forEach>

							</tbody>
						</table>


					</div>
				</section>
				<div>
				
				<sec:authorize access="hasAnyAuthority('ROLE_SSECARS','ROLE_SSECAR','ROLE_MOBIL')">
					<a class="btn btn-danger btn-lg" href="/nano/registForm" style="float: right; margin-top: -15px;">등록</a>
				</sec:authorize>	
				
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
<!--main content end-->
	
<script>
$("#nanoTable > tr > td:eq(9)").tooltip();

function del(no) {
	var letitgo = confirm('삭제하시겠습니까?');

	if (letitgo) {
		window.location = '/nano/delete/' + no;
	}
}

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/nano/main');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var qnalist = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(qnalist).append(search);
    $form.submit();
}
</script>