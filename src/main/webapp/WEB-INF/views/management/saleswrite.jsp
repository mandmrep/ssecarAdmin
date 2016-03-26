<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.search_qna{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px;
	width: 100px;
}
#search_div{
	float: right;
}
.search_btn{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px;
}
</style>
<section id="main-content">
	<section class="wrapper">
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>매출등록</li>
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
									<form class="form-horizontal" action="/management/saleswriteAction" method="post" onsubmit="return check()">
										<input type="hidden" id="customernum" name="customernum">
										<div class="form-group">
											<label class="control-label col-lg-2" for="title">지점명</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" value="${franchise.name}" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">일시</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="date" name="date" readonly="readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">고객명</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="name" name="name" readonly="readonly">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">제품구분</label>
											<div class="col-lg-10">
												<select class="form-control" id="division" name="division" required="required" onchange="getService(this.value)">
													<option value="">선택하세요</option>
													<option value="서비스">서비스</option>
													<option value="제품">제품</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">서비스/제품명</label>
											<div id="servicedivision" class="col-lg-10">
												<select class="form-control" id="service" name="service" required="required">
													<option value="">선택하세요</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">현금</label>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="cash" name="cash" pattern='^[0-9]*$' maxlength="20">
											</div>
											<label class="control-label col-lg-2">카드</label>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="card" name="card" pattern='^[0-9]*$' maxlength="20">
											</div>
											<!-- <label class="control-label col-lg-2">기타</label>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="etc" name="etc" pattern='^[0-9]*$' maxlength="20">
											</div> -->
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2">온라인</label>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="online" name="online" pattern='^[0-9]*$' maxlength="20">
											</div>
											<label class="control-label col-lg-2">소셜</label>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="social" name="social" pattern='^[0-9]*$' maxlength="20">
											</div>
											<label class="control-label col-lg-2">쿠폰</label>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="coupon" name="coupon" pattern='^[0-9]*$' maxlength="20">
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
        <h4 class="modal-title">고객검색</h4>
      </div>
      <div class="modal-body">
      <form id="customerForm" class="form-horizontal" onsubmit="return false;">
      
      	
			<div id="#search_div">
				<select id="menu_1" class="search_qna">
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
        <div>
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

	$("#myModal").on('hidden.bs.modal', function () {
		$('#customerTable > tbody > tr').not(':eq(0)').remove();
		$("form").each(function() {  
			if(this.id == "customerForm") this.reset();  
		});  
	});
	
	//datepicker
	$('#date').daterangepicker({
		singleDatePicker: true,
        showDropdowns: true,
		locale : {
			format : 'YYYY-MM-DD'
		}
	},
	function(start, end, label) {
		$('#start').val('');
    });
	
	function getCustomer(){
		$('#customerTable > tbody > tr').not(':eq(0)').remove();
		
		var division = $('#menu_1').val();
		var search = $('#search').val();
		
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
			url:'/management/getCustomer',
			data:{ 
				'division' : division,
				'search' : search
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
	
	function getname(name,num){
		$('#name').val($(name).text());
		$('#customernum').val(num);
		$('#myModal').modal('hide');
	}
	
	function getService(division){
		/* if(kdivision =='custom'){
			$('#servicedivision').html("<input type=text id='service' name='service' class='form-control' maxlength=''")
		}else{
			
		} */
		$('#service option').not(':eq(0)').remove();
		$.ajax({
			url:'/management/getService',
			data:{ 
				'division' : division
			},
			type: 'post',
			dataType :'json',
			success:function(data){
				$.each(data, function( index, value ) {
					$('#service').append($('<option/>', { value: value.num , text : value.name }) );
				});
			},error:function(){
				
			}
		});
	}
	
	function newcustomer(){
		$('#name').val('신규고객');
		$('#myModal').modal('hide');
	}
	
	$('#name').click(function(){
		$('#myModal').modal({keyboard: false});
	});
	
	function check(){
		var name = $('#name').val();
		if(name ==null || name == ''){
			alert('고객명을 입력해주세요.');
			return false;
		}
		return true;
	}
</script>