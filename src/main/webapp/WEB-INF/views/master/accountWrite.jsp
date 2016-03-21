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
					<li><i class="fa fa-home"></i>계정등록</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-left">작성 폼</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="padd">
								<div class="form quick-post">
									<form class="form-horizontal" action="/master/accountWriteAction" method="post" onsubmit="return formCheck()">

										<div class="form-group">
											<label class="control-label col-lg-2">ID</label>
											<div class="col-lg-9">
												<input type="hidden" id="check" name="check">
												<input type="text" id="username" name="username" class="form-control" maxlength="30" required="required" onkeyup="deleteDupl()">
											</div>
											<div class="col-lg-1">
												<button type="button" class="btn btn-primary" onclick="idDuplication()">중복검사</button>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">PASSWORD</label>
											<div class="col-lg-10">
												<input type="password" class="form-control" id="password" name="password" maxlength="30" required="required">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">PASSWORD확인</label>
											<div class="col-lg-10">
												<input type="password" id="re" name="re" class="form-control" maxlength="30" required="required">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">사용권한</label>
											<div class="col-lg-10">
												<select id="role" name="role" class="form-control" required="required" onchange="checkAuth(this.value)">
													<option value="">선택하세요</option>
													<option value="ROLE_ADMIN">MASTER</option>
													<option value="ROLE_SSECARS">쌔카에스 가맹</option>
													<option value="ROLE_MOBIL">M8 제휴</option>
													<option value="ROLE_SSECAR">쌔카 직영</option>
													<option value="ROLE_SSECAR_ALLIANCE">쌔카 제휴</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">매장코드</label>
											<div class="col-lg-10">
												<input type="hidden" id="fno" name="fno">
												<input type="text" id="temp" name="temp" class="form-control" data-toggle="modal" data-target="#myModal" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">사용자</label>
											<div class="col-lg-10">
												<input type="text" id="name" name="name" class="form-control" maxlength="40" required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">연락처</label>
											<div class="col-lg-10">
												<input type="text" id="tel" name="tel" pattern='[0-9]{9,11}' class="form-control">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">비고</label>
											<div class="col-lg-10">
												<input type="text" id="memo" name="memo" class="form-control" maxlength="100">
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-9">
												<button type="submit" class="btn btn-primary">등록</button>
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
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">매장코드등록</h4>
      </div>
      <div class="modal-body">
      <form id="vehicleForm" class="form-horizontal">
      
      	<div class="form-group">
			<label class="control-label col-lg-2" for="tags">지역</label>
			<div class="col-lg-10">
				<select id="menu_1" class="form-control" onchange="getfranchise(this.value)">
		      		<option value="">선택하세요</option>
		        	<c:forEach var="result" items="${areas}">
						<option value="${result.area}">${result.area}</option>
					</c:forEach>
        		</select>
			</div>
		</div>
      	
      	<div class="form-group">
			<label class="control-label col-lg-2" for="tags">지점</label>
			<div class="col-lg-10">
				<select id="menu_2" class="form-control"></select>
			</div>
		</div>
        
      </form>
        
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="call()" class="btn btn-default">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<script>
	
	function getfranchise(area){
		$('#menu_2').html('');
		$.ajax({
			url:'/master/getfranchise',
			data:{ 'area' : area },
			type: "post",
			dataType :'json',
			success:function(data){
				$.each(data, function( index, value ) {
					$('#menu_2').append($('<option/>', { value: value.fno , text : value.name }) );
				});
			},error:function(){
				
			}	
		});
	}
	
	function call(){
		var value = $('#menu_2').val();
		var name = $('#menu_2 option:selected').text();
		
		$('#fno').val(value);
		$('#temp').val(name);
		
		$('#myModal').modal('hide');
	}
	
	function idDuplication(){
		var username = $('#username').val();
		
		if(username == null || username ==''){
			alert('ID를 입력해주세요');
			$('#check').val('');
			return false;
		}
		
		$.ajax({
			url:'/master/idDuplication',
			data:{ 
				'id' : username
			},
			type: 'post',
			dataType :'text',
			success:function(data){
				if(data == 'ok'){
					alert('사용할수 있는 ID입니다.');
					$('#check').val(data);
				}else{
					alert('이미 존재하는 ID입니다.');
					$('#check').val('');
				}
			},error:function(){
				
			}
		});
	}
	
	function formCheck(){
		var password = $('#password').val();
		var re = $('#re').val();
		var check = $('#check').val();
		var fno = $('#fno').val();
		
		if(check != 'ok'){
			alert('ID중복검사를 해주세요.');
			return false;	
		}
		
		if(password != re){
			alert('비밀번호가 일치하지 않습니다.');
			$('#password').focus();
			return false;	
		}
		
		if(fno==null ||fno==''){
			alert('매장코드를 입력해주세요.');
			$('#temp').focus();
			return false;
		}
	}
	 
	function checkAuth(value){
		if(value=='ROLE_ADMIN'){
			$('#fno').val(0);
			$('#temp').val('마스터');
		}else{
			$('#fno').val('');
			$('#temp').val('');
		}
	}
	
	function deleteDupl(){
		$('#check').val('');
	}
</script>