<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>고객등록</li>
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
									<form class="form-horizontal" action="/management/clientwriteAction" method="post" onsubmit="return fn_onsubmit()">

										<div class="form-group">
											<label class="control-label col-lg-2" for="title">지점명</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" value="${franchise.name}" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">고객명</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="name" name="name" maxlength="20" required="required">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">성별</label>
											<div class="col-lg-10">
												<div class="radio">
		                                              <label>
		                                                  <input type="radio" name="sex" id="optionsRadios1" value="남" checked>
		                                                  	남
		                                              </label>
		                                          </div>
		                                          <div class="radio">
		                                              <label>
		                                                  <input type="radio" name="sex" id="optionsRadios2" value="여">
		                                                 	여			
		                                              </label>
		                                          </div>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">차량번호</label>
											<div class="col-lg-7">
												<input type="hidden" id="carNo" name="carNo" maxlength="10">
												<input type="text" id="carnumber" name="carnumber" class="form-control" maxlength="10" required="required">
											</div>
											<div class="col-lg-3">
												<button type="button" class="btn" onclick="checkcarNo()">중복검사</button>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">연락처</label>
											<div class="col-lg-10">
												<input type="text" id="tel" name="tel" class="form-control" pattern='[0-9]{9,11}' required="required" >
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">고객관리</label>
											<div class="col-lg-10">
												<input type="text" id="birthday" name="birthday" class="form-control"  maxlength="20" readonly="readonly">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">차종</label>
											<div class="col-lg-10">
												<input type="hidden" id="manufacturer" name="manufacturer" class="form-control" required="required">
												<input type="hidden" id="automobile" name="automobile" class="form-control" required="required">
												<input type="text" id="justlook" name="justlook" class="form-control" data-toggle="modal" data-target="#myModal" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">방문동기</label>
											<div class="col-lg-10">
												<select id="motivation" name="motivation" class="form-control" required="required">
													<option value="">선택하세요</option>
													<option value="지인소개">지인소개</option>
													<option value="온라인">온라인</option>
													<option value="오프라인">오프라인</option>
													<option value="이벤트">이벤트</option>
													<option value="기타">기타</option>
												</select>  
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">색상</label>
											<div class="col-lg-10">
												<input type="text" id="color" name="color" maxlength="20" class="form-control">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">관리자메모</label>
											<div class="col-lg-10">
												<input type="text" id="memo" name="memo" class="form-control" maxlength="100">
											</div>
										</div>
										
										<!-- Buttons -->
										<div class="form-group">
											<!-- Buttons -->
											<div class="col-lg-offset-2 col-lg-9">
												<button type="submit" class="btn btn-primary">등록</button>
												<button type="button" class="btn btn-danger" onclick="javascript:history.back();">취소</button>
												<button type="reset" class="btn btn-default">초기화</button>
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
        <h4 class="modal-title">차종등록</h4>
      </div>
      <div class="modal-body">
      <form id="vehicleForm" class="form-horizontal">
      
      	<div class="form-group">
			<label class="control-label col-lg-2" for="tags">제조사</label>
			<div class="col-lg-10">
				<select id="menu_1" class="form-control" onchange="getautomobile(this.value)">
		      		<option value="">선택하세요</option>
		        	<c:forEach var="brand" items="${manufacturers}">
						<option value="${brand.num}">${brand.brand}</option>
					</c:forEach>
        		</select>
			</div>
		</div>
      	
      	<div class="form-group">
			<label class="control-label col-lg-2" for="tags">차종</label>
			<div class="col-lg-10">
				<select id="menu_2" class="form-control"></select>
			</div>
		</div>
        <div class="form-group">
			<div class="col-lg-offset-2 col-lg-9">
				<button type="button" onclick="vehicle()" class="btn btn-default">등록</button>
			</div>
		</div>
        
      </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script>
	
	//datepicker
	$('#birthday').daterangepicker({
		startDate : '1990-01-01',
		singleDatePicker: true,
	    showDropdowns: true,
		locale : {
			format : 'YYYY-MM-DD'
		}
	});
	
	$("#myModal").on('hidden.bs.modal', function () {
		$('#menu_2').html('');
		$("form").each(function() {  
			if(this.id == "vehicleForm") this.reset();  
		});  
	});
	
	function getautomobile(manufacturer){
		$('#menu_2').html('');
		$.ajax({
			url:'/management/getautomobile',
			data:{ 'manufacturer' : manufacturer },
			type: "post",
			dataType :'json',
			success:function(data){
				$.each(data, function( index, value ) {
					$('#menu_2').append($('<option/>', { value: value.num , text : value.name }) );
				});
			},error:function(){
				
			}	
		});
	}
	
	function vehicle(){
		var manufacturer = $('#menu_1').val();
		var automobile = $('#menu_2').val();
		
		$('#manufacturer').val(manufacturer);
		$('#automobile').val(automobile);
		$('#justlook').val($('#menu_2 option:selected').text());
		
		$('#myModal').modal('hide');
	}
	
	function checkcarNo(){
		
		if($('#carnumber').val()==null||$('#carnumber').val()==''||$('#carnumber').val().length<5){
			alert('차량번호를 입력해주세요.');
			return false;
		}
		var cn = $.trim( $('#carnumber').val() );
		$.ajax({
			url:'/management/carNo',
			data:{ 'carnumber' : cn.replace(/ /g, '') },
			type: "post",
			dataType :'json',
			success:function(data){
				if(data=='0'){
					$('#carNo').val( $('#carnumber').val() );
					alert('등록가능한 차량번호입니다.');
				}else{
					$('#carNo').val( '' );
					alert('존재하는 차량번호입니다.');
				}
			},error:function(){
				
			}	
		});
	}
	
	function fn_onsubmit(){
		var carNo = $('#carNo').val();
		if( carNo==null || carNo=='' ){
			alert('차량번호 중복검사를 해주세요.');
			return false;
		}
		return true;
	}
</script>