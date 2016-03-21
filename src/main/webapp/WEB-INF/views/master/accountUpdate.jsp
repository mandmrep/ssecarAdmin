<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>MASTER메뉴
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>계정정보 수정</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-left">수정 폼</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="padd">
								<div class="form quick-post">
									<form class="form-horizontal" action="/master/accountUpdateAction" method="post" onsubmit="return formCheck()">
										<input type="hidden" id="num" name="num" value="${account.num}">
										<div class="form-group">
											<label class="control-label col-lg-2">ID</label>
											<div class="col-lg-10">
												<input type="text" id="username" name="username" class="form-control" maxlength="30" value="${account.username}" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">PASSWORD</label>
											<div class="col-lg-10">
												<input type="password" class="form-control" id="password" name="password" value="${account.password}" maxlength="30" required="required">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">PASSWORD확인</label>
											<div class="col-lg-10">
												<input type="password" id="re" name="re" class="form-control" value="${account.password}" maxlength="30" required="required">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">매장코드</label>
											<div class="col-lg-10">
												<input type="number" id="fno" name="fno" class="form-control" value="${account.fno}" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">사용권한</label>
											<div class="col-lg-10">
												<input type="text" id="role" name="role" class="form-control" value="${account.role}" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">사용자</label>
											<div class="col-lg-10">
												<input type="text" id="name" name="name" class="form-control" value="${account.name}" maxlength="30" required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">연락처</label>
											<div class="col-lg-10">
												<input type="number" id="tel" name="tel" class="form-control" value="${account.tel}">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">비고</label>
											<div class="col-lg-10">
												<input type="text" id="memo" name="memo" class="form-control" maxlength="100" value="${account.memo}">
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-9">
												<button type="submit" class="btn btn-primary">수정</button>
												<button type="button" class="btn btn-danger" onclick="javascript:history.back();">취소</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>
<script>
	function formCheck(){
		var password = $('#password').val();
		var re = $('#re').val();
		var check = $('#check').val();
		
		if(password != re){
			alert('비밀번호가 일치하지 않습니다.');
			$('#password').focus();
			return false;	
		}
	}
</script>