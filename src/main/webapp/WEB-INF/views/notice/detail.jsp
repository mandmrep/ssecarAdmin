<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>NOTICE
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>공지사항 상세내용</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-heading">${notice.no}. ${notice.title }</div>
					<div class="panel-body">
						<%
							pageContext.setAttribute("LF", "\n");
						%>
						${ fn:replace(notice.content,LF,'<br>') }
					</div>
					<div class="panel-footer" style="text-align: right;">
						<button class="btn btn-lg btn-primary"
							onclick="noticeModify('${notice.no}')">수정</button>
						<button class="btn btn-lg btn-primary"
							onclick="noticeDelete('${notice.no}')">삭제</button>
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