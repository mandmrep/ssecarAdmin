<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>QnA
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>문의사항 상세내용</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-heading" style="text-align: right;">작성일:${qna.regDate}</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-4">
								<p><strong>성명</strong><br>${qna.name}</p>
							</div>
							<div class="col-lg-4">
								<p>
									<strong>문의처</strong><br>
									${qna.division}
								</p>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-lg-4">
								<p>
									<strong>TEL</strong><br>${qna.tel}</p>
							</div>
							<div class="col-lg-4">
								<p>
									<strong>MAIL</strong><br>${qna.email}</p>
							</div>
						</div>
						<br>

						<%
							pageContext.setAttribute("LF", "\n");
						%>
						<p>
							<strong>문의사항</strong>
						</p>
						<p>${ fn:replace(qna.content,LF,'<br>') }</p>
						<br>
					</div>
					<div class="panel-footer" style="text-align: right;">
						<button class="btn btn-lg btn-primary" onclick="history.back();">목록</button>
					</div>
				</section>

			</div>
		</div>
	</section>
</section>
<!--main content end-->

<script>
	function noticeDelete(no) {
		window.location = '/notice/delete/' + no;
	}
	function noticeModify(no) {
		window.location = '/notice/modifyForm/' + no;
	}
	function pagination(idx) {
		window.location = '/notice/main?PaginationNum=' + idx; //GET방식 한글 파라미터 넘기기 인코딩
	}
</script>

