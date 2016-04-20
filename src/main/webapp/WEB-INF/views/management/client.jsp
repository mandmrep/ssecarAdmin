<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.search_qna{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px;
	width: 100px;
}
#search_div{
	float: right;
}
.search_btn{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px;
}
</style>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>고객관리</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form action="/management/client" method="post">
						<div id="search_div" >
							<select id="division" name="division" class="search_qna" required="required">
								<option value="">검색구분</option>
								<option value="name" <c:if test="${param.division eq 'name'}">selected="selected"</c:if>>고객명</option>
								<option value="num" <c:if test="${param.division eq 'num'}">selected="selected"</c:if>>고객No</option>
								<option value="carnumber" <c:if test="${param.division eq 'carnumber'}">selected="selected"</c:if>>차량번호</option>
								<option value="tel" <c:if test="${param.division eq 'tel'}">selected="selected"</c:if>>연락처</option>
							</select>
							<input type="text" id="search" name="search" class="search_qna" style="width:200px;" value="${param.search}">
							<button type="submit" class="search_btn">검색</button>
						</div>
					</form>
					<div class="panel-body">
						<table id="clientTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th><i class="icon_pin_alt"></i> 고객No</th>
									<th><i class="icon_pin_alt"></i>방문No</th>
									<th><i class="icon_profile"></i> 고객명</th>
									<th><i class="icon_calendar"></i> 생일</th>
									<th><i class="icon_profile"></i> 지점명</th>
									<th><i class="icon_mobile"></i> 연락처</th>
									<th><i class="icon_pin_alt"></i> 차종</th>
									<th><i class="icon_pin_alt"></i>차량번호</th>
									<th><i class="icon_pin_alt"></i> 상세보기</th>
									<th><i class="icon_cogs"></i> 수정/삭제</th>
								</tr>

								<c:forEach var="client" items="${clients}">
									<tr>
										<td><fmt:parseNumber value="${client.ROWNUM}" integerOnly="true"/></td>
										<td>${client.cnt}</td>
										<td>${client.name}</td>
										<td>${client.birthday}</td>
										<td>${client.store}</td>
										<td>${client.tel}</td>
										<td>${client.vehicle}</td>
										<td>${client.carnumber}</td>
										<td><a href="/management/client/${client.num}">상세보기</a></td>
										
										<td>
											<div class="btn-group">
												<a class="btn btn-primary" href="/management/clientUpdate/${client.num}"><i class="icon_plus_alt2"></i></a> 
												<a class="btn btn-danger" href="javascript:del(${client.num});"><i class="icon_close_alt2"></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</section>
				
				<div>
					<a class="btn btn-danger btn-lg" href="/management/clientWrite" style="float: right; margin-top: -15px;">등록</a>
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
function del(idx){
	var letitgo = confirm('삭제하시겠습니까?')
	if(letitgo){
		window.location = '/management/clientDelete/'+idx;
	}
}

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/management/client');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var division = $('<input type="hidden" name="division" value="${paramInfo.division}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(division).append(search);
    $form.submit();
}
</script>