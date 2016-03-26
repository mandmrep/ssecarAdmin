<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
					<li><i class="fa fa-home"></i>공지사항 수정</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel">
					<form id="noticeform" method="post" action="/admin/modify">
						<input type="hidden" name="no" value="${notice.no}"> <label
							for="title">제목</label><br> <input id="title" name="title"
							value="${notice.title}"
							style="border: 1px solid; height: 30px; margin-bottom: 10px; width: 1200px;"
							required /><br> <label for="content">내용</label><br>
						<textarea name="content" id="content" rows="10" cols="100"
							style="width: 1200px; height: 300px;">${notice.content}</textarea>
						<input type="button" id="saveButton" class="btn btn-lg btn-primary" value="제출" />
						<input type="button" id="" class="btn btn-lg btn-danger" onclick="javascript:history.back()" value="취소" />
					</form>
				</div>
			</div>
		</div>
	</section>
</section>
<!--main content end-->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
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
			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#noticeform").submit();
		});
	});
</script>

