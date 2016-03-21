<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header"><i class="fa fa-laptop"></i> NOTICE</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>공지사항</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form action="/notice/main" method="post">
						<div id="search_div" >
							<select name="qnalist" class="search_qna" style="width: 100px;" required="required">
								<option value="">선택하세요</option>
								<option value="title">제목</option>
							</select>
							<input type="text" id="search" name="search" size="30" class="search_qna" required="required">
							<button type="submit" class="search_qna">검색</button>
						</div>
					</form>
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th>#</th>
								<th><i class="icon_pin_alt"></i> 제목</th>
								<th><i class="icon_calendar"></i> 작성자</th>
								<th><i class="icon_calendar"></i> 작성일</th>
								<th><i class="icon_mail_alt"></i> 조회수</th>
							</tr>

							<c:forEach var="notice" items="${NoticeList}">
								<tr>
									<td>${notice.no}</td>
									<td><a href="/notice/detail/${notice.no}">${notice.title}</a></td>
									<td>${notice.writer}</td>
									<td>${notice.regDate}</td>
									<td>${notice.hits}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</section>

				<div>
					<button onclick="noticeWrite()" class="btn btn-lg btn-primary" style="float: right; margin-top: -15px;">등록</button>
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
	function noticeWrite() {
		window.location = '/notice/writeForm';
	}

	function pagination(idx) {
		var $form = $('<form></form>');
		$form.attr('action', '/notice/main');
	    $form.attr('method', 'post');
	    $form.appendTo('body');
	    
	    var qnalist = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
	    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
	    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
	    $form.append(PaginationNum).append(qnalist).append(search);
	    $form.submit();
	}
</script>

