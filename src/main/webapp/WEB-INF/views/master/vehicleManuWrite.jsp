<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>master 메뉴
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>차종관리</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				
				<section class="panel">
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-left">제조사등록</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="padd">
								<div class="form quick-post">
									<form class="form-horizontal" action="/master/vehicleManuWriteAction" method="post" onsubmit="return check()">
										<input type="hidden" id="checking" name="checking">
										<div class="form-group">
											<label class="control-label col-lg-2">제조사명</label>
											<div class="col-lg-9">
												<input type="text" class="form-control" id="manufacturer" name="manufacturer" maxlength="30" required="required">
											</div>
											<div class="col-lg-1">
												<button type="button" class="btn btn-default form-control" onclick="duplication()">중복검사</button>
											</div>
										</div>

										<div class="form-group">
											<div class="col-lg-6">
												<button type="submit" class="btn btn-primary form-control">등록</button>
											</div>
											<div class="col-lg-6">
												<button type="button" class="btn btn-danger form-control" onclick="history.back();">취소</button>
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
	function duplication(){
		var manufacturer = $('#manufacturer').val();
		
		if(manufacturer ==null || manufacturer==''){
			alert('제조사를 입력해주세요.');
			return false;
		}
		
		$.ajax({
			url:'/master/manuDuplication',
			data:{ 
				'manufacturer' : manufacturer
			},
			type: 'post',
			dataType :'text',
			success:function(data){
					if(data != 0){
						alert('이미 존재하는 제조사입니다.');
					}else{
						alert('사용할수 있는 제조사이름입니다.');
						$('#checking').val('ok');
					}
			},error:function(){
				
			}
		});
	}
	
	$( "#manufacturer" ).keyup(function() {
		$('#checking').val('');
	});


	function check(){
		var checking = $('#checking').val();
		
		if(checking != 'ok'){
			alert('중복검사를 해주세요.');
			return false;
		}
	}
</script>