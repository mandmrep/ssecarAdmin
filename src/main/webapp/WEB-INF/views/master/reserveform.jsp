<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> 관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>예약관리</li>
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
									<form class="form-horizontal" action="/master/reserve" method="post" onsubmit="return check()">
										<input type="hidden" id="fno" name="fno" value="${fno}">

										<div class="form-group">
											<label class="control-label col-lg-2" for="title">예약일</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="date" name="date" value="${date}" readonly="readonly">
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
											<label class="control-label col-lg-2">고객No</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id=customernum name="customernum" value="${num}" readonly="readonly">
												고객명을 입력하면 자동으로 입력됩니다.
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">고객명</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="name" name="name" value="${name}" required="required" data-toggle="modal" data-target="#customerModal">
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-lg-2" for="tel">전화번호</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="tel" name="tel" value="${tel}" pattern='[0-9]{9,11}' required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="temp">차종</label>
											<div class="col-lg-10">
												<input type="hidden" id="manufacturer" name="manufacturer">
												<input type="hidden" id="vehicle" name="vehicle" required="required" readonly="readonly" >
												<input type="text" id="temp" name="temp" required="required" readonly="readonly" class="form-control" data-toggle="modal" data-target="#myModal">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="service">서비스명</label>
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
											<label class="control-label col-lg-2" for="color">예약구분</label>
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
											<label class="control-label col-lg-2" for="motivation">예약경로</label>
											<div class="col-lg-10">
												<select class="form-control" id="motivation" name="motivation" required="required">
													<option value="">선택하세요</option>
													<option value="지인소개">지인소개</option>
													<option value="온라인">온라인</option>
													<option value="오프라인">오프라인</option>
													<option value="이벤트">이벤트</option>
													<option value="콜센터">콜센터</option>
													<option value="기타">기타</option>
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
												<button type="submit" class="btn btn-primary">등록</button>
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

<div id="customerModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">고객검색</h4>
      </div>
      <div class="modal-body">
      <form id="customerForm" class="form-horizontal" onsubmit="return false;">
      
      	
			<div id="#search_div">
				<select id="menu_3" class="search_qna">
		      		<option value="">선택하세요</option>
		      		<option value="name">고객명</option>
		      		<option value="tel">연락처</option>
		      		<option value="carnumber">차량번호</option>
        		</select>
        		<input type="text" id="search" name="search" class="search_qna">
        		<button type="button" onclick="getCustomer()" class="search_btn">검색</button>
			</div>

		
		
      </form>
        <hr>
        <div style="overflow: scroll; height: 300px;">
        	<table id="customerTable" class="table table-striped table-advance table-hover">
        		
        		<tbody>
					<tr>
						<th><i class="icon_calendar"></i> 고객명</th>
						<th><i class="icon_calendar"></i> 연락처</th>
						<th><i class="icon_mail_alt"></i> 차종</th>
						<th><i class="icon_mail_alt"></i> 차량번호</th>
					</tr>
				</tbody>
        	</table>
        </div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script>
	//datepicker
	$('#date').daterangepicker(singleoption);
	$("#start").val("${time}").attr("selected", "selected");
	
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
		var fno = $('#fno').val();
		if(redate==null || redate ==''){
			alert('예약일을 선택해주세요.');
			return false;
		}
		
		$.ajax({
			url:'/master/duplicate',
			data:{ 
				'time' : retime,
				'date' : redate,
				'fno' : fno
			},
			type: "post",
			dataType :'text',
			success:function(data){
				console.log(data);
				if(data == 1){
					alert('예약이 잡혀있는 시간대입니다.');
					$('#start').val('');
				}
			},error:function(){
				alert('error');
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
	
	function getCustomer(){
		$('#customerTable > tbody > tr').not(':eq(0)').remove();
		
		var division = $('#menu_3').val();
		var search = $('#search').val();
		var fno = $('#fno').val();
		
		if(division == null || division == ''){
			alert('구분을 선택하세요.');
			return false;
		}
		
		if(search == null || search == ''){
			alert('검색어를 입력하세요.');
			return false;
		}
		
		var html = '';
		$.ajax({
			url:'/master/getCustomer',
			data:{ 
				'division' : division,
				'search' : search,
				'fno' : fno
			},
			type: 'post',
			dataType :'json',
			success:function(data){
				for(var i = 0;i<data.length;i++){
					html += '<tr>'+
						   '<td onclick="getname(this,'+data[i].num+')"><a>'+data[i].name+'</a></td>'+
						   '<td>'+data[i].tel+'</td>'+
						   '<td>'+data[i].car+'</td>'+
						   '<td>'+data[i].carnumber+'</td>'+
						   '</tr>';
				}
				$('#customerTable').append(html);
			},error:function(){
				
			}
		});
	}
	
	function newcustomer(){
		$('#name').val('신규고객');
		$('#customerModal').modal('hide');
	}
	
	$('#name').click(function(){
		$('#customerModal').modal({keyboard: false});
	});
	
	function getname(name,num){
		$('#name').val($(name).text());
		$('#customernum').val(num);
		$('#customerModal').modal('hide');
	}
</script>