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
					<li><i class="fa fa-home"></i>고객관리</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form action="/master/customerDetail" method="post">
						<%-- <input type="hidden" name="fno" value="${ paramInfo.fno }"> --%>
						<div id="search_div" >
							<select name="fno" class="search_qna" style="width: 300px;">
								<option value="">선택하세요.</option>
								<c:forEach var="f" items="${franchiseList}">
									<c:if test="${param.fno eq f.fno}"><option value="${f.fno}" selected="selected">${f.name}</option></c:if>
									<c:if test="${param.fno ne f.fno}"><option value="${f.fno}">${f.name}</option></c:if>
								</c:forEach>
							</select>
							<select name="qnalist" class="search_qna" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="name" <c:if test="${param.qnalist eq 'name'}">selected="selected"</c:if>>고객명</option>
								<option value="num" <c:if test="${param.qnalist eq 'num'}">selected="selected"</c:if>>고객No</option>
								<option value="carnumber" <c:if test="${param.qnalist eq 'carnumber'}">selected="selected"</c:if>>차량번호</option>
								<option value="tel" <c:if test="${param.qnalist eq 'tel'}">selected="selected"</c:if>>연락처</option>
							</select>
							<input type="text" id="search" name="search" size="30" class="search_qna" value="${param.search}">
							<button type="submit" class="search_qna">검색</button>
						</div>
					</form>
					
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th>고객No</th>
								<th><i class="icon_calendar"></i>고객명</th>
								<th><i class="icon_calendar"></i>생일</th>
								<th><i class="icon_profile"></i>지점명</th>
								<th><i class="icon_mobile"></i>연락처</th>
								<th><i class="icon_pin_alt"></i>차종</th>
								<th><i class="icon_pin_alt"></i>차량번호</th>
								<th><i class="icon_pin_alt"></i>수정/삭제</th>
							</tr>

							<c:forEach var="client" items="${clientDetail}">
								<tr onclick="location.href='/master/customerInfo/${client.num}';" style="cursor:pointer;">
									<td>${client.num}</td>
									<td>${client.name}</td>
									<td>${client.birthday}</td>
									<td>${client.store}</td>
									<td>${client.tel}</td>
									<td>${client.vehicle}</td>
									<td>${client.carnumber}</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="/master/customerUpdate/${client.num}"><i class="icon_plus_alt2"></i></a> 
											<a class="btn btn-danger" href="javascript:del(${client.num});"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</section>
				
				<div>
					<a class="btn btn-danger btn-lg" href="/master/customerWrite" style="float: right; margin-top: -15px;">등록</a>
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
<script>
$("#customerTable > tr > td:eq(7)").tooltip();

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/master/customerDetail');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var fno = $('<input type="hidden" name="fno" value="${paramInfo.fno}">');
    var qnalist = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(qnalist).append(search).append(fno);
    $form.submit();
}

function del(idx){
	var letitgo = confirm('삭제하시겠습니까?')
	if(letitgo){
		window.location = '/master/customerDelete/'+idx;
	}
}
</script>