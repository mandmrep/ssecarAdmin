<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">


		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>EVENT
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>이벤트 내용수정</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">

					<div class="panel-body">
						<form id="eventform" action="/event/eventUpdate" method="post" enctype="multipart/form-data">
							<input type="hidden" id="no" name="no" value="${event.no}">
							<input type="hidden" id="thumbnail" name="thumbnail" value="${event.thumbnail}"> 
							
							<div class="form-group">
								<label for="title">제목</label><br>
								<input id="title" name="title" class="form-control" value="${event.title}" maxlength="100"/>
							</div>
							
							<div class="form-group">
								<label for="title">부제목</label><br>
								<input type="text" id="subtitle" name="subtitle" class="form-control" value="${event.subtitle}" maxlength="100"/><br>
							</div>
							
							<div class="form-group">
								<label for="date">기간</label><br>
								<input type="text" id="date" name="date" class="form-control" readonly="readonly"/><br> 
							</div>
							
							<div class="form-group">
								<label for="content">내용</label><br>
								<textarea name="content" id="content" rows="10" cols="100" style="width: 1200px; height: 300px;">${event.content}</textarea>
							</div>
							
							<div class="form-group">
								<label for="thumbnail">썸네일 업로드</label> 
								<input type="file" id="file" name="file">
								<p class="help-block">섬네일 이미지는 필수로 업로드</p>
							</div>
							<br>
							<input type="button" id="saveButton" class="btn btn-lg btn-primary" value="저장" /> 
							<input type="button" id="cancelButton" class="btn btn-lg btn-danger" onclick="javascript:history.back()" value="취소" />
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
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fileinput.min.js" charset="utf-8"></script>
<script>
	$(function() {
		
		$('#date').daterangepicker({
				showDropdowns: true,
				locale : {
					format : 'YYYY-MM-DD',
					daysOfWeek :["일","월","화","수","목","금","토"],
					monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월 ","10월","11월","12월"]				           
				},
			startDate : '${event.startDate}',
			endDate : '${event.endDate}'
		});
		
		var obj = [];

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
			
			if ($('subtitle').val() == '' || $('#subtitle').val() == null) {
				alert('부제목을 작성 해주세요.');
				return false;
			}

			if ($('#date').val() == '' || $('#date').val() == null) {
				alert('일정을 선택 해주세요.');
				return false;
			}

			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#eventform").submit();
		});
	});
</script>