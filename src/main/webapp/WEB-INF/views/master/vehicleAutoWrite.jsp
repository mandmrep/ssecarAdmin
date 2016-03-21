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
							<div class="pull-left">차량등록</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="padd">
								<div class="form quick-post">
									<form class="form-horizontal" action="/master/vehicleAutoWriteAction" method="post" onsubmit="return check()">
										<input type="hidden" id="checking" name="checking">
										<div class="form-group">
											<label class="control-label col-lg-2">제조사 선택</label>
											<div class="col-lg-10">
												<select id="manufacturer" name="manufacturer" class="form-control" required="required">
													<option value="">선택하세요</option>
													<c:forEach var="manufacturer" items="${manufacturerList}">
														<option value="${manufacturer.num}">${manufacturer.brand}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">차량명</label>
											<div class="col-lg-9">
												<input type="text" id="name" name="name" class="form-control" maxlength="30" required="required">
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
	var name = $('#name').val();
	
	if(name ==null || name==''){
		alert('차량명을 입력해주세요.');
		return false;
	}
	
	$.ajax({
		url:'/master/autoDuplication',
		data:{ 
			'name' : name
		},
		type: 'post',
		dataType :'text',
		success:function(data){
				if(data != 0){
					alert('이미 존재하는 차량입니다.');
				}else{
					alert('사용할수 있는 차량이름입니다.');
					$('#checking').val('ok');
				}
		},error:function(){
			
		}
	});
}

$( "#name" ).keyup(function() {
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