<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>NEWS
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>보도자료 수정</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
					
						<form id="newsform" action="/news/updateAction" method="post" enctype="multipart/form-data">
							<input type="hidden" id="num" name="num" value="${news.num}">
							<input type="hidden" id="thumbnail" name="thumbnail" value="${news.thumbnail}">
						
							<div class="form-group">
								<label for="title">제목</label> 
								<input type="text" class="form-control" id="title" name="title" value="${news.title}" placeholder="제목을 입력하세요." maxlength="100">
							</div>
							<div class="form-group">
								<label for="title">부제목</label> 
								<input type="text" class="form-control" id="subtitle" name="subtitle" value="${news.subtitle}" placeholder="제목을 입력하세요." maxlength="100">
							</div>
							<div class="form-group">
								<label for="link">내용</label> 
								<textarea id="content" name="content" style="width: 1200px; height: 300px;" placeholder="링크를 넣어주세요." required>${news.content}</textarea>
							</div>
							
							<div class="form-group">
								<label for="thumbnail">썸네일 업로드</label> <input type="file" id="file" name="file">
								<p class="help-block">섬네일 이미지는 필수로 업로드</p>
							</div>
							
							<input type="button" id="saveButton" class="btn btn-lg btn-primary" value="저장" />
							<input type="button" id="cancelButton" class="btn btn-lg btn-danger" value="취소"/>
						</form>

					</div>
				</section>
			</div>
		</div>
		<!-- page end-->

	</section>
</section>
<!--main content end-->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath}/resources/css/fileinput.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fileinput.min.js" charset="utf-8"></script>
<script>
$(function() {
	var obj = [];

	//samrteditor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : obj,
		elPlaceHolder : "content",
		sSkinURI : "/resources/editor/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true,
			bUseVerticalResizer : true,
			bUseModeChanger : true
		}
	});

	$('#saveButton').click(function() {

		if ($('#title').val() == '' || $('#title').val() == null) {
			alert('제목을 작성 해주세요.');
			return false;
		}

		var upload = document.getElementById('file').value;
		if (upload == '') {
			alert('섬네일 업로드 해주세요.');
			return false;
		}

		obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#newsform").submit();
	});

	$('#cancelButton').click(function() {
		window.history.back();
	});

});
</script>