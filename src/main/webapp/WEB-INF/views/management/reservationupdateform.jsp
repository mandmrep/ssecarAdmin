<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> 관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>예약관리 수정</li>
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
									<form class="form-horizontal" action="/management/reserveUpdate" method="post" onsubmit="return check()">
										<input type="hidden" name="num" value="${ updateInfo.num  }">
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="title">예약일</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="date" name="date" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">예약시간</label>
											<div class="col-lg-10">
												<select id="start" name="start" class="form-control" required="required" onchange="duplicate(this.value)">
													<option value="">- 선택하세요 -</option>
													<option value="09:00-10:00">09:00</option>
													<option value="10:00-11:00">10:00</option>
													<option value="11:00-12:00">11:00</option>
													<option value="12:00-13:00">12:00</option>
													<option value="13:00-14:00">13:00</option>
													<option value="14:00-15:00">14:00</option>
													<option value="15:00-16:00">15:00</option>
													<option value="16:00-17:00">16:00</option>
													<option value="17:00-18:00">17:00</option>
													<option value="18:00-19:00">18:00</option>
													<option value="19:00-20:00">19:00</option>
													<option value="20:00-21:00">20:00</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">고객명</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="name" name="name" required="required">
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">전화번호</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="tel" name="tel" pattern='[0-9]{9,11}' required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">차종</label>
											<div class="col-lg-10">
												<input type="hidden" id="manufacturer" name="manufacturer">
												<input type="hidden" id="vehicle" name="vehicle" required="required" readonly="readonly" >
												<input type="text" id="temp" name="temp" required="required" readonly="readonly" class="form-control" data-toggle="modal" data-target="#myModal">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">서비스명</label>
											<div class="col-lg-10">
												<select class="form-control" id="service" name="service" required="required">
													<option value="">선택하세요</option>
													<c:forEach var="product" items="${products}">
														<option value="${product.num}">${product.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">방문동기</label>
											<div class="col-lg-10">
												<select class="form-control" id="motivation" name="motivation" required="required">
													<option value="">선택하세요</option>
													<option value="지인소개">지인소개</option>
													<option value="온라인">온라인</option>
													<option value="오프라인">오프라인</option>
													<option value="이벤트">이벤트</option>
													<option value="기존고객">기존고객</option>
													<option value="기타">기타</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">예약구분</label>
											<div class="col-lg-10">
												<select class="form-control" id="color" name="color" required="required">
													<option value="purple">스팀</option>
													<option value="red">안내</option>
													<option value="yellow">완료</option>
													<option value="blue">예약</option>
													<option value="black">취소</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">비고</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="memo" name="memo">
											</div>
										</div>

										<!-- Buttons -->
										<div class="form-group">
											<!-- Buttons -->
											<div class="col-lg-offset-2 col-lg-9">
												<button type="submit" class="btn btn-primary">수정</button>
												<button type="button" class="btn btn-danger" onclick="javascript:history.back()">취소</button>
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
<!-- Modal -->
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
		        	<c:forEach var="brand" items="${manufacturer}">
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
        
      </form>
        
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="vehicle()" class="btn btn-default">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script>
var updateInfo = '${updateInfo}';

$('#start').val('${updateInfo.start}');
$('#name').val('${updateInfo.name}');
$('#tel').val('${updateInfo.tel}');
$('#manufacturer').val('${updateInfo.manufacturer}');
$('#vehicle').val('${updateInfo.vehicle}');
$('#temp').val('${updateInfo.temp}');
$('#service').val('${updateInfo.service}');
$('#motivation').val('${updateInfo.motivation}');
$('#memo').val('${updateInfo.memo}');
$('#color').val('${updateInfo.color}');

//datepicker
$('#date').daterangepicker({
	startDate : '${updateInfo.date}',
	singleDatePicker: true,
	showDropdowns: true,
	locale : {
		format : 'YYYY-MM-DD',
		daysOfWeek :["일","월","화","수","목","금","토"],
		monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월 ","10월","11월","12월"]				           
	}
});

function vehicle(){
	var manu = $('#menu_1').val();
	var carvalue = $('#menu_2').val();
	var carname = $('#menu_2 option:selected').text();
	$('#manufacturer').val(manu);
	$('#vehicle').val(carvalue);
	$('#temp').val(carname);
	$('#myModal').modal('hide');
}

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

function duplicate(time){
	var redate = $('#date').val();
	var retime = time;
	
	if(redate==null || redate ==''){
		alert('예약일을 선택해주세요.');
		return false;
	}
	
	$.ajax({
		url:'/management/duplicate',
		data:{ 
			'time' : retime,
			'date' : redate
		},
		type: "post",
		dataType :'text',
		success:function(data){
			if(data == 1){
				alert('예약이 잡혀있는 시간대입니다.');
				$('#start').val('');
			}
		},error:function(){
			
		}
			
	});
}

function check(){
	if($('#temp').val()==null || $('#temp').val()==''){
		alert('차종을 선택해주세요.');
		return false;
	}
	return true;
}
</script>