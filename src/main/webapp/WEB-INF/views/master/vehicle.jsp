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
							<div class="pull-left">차종리스트</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="padd">
								<div class="form quick-post">
									<form class="form-horizontal" action="/master/accountWriteAction" method="post">

										<div class="form-group">
											<div class="col-lg-6">
												<button type="button" class="btn btn-primary form-control" onclick="manuWrite()">제조사등록</button> 
											</div>
											<div class="col-lg-6">
												<button type="button" class="btn btn-primary form-control" onclick="autoWrite()">차량등록</button>
											</div>
										</div>

										<div class="form-group">
											<div class="col-lg-6">
												<select id="manufacture" name="manufacture" class="form-control" onchange="getAutomobile(this.value)">
													<option value="">선택하세요</option>
													<c:forEach var="manufacturer" items="${manufacturerList}">
														<option value="${manufacturer.num}">${manufacturer.brand}</option>
													</c:forEach>
												</select>
											</div>
											
											<div class="col-lg-6">
												<select id="automobile" name="automobile" class="form-control">
													<option value="">선택하세요</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<div class="col-lg-6">
												<button type="button" class="btn btn-danger form-control" onclick="manuDelete()">제조사삭제</button> 
											</div>
											<div class="col-lg-6">
												<button type="button" class="btn btn-danger form-control" onclick="autoDelete()">차량삭제</button>
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

function getAutomobile(num){
	$('#automobile').html('');
	$.ajax({
		url:'/master/getautomobile',
		data:{ 'num' : num },
		type: "post",
		dataType :'json',
		success:function(data){
			$.each(data, function( index, value ) {
				$('#automobile').append($('<option/>', { value: value.num , text : value.name }) );
			});
		},error:function(){
			
		}	
	});
}

function manuDelete(){
	var manu = $('#manufacture').val();
	var automobile = $('#automobile option').size();
	
	if(manu==null || manu ==''){
		alert('제조사를 선택해주세요.');
		return false;
	}
	
	if(automobile != 0 ){
		alert('하위차량이 있어 삭제할 수 없습니다.');
		return false;
	}
	
	var letitgo = confirm('삭제하시겠습니까?');
	
	if(letitgo){
		window.location = "/master/manuDelete/"+manu;	
	}
}

function autoDelete(){
	var auto = $('#automobile').val();
	
	if(auto==null || auto ==''){
		alert('차량을 선택해주세요.');
		return false;
	}
	
	var letitgo = confirm('삭제하시겠습니까?');
	
	if(letitgo){
		window.location = "/master/autoDelete/"+auto;
	}
}

function manuWrite(){
	window.location = '/master/vehicleManuWrite';
}

function autoWrite(){
	window.location = '/master/vehicleAutoWrite/';
}
</script>