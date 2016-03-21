<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<!--main content start-->
<section id="main-content">
	<section class="wrapper">


		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> QnA
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>문의사항 리스트</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form action="/qna/main" method="post">
						<input type="hidden" id="qna" value="${paramInfo.qnalist}">
						<input type="hidden" id="sch" value="${paramInfo.search}">
						
						<div id="search_div" >
							<select name="qnalist" class="search_qna" style="width: 100px;" required="required">
								<option value="">선택하세요</option>
								<option value="name">이름</option>
								<option value="division">문의처</option>
							</select>
							<input type="text" id="search" name="search" size="30" class="search_qna" required="required">
							<button type="submit" class="search_qna">검색</button>
						</div>
					</form>
					
					<table class="table table-advance">
						<tbody>
							<tr>
								<th>#</th>
								<th><i class="icon_pin_alt"></i>이름</th>
								<th><i class="icon_calendar"></i>연락처</th>
								<th><i class="icon_calendar"></i>이메일</th>
								<th><i class="icon_calendar"></i>문의종류</th>
								<th><i class="icon_calendar"></i>문의처</th>
								<th><i class="icon_calendar"></i>등록일</th>
								<th><i class="icon_calendar"></i>상세보기</th>
								<th><i class="icon_calendar"></i>삭제</th>
							</tr>

							<c:forEach var="qna" items="${qnaList}">
								<tr <c:if test="${qna.openyn eq 'y'}">style="background-color:#e5f6ff;"</c:if>>
									<td>${qna.num}</td>
									<td>${qna.name}</td>
									<td>${qna.tel}</td>
									<td>${qna.email}</td>
									<td>${qna.qnalist}</td>
									<td>${qna.division}</td>
									<td>${qna.regDate}</td>
									<td><a href="/qna/detail/${qna.num}">상세보기</a></td>
									<td>
										<div class="btn-group">
											<a class="btn btn-danger" href="javascript:del(${qna.num});"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
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

							<li><c:if
									test="${paramInfo.PaginationNum ne  paramInfo.paginationTotal}">
									<a href="javascript:pagination(${paramInfo.PaginationNum+1});"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
								</c:if></li>

						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- page end-->

	</section>
</section>
<!--main content end-->

<script>
	function del(no) {
		var letitgo = confirm('삭제하시겠습니까?');

		if (letitgo) {
			window.location = '/qna/delete/' + no;
		}
	}

	function pagination(idx) {
		var $form = $('<form></form>');
		$form.attr('action', '/qna/main');
	    $form.attr('method', 'post');
	    $form.appendTo('body');
	    
	    var qna = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
	    var sch = $('<input type="hidden" name="search" value="${paramInfo.search}">');
	    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
	    $form.append(qna).append(sch).append(PaginationNum);
	    $form.submit();
	}
</script>


