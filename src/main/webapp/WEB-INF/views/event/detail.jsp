<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>EVENT
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>이벤트 상세보기</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-heading">${event.no}. ${event.title }</div>
					<div class="panel-body">
						<%
							pageContext.setAttribute("LF", "\n");
						%>
						${ fn:replace(event.content,LF,'<br>') }

					</div>
					<div class="panel-footer" style="text-align: right;">
						<button class="btn btn-lg btn-primary"
							onclick="noticeModify('${event.no}')">수정</button>
						<button class="btn btn-lg btn-primary"
							onclick="noticeDelete('${event.no}')">삭제</button>
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
		var letitgo = confirm('삭제하시겠습니까?');

		if (letitgo) {
			window.location = '/event/delete/' + no;
		}
	}
	function noticeModify(no) {
		window.location = '/event/updateForm/' + no;
	}
	function pagination(idx) {
		window.location = '/event/event?PaginationNum=' + idx; //GET방식 한글 파라미터 넘기기 인코딩
	}
</script>